sudo apt install -y alacritty
mkdir -p ~/.config/alacritty
cp ~/.local/share/omakub/configs/alacritty.toml ~/.config/alacritty/alacritty.toml
cp ~/.local/share/omakub/configs/alacritty/theme.toml ~/.config/alacritty/theme.toml
cp ~/.local/share/omakub/configs/alacritty/font.toml ~/.config/alacritty/font.toml
sudo update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator /usr/bin/alacritty 50
