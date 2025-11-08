#!/bin/bash

OMAKUB_THEME_COLOR="blue"
OMAKUB_THEME_BACKGROUND="flexoki-light/background.png"
source $OMAKUB_PATH/themes/set-gnome-theme.sh
gsettings set org.gnome.desktop.interface color-scheme 'prefer-light'
