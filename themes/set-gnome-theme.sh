#!/bin/bash

source "${OMAKUB_PATH:-$HOME/.local/share/omakub}/install/lib/compat.sh"

gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
gsettings set org.gnome.desktop.interface cursor-theme 'Yaru'

# Yaru reshuffles its accent variants between releases: 26.04 dropped "bark" and
# "viridian" for "wartybrown" and "yellow". Resolve to a variant that is installed,
# otherwise Gnome silently falls back to stock Ubuntu orange.
if YARU_VARIANT=$(yaru_variant_for "$OMAKUB_THEME_COLOR"); then
	gsettings set org.gnome.desktop.interface gtk-theme "Yaru-$YARU_VARIANT-dark"
	gsettings set org.gnome.desktop.interface icon-theme "Yaru-$YARU_VARIANT"
else
	omakub_note "Yaru has no $OMAKUB_THEME_COLOR variant on $(omakub_ubuntu_codename), using the default"
	gsettings set org.gnome.desktop.interface gtk-theme "Yaru-dark"
	gsettings set org.gnome.desktop.interface icon-theme "Yaru"
fi

# Gnome 47+ takes an accent from a fixed enum whose names only partly overlap Yaru's
if GNOME_ACCENT=$(gnome_accent_for "$OMAKUB_THEME_COLOR"); then
	gsettings_set_if_available org.gnome.desktop.interface accent-color "$GNOME_ACCENT"
fi

BACKGROUND_ORG_PATH="$HOME/.local/share/omakub/themes/$OMAKUB_THEME_BACKGROUND"
BACKGROUND_DEST_DIR="$HOME/.local/share/backgrounds"
BACKGROUND_DEST_PATH="$BACKGROUND_DEST_DIR/$(echo $OMAKUB_THEME_BACKGROUND | tr '/' '-')"

if [ ! -d "$BACKGROUND_DEST_DIR" ]; then mkdir -p "$BACKGROUND_DEST_DIR"; fi

[ ! -f $BACKGROUND_DEST_PATH ] && cp $BACKGROUND_ORG_PATH $BACKGROUND_DEST_PATH
gsettings set org.gnome.desktop.background picture-uri $BACKGROUND_DEST_PATH
gsettings set org.gnome.desktop.background picture-uri-dark $BACKGROUND_DEST_PATH
gsettings set org.gnome.desktop.background picture-options 'zoom'
