gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
gsettings set org.gnome.desktop.interface cursor-theme 'Yaru'
gsettings set org.gnome.desktop.interface gtk-theme 'Yaru-magenta-dark'
gsettings set org.gnome.desktop.interface icon-theme 'Yaru-magenta'

OMAKUB_DEFAULT_BACKGROUND_IMAGE_PATH="$OMAKUB_PATH/backgrounds/catppuccintotoro.png"
gsettings set org.gnome.desktop.background picture-uri $OMAKUB_DEFAULT_BACKGROUND_IMAGE_PATH
gsettings set org.gnome.desktop.background picture-uri-dark $OMAKUB_DEFAULT_BACKGROUND_IMAGE_PATH
gsettings set org.gnome.desktop.background picture-options 'zoom'
