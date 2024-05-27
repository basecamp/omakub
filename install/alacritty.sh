if ! command -v alacritty &>/dev/null; then
	sudo apt install -y alacritty
	mkdir -p ~/.config/alacritty
	cp ~/.local/share/omakub/configs/alacritty.toml ~/.config/alacritty/alacritty.toml
fi
