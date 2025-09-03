#!/bin/bash

sudo flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

# Base Apps
apps=(
	"Chromium"
	"Flameshot"
	"LocalSend"
	"LibreOffice"
	"Obsidian"
	"Pinta"
	"Signal"
	"Typora"
	"VLC"
	"Xournalpp"
	"1password"
	"Spotify"
)

# Install optional apps
for app in "${apps[@]}"; do
	if [[ -f "$HOME/.local/share/omakub/applications/install/${app,,}.sh" ]]; then
		source "$HOME/.local/share/omakub/applications/install/${app,,}.sh"
	else
		echo "Warning: Installation script for $app not found."
	fi
done