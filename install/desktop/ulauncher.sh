#!/bin/bash

source "${OMAKUB_PATH:-$HOME/.local/share/omakub}/install/lib/compat.sh"

sudo add-apt-repository universe -y

# Ulauncher is only in the PPA, so stop here with a clear message rather than a
# confusing apt failure if it has not built for this Ubuntu release yet.
if ! add_ppa_if_published ppa:agornostal/ulauncher ulauncher; then
	omakub_note "skipping Ulauncher; rerun 'omakub install' once the PPA catches up"
	return 0 2>/dev/null || exit 0
fi

sudo apt install ulauncher -y

# Start ulauncher to have it populate config before we overwrite
mkdir -p ~/.config/autostart/
cp ~/.local/share/omakub/configs/ulauncher.desktop ~/.config/autostart/ulauncher.desktop
gtk-launch ulauncher.desktop >/dev/null 2>&1
sleep 2 # ensure enough time for ulauncher to set defaults
cp ~/.local/share/omakub/configs/ulauncher.json ~/.config/ulauncher/settings.json
