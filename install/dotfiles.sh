# Ensure .config exists
mkdir -p ~/.config

# Copy all dotfiles
for entry in ~/.local/share/omakub/dotfiles/*; do
	# Copy all root files as .file in ~/
	# Any existing files will be renamed .bak
	if [ -f $entry ]; then
		target=~/."$(basename $entry)"
		[ -e $target ] && mv $target $target.bak
		cp $entry $target
	fi

	# Copy all directories in ~/.config/
	# Any existing directories will be renamed .bak
	if [ -d $entry ]; then
		target=~/.config/"$(basename $entry)"
		[ -e $target ] && mv $target $target.bak
		cp -R $entry $target
	fi
done
unset entry
