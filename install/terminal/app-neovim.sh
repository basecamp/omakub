cd /tmp
wget -O nvim https://github.com/neovim/neovim/releases/download/stable/nvim-linux-x86_64.appimage
chmod +x nvim
sudo mv nvim /usr/local/bin/
cd -

# Only attempt to set configuration if Neovim has never been run
if [ ! -d "$HOME/.config/nvim" ]; then
	# Use LazyVim
	git clone https://github.com/LazyVim/starter ~/.config/nvim
	# Remove the .git folder, so you can add it to your own repo later
	rm -rf ~/.config/nvim/.git

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
