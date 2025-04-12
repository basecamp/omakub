sudo dnf install gnome-keyring libgnome-keyring curl -y
mkdir -p ~/.local/share/typora
curl https://download.typora.io/linux/Typora-linux-x64.tar.gz | tar xvz -C ~/.local/share/typora 
mkdir -p ~/.local/bin
ln -s ~/.local/share/typora/bin/Typora-linux-x64/Typora ~/.local/bin/typora


# Add iA Typora theme
mkdir -p ~/.config/Typora/themes
cp ~/.local/share/omakub/configs/typora/ia_typora.css ~/.config/Typora/themes/
cp ~/.local/share/omakub/configs/typora/ia_typora_night.css ~/.config/Typora/themes/
