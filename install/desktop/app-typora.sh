wget -qO - https://typora.io/linux/public-key.asc | sudo tee /etc/dnf/trusted.gpg.d/typora.asc
sudo add-dnf-repository -y 'deb https://typora.io/linux ./'
sudo dnf update -y
sudo dnf install -y typora

# Add iA Typora theme
mkdir -p ~/.config/Typora/themes
cp ~/.local/share/omakub/configs/typora/ia_typora.css ~/.config/Typora/themes/
cp ~/.local/share/omakub/configs/typora/ia_typora_night.css ~/.config/Typora/themes/
