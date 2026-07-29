#!/bin/bash

source "${OMAKUB_PATH:-$HOME/.local/share/omakub}/install/lib/compat.sh"

# 26.04 dropped the gnome-tweak-tool transitional package
apt_install_first gnome-tweaks gnome-tweak-tool
