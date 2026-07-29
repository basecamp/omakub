#!/bin/bash

# Repair an Omakub install that has been carried onto Ubuntu 26.04, which renamed
# some of the packages Omakub installs and reshuffled Yaru's accent variants.

source "${OMAKUB_PATH:-$HOME/.local/share/omakub}/install/lib/compat.sh"

echo "Reinstalling packages that were renamed in Ubuntu 26.04..."
apt_install_first gnome-tweaks gnome-tweak-tool
apt_install_first libncurses-dev libncurses5-dev
apt_install_first libvips-tools libvips

# 26.04 dropped the Yaru "bark" and "viridian" accents, so any theme using one is now
# pointing at a gtk-theme that is not installed and has fallen back to stock Ubuntu.
CURRENT_GTK_THEME=$(gsettings get org.gnome.desktop.interface gtk-theme | tr -d "'")

if [[ "$CURRENT_GTK_THEME" == Yaru-*-dark ]] && [ ! -d "/usr/share/themes/$CURRENT_GTK_THEME" ]; then
	THEME_COLOR=${CURRENT_GTK_THEME#Yaru-}
	THEME_COLOR=${THEME_COLOR%-dark}

	if YARU_VARIANT=$(yaru_variant_for "$THEME_COLOR"); then
		echo "Repointing Gnome theme from $CURRENT_GTK_THEME to Yaru-$YARU_VARIANT-dark"
		gsettings set org.gnome.desktop.interface gtk-theme "Yaru-$YARU_VARIANT-dark"
		gsettings set org.gnome.desktop.interface icon-theme "Yaru-$YARU_VARIANT"
	fi

	if GNOME_ACCENT=$(gnome_accent_for "$THEME_COLOR"); then
		gsettings_set_if_available org.gnome.desktop.interface accent-color "$GNOME_ACCENT"
	fi
fi
