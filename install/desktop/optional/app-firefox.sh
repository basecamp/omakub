#!/bin/bash
# Install Firefox Stable (from APT)
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
OMAKUB_PATH="${OMAKUB_PATH:-$SCRIPT_DIR/../../..}"
source "$OMAKUB_PATH/src/utils/firefox-helpers.sh"
install_firefox_stable
