#!/usr/bin/env bash

# Install optional apps
# shellcheck disable=SC2140
apps=$(gum choose "1password" "Spotify" "Zoom" "Dropbox" "Steam" --no-limit --selected "1password","Spotify","Zoom" --height 6 --header "Select optional apps")

for app in $apps; do
	# shellcheck disable=SC1090
	source "$OMAKUB_PATH/install/optional/app-${app,,}.sh"
done
