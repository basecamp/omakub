#!/bin/bash

choice=$(gum choose {7..14} "<< Back" --height 11 --header "Choose your terminal font size")

if [[ $choice =~ ^[0-9]+$ ]]; then
	sed -i "s/^size = .*$/size = $choice/g" ~/.config/alacritty/font-size.toml

	OMAKUB_CURRENT_FONT=$(gsettings get org.gnome.desktop.interface font-name | tr -d "'")
	OMAKUB_FONT_NAME="${OMAKUB_CURRENT_FONT% [0-9]*}"
	gsettings set org.gnome.desktop.interface font-name "'$OMAKUB_FONT_NAME $choice'"
	gsettings set org.gnome.desktop.interface monospace-font-name "'$OMAKUB_FONT_NAME Mono $choice'"
	source "$OMAKUB_PATH/themes/set-qt6-theme.sh"

	source $OMAKUB_PATH/bin/omakub-sub/font-size.sh
else
	source $OMAKUB_PATH/bin/omakub-sub/font.sh
fi
