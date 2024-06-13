sudo apt install -y neovim

if [ ! -d "$HOME/.config/nvim" ]; then
	git clone https://github.com/LazyVim/starter ~/.config/nvim
	mkdir -p ~/.config/nvim/plugin/after
	cp ~/.local/share/omakora/configs/neovim/transparency.lua ~/.config/nvim/plugin/after/
	cp ~/.local/share/omakora/themes/neovim/tokyo-night.lua ~/.config/nvim/lua/plugins/theme.lua

	# Enable default extras
	cp ~/.local/share/omakora/configs/neovim/lazyvim.json ~/.config/nvim/lazyvim.json
fi
