git clone https://github.com/neovim/neovim
cd neovim
git checkout stable
make CMAKE_BUILD_TYPE=Release
make install
cd ..
rm -rf neovim
cd .

if [ ! -d "$HOME/.config/nvim" ]; then
	git clone https://github.com/LazyVim/starter ~/.config/nvim
	cp ~/.local/share/omakub/themes/neovim/tokyo-night.lua ~/.config/nvim/lua/plugins/theme.lua
fi
