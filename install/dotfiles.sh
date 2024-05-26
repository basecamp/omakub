# Ensure .config exists
mkdir -p ~/.config

# Link all dotfiles
for entry in dotfiles/*; do
	# Link all root files as .file in ~/
	# Any existing files will be renamed .bak
	if [ -f "$entry" ]; then
		target=~/."$(basename "$entry")"
		[ -e "$target" ] && mv "$target" "$target.bak"
		ln -s "$(pwd)/$entry" "$target"
	fi

	# Link all directories in ~/.config/
	# Any existing directories will be renamed .bak
	if [ -d "$entry" ]; then
		target=~/.config/"$(basename "$entry")"
		[ -e "$target" ] && mv "$target" "$target.bak"
		ln -s "$(pwd)/$entry" "$target"
	fi
done

unset entry
