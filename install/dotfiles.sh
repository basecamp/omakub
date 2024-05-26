# Ensure .config exists
mkdir -p ~/.config

# Link all dotfiles
for entry in dotfiles/*; do
	if [ -f "$entry" ]; then
		target=~/"$(basename "$entry")"
		[ -e "$target" ] && mv "$target" "$target.bak"
		ln -s "$(pwd)/$entry" "$target"
	fi

	if [ -d "$entry" ]; then
		target=~/.config/"$(basename "$entry")"
		[ -e "$target" ] && mv "$target" "$target.bak"
		ln -s "$(pwd)/$entry" "$target"
	fi
done

unset entry
