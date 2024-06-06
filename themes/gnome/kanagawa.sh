gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
gsettings set org.gnome.desktop.interface cursor-theme 'Yaru'
gsettings set org.gnome.desktop.interface gtk-theme 'Kanagawa'
gsettings set org.gnome.desktop.interface icon-theme 'Kanagawa'

OMAKUB_DEFAULT_BACKGROUND_IMAGE_PATH="$HOME/.local/share/omakub/backgrounds/kanagawa.jpg"
gsettings set org.gnome.desktop.background picture-uri $OMAKUB_DEFAULT_BACKGROUND_IMAGE_PATH
gsettings set org.gnome.desktop.background picture-uri-dark $OMAKUB_DEFAULT_BACKGROUND_IMAGE_PATH
gsettings set org.gnome.desktop.background picture-options 'zoom'

