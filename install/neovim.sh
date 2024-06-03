if [ -n "$FORCE" ] || ! command -v neovim &>/dev/null; then
	sudo add-apt-repository -y ppa:neovim-ppa/stable
	sudo apt update -y
	sudo apt install -y neovim
	git clone https://github.com/LazyVim/starter ~/.config/nvim
	cp $OMAKUB_PATH/themes/neovim/tokyo-night.lua ~/.config/nvim/lua/plugins/theme.lua
fi
