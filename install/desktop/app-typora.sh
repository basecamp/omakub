sudo dnf config-manager --add-repo https://typora.io/linux/Typora-fedora.repo
sudo dnf install -y typora

mkdir -p ~/.config/Typora/themes
cp ~/.local/share/omakfed/configs/typora/ia_typora.css ~/.config/Typora/themes/
cp ~/.local/share/omakfed/configs/typora/ia_typora_night.css ~/.config/Typora/themes/
