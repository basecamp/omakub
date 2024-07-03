cd /tmp
wget -O nvim.tar.gz "https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz"
tar -xf nvim.tar.gz
sudo install nvim-linux64/bin/nvim /usr/local/bin/nvim
sudo cp -R nvim-linux64/lib /usr/local/
sudo cp -R nvim-linux64/share /usr/local/
rm -rf nvim-linux64 nvim.tar.gz
cd -

# Only attempt to set configuration if Neovim has never been run
if [ ! -d "$HOME/.config/nvim" ]; then
	# Use LazyVim
	git clone https://github.com/LazyVim/starter ~/.config/nvim

	# Disable update notification popup in starter config
	sed -i 's/checker = { enabled = true }/checker = { enabled = true, notify = false }/g' ~/.config/nvim/lua/config/lazy.lua

	# Make everything match the terminal transparency
	mkdir -p ~/.config/nvim/plugin/after
	cp ~/.local/share/omakub/configs/neovim/transparency.lua ~/.config/nvim/plugin/after/

	# Default to Tokyo Night theme
	cp ~/.local/share/omakub/themes/tokyo-night/neovim.lua ~/.config/nvim/lua/plugins/theme.lua

	# Enable default extras
	cp ~/.local/share/omakub/configs/neovim/lazyvim.json ~/.config/nvim/lazyvim.json
fi

# Replace desktop launcher with one running inside Alacritty
if [[ -d ~/.local/share/applications ]]; then
	sudo rm -rf /usr/share/applications/nvim.desktop
	source ~/.local/share/omakub/applications/Neovim.sh
fi
