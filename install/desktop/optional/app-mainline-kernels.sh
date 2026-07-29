#!/bin/bash

source "${OMAKUB_PATH:-$HOME/.local/share/omakub}/install/lib/compat.sh"

if ! add_ppa_if_published ppa:cappelikan/ppa mainline; then
	omakub_note "skipping Mainline; the PPA has no build for this Ubuntu release yet"
	return 0 2>/dev/null || exit 0
fi

sudo apt install -y mainline
