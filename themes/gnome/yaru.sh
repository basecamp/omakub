gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
gsettings set org.gnome.desktop.interface cursor-theme 'Yaru'
gsettings set org.gnome.desktop.interface gtk-theme 'Yaru-purple-dark'
gsettings set org.gnome.desktop.interface icon-theme 'Yaru-purple'

OMAKUB_DEFAULT_BACKGROUND_IMAGE_PATH="$HOME/.local/share/omakub/backgrounds/80s-retro-tropical-sunset-by-freepik.jpg"
gsettings set org.gnome.desktop.background picture-uri $OMAKUB_DEFAULT_BACKGROUND_IMAGE_PATH
gsettings set org.gnome.desktop.background picture-uri-dark $OMAKUB_DEFAULT_BACKGROUND_IMAGE_PATH
