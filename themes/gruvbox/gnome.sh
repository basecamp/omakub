#!/bin/bash

OMAKUB_THEME_COLOR="olive"

# Set GNOME theme
gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
gsettings set org.gnome.desktop.interface cursor-theme 'Yaru'
gsettings set org.gnome.desktop.interface gtk-theme "Yaru-$OMAKUB_THEME_COLOR-dark"
gsettings set org.gnome.desktop.interface icon-theme "Yaru-$OMAKUB_THEME_COLOR"
gsettings set org.gnome.desktop.interface accent-color "$OMAKUB_THEME_COLOR" 2>/dev/null || true
gsettings set org.gnome.shell.extensions.user-theme name "Yaru-$OMAKUB_THEME_COLOR-dark"

# Set GNOME extensions theme
gsettings set org.gnome.shell.extensions.tophat meter-fg-color "#78ab50"
