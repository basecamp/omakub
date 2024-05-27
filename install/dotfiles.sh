# Ensure .config exists
mkdir -p ~/.config

# Link all dotfiles
for entry in ~/.local/share/omakub/dotfiles/*; do
	# Link all root files as .file in ~/
	# Any existing files will be renamed .bak
	if [ -f $entry ]; then
		target=~/."$(basename $entry)"

		if [ -e $target ] && [ "$(readlink $target)" != $entry ]; then
			mv $target $target.bak
		fi

		if [ ! -e $target ]; then
			ln -s $entry $target
		fi
	fi

	# Link all directories in ~/.config/
	# Any existing directories will be renamed .bak
	if [ -d $entry ]; then
		target=~/.config/"$(basename $entry)"

		if [ -e $target ] && [ "$(readlink "$target")" != $entry ]; then
			mv $target $target.bak
		fi

		if [ ! -e $target ]; then
			ln -s $entry $target
		fi
	fi
done
unset entry
