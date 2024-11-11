wget -qO - https://typora.io/linux/public-key.asc | sudo tee /etc/apt/trusted.gpg.d/typora.asc
sudo add-apt-repository -y 'deb https://typora.io/linux ./'
sudo apt update -y
sudo apt install -y typora

# Add iA Typora theme
mkdir -p ~/.config/Typora/themes
cp ~/.local/share/omakfed/configs/typora/ia_typora.css ~/.config/Typora/themes/
cp ~/.local/share/omakfed/configs/typora/ia_typora_night.css ~/.config/Typora/themes/
