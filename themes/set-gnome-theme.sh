#!/bin/bash

gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
gsettings set org.gnome.desktop.interface cursor-theme 'Yaru'
gsettings set org.gnome.desktop.interface gtk-theme "Yaru-$OMAKUB_THEME_COLOR-dark"
gsettings set org.gnome.desktop.interface icon-theme "Yaru-$OMAKUB_THEME_COLOR"
gsettings set org.gnome.desktop.interface accent-color "$OMAKUB_THEME_COLOR" 2>/dev/null || true

BACKGROUND_DEST_DIR="$HOME/.config/omakub/current/background"

if [ ! -d "$BACKGROUND_DEST_DIR" ]; then mkdir -p "$BACKGROUND_DEST_DIR"; fi

ln -snf $HOME/.config/omakub/themes/$OMAKUB_THEME_BACKGROUND $HOME/.config/omakub/current/background

gsettings set org.gnome.desktop.background picture-uri $HOME/.config/omakub/current/background
gsettings set org.gnome.desktop.background picture-uri-dark $HOME/.config/omakub/current/background
gsettings set org.gnome.desktop.background picture-options 'zoom'
