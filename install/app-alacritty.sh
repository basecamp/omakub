# sudo apt install -y alacritty
sudo apt update && sudo apt upgrade
sudo add-apt-repository ppa:aslatter/ppa -y
sudo apt install alacritty -y

mkdir -p ~/.config/alacritty
cp ~/.local/share/omakub/configs/alacritty.toml ~/.config/alacritty/alacritty.toml
cp ~/.local/share/omakub/configs/alacritty/theme.toml ~/.config/alacritty/theme.toml
cp ~/.local/share/omakub/configs/alacritty/font.toml ~/.config/alacritty/font.toml
