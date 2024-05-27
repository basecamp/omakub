if ! command -v alacritty &>/dev/null; then
	sudo apt install -y alacritty
	mkdir -p ~/.config/alacritty
	cp ~/.local/share/omakub/dotfiles/alacritty.toml ~/.config/alacritty/alacritty.toml
fi
