wget -qO - https://typora.io/linux/public-key.asc | sudo tee /etc/apt/trusted.gpg.d/typora.asc
sudo add-apt-repository -y 'deb https://typora.io/linux ./'
sudo nala update
sudo nala install -y typora

# Add iA Typora theme
mkdir -p ~/.config/Typora/themes
cp ~/.local/share/omakub/themes/typora/ia_typora.css ~/.config/Typora/themes/
cp ~/.local/share/omakub/themes/typora/ia_typora_night.css ~/.config/Typora/themes/
