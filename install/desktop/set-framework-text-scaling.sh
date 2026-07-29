#!/bin/bash

# Detection needs dmidecode and a running X or XWayland server. 26.04 has no X11
# session at all, so let both lookups come back empty rather than reporting errors
# on the machines this does not apply to.
COMPUTER_MAKER=$(sudo dmidecode -t system 2>/dev/null | awk '/Manufacturer:/ {print $2}')
SCREEN_RESOLUTION=$(xrandr 2>/dev/null | awk '/\*\+/ {print $1}')

if [ "$COMPUTER_MAKER" == "Framework" ] && [ "$SCREEN_RESOLUTION" == "2256x1504" ]; then
	gsettings set org.gnome.desktop.interface text-scaling-factor 0.8
	gsettings set org.gnome.desktop.interface cursor-size 16

	# The terminal font size lives in its own file so every Omakub terminal app shares it
	sed -i "s/^size = .*$/size = 7/" ~/.config/alacritty/font-size.toml
fi
