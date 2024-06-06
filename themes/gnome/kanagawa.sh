gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
gsettings set org.gnome.desktop.interface cursor-theme 'Yaru'
gsettings set org.gnome.desktop.interface gtk-theme 'Yaru-purple-dark'
gsettings set org.gnome.desktop.interface icon-theme 'Yaru-purple'

OMAKUB_BACKGROUND_ORG_PATH="$HOME/.local/share/omakub/backgrounds/kanagawa.jpg"
OMAKUB_BACKGROUND_DEST_PATH="$HOME/.local/share/backgrounds/kanagawa.jpg"
[ ! -f $OMAKUB_BACKGROUND_DEST_PATH ] && cp $OMAKUB_BACKGROUND_ORG_PATH $OMAKUB_BACKGROUND_DEST_PATH
gsettings set org.gnome.desktop.background picture-uri $OMAKUB_BACKGROUND_DEST_PATH
gsettings set org.gnome.desktop.background picture-uri-dark $OMAKUB_BACKGROUND_DEST_PATH
gsettings set org.gnome.desktop.background picture-options 'zoom'
