#!/bin/bash

OMAKUB_THEME_COLOR="blue"
OMAKUB_THEME_BACKGROUND="catppuccin-latte/background.png"
source $OMAKUB_PATH/themes/set-gnome-theme.sh
gsettings set org.gnome.desktop.interface color-scheme 'prefer-light'
