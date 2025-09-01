#!/bin/bash

OMAFORGE_THEME_COLOR="blue"

# Set GNOME theme
gsettings set org.gnome.desktop.interface color-scheme 'prefer-light'
gsettings set org.gnome.desktop.interface cursor-theme 'Yaru'
gsettings set org.gnome.desktop.interface gtk-theme "Yaru-$OMAFORGE_THEME_COLOR"
gsettings set org.gnome.desktop.interface icon-theme "Yaru-$OMAFORGE_THEME_COLOR"
gsettings set org.gnome.desktop.interface accent-color "$OMAFORGE_THEME_COLOR" 2>/dev/null || true
gsettings set org.gnome.shell.extensions.user-theme name "Yaru-$OMAFORGE_THEME_COLOR"

# Set GNOME extensions theme
gsettings set org.gnome.shell.extensions.tophat meter-fg-color "#1e66f5"
