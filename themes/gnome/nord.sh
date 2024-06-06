gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
gsettings set org.gnome.desktop.interface cursor-theme 'Yaru'
gsettings set org.gnome.desktop.interface gtk-theme 'Nordic-Darker' #may not be preinstalled? can someone check
gsettings set org.gnome.desktop.interface icon-theme 'Nordic-Darker'

OMAKUB_DEFAULT_BACKGROUND_IMAGE_PATH="$HOME/.local/share/backgrounds/nord-background.png"
gsettings set org.gnome.desktop.background picture-uri $OMAKUB_DEFAULT_BACKGROUND_IMAGE_PATH
gsettings set org.gnome.desktop.background picture-uri-dark $OMAKUB_DEFAULT_BACKGROUND_IMAGE_PATH
gsettings set org.gnome.desktop.background picture-options 'zoom'
