if ! command -v alacritty &>/dev/null; then
	sudo apt install -y alacritty
	mkdir -p ~/.config/alacritty
	cp $OMAKUB_PATH/configs/alacritty.toml ~/.config/alacritty/alacritty.toml
	cp $OMAKUB_PATH/configs/alacritty/theme.toml ~/.config/alacritty/theme.toml
	cp $OMAKUB_PATH/configs/alacritty/font.toml ~/.config/alacritty/font.toml
fi
