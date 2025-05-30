#!/bin/bash
# Install Firefox Nightly
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
OMAKUB_PATH="${OMAKUB_PATH:-$SCRIPT_DIR/../../..}"
source "$OMAKUB_PATH/src/utils/firefox-helpers.sh"
NIGHTLY_URL="https://download.mozilla.org/?product=firefox-nightly-latest-ssl&os=linux64&lang=en-US"
download_and_extract "Firefox Nightly" "$NIGHTLY_URL" "firefox-nightly" "firefox-nightly" "Firefox Nightly" "Web Browser (Nightly)"
