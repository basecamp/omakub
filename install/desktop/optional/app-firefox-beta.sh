#!/bin/bash
# Install Firefox Beta
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
OMAKUB_PATH="${OMAKUB_PATH:-$SCRIPT_DIR/../../..}"
source "$OMAKUB_PATH/src/utils/firefox-helpers.sh"
BETA_URL="https://download.mozilla.org/?product=firefox-beta-latest-ssl&os=linux64&lang=en-US"
download_and_extract "Firefox Beta" "$BETA_URL" "firefox-beta" "firefox-beta" "Firefox Beta" "Web Browser (Beta)"
