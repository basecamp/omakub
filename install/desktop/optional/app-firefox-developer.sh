#!/bin/bash
# Install Firefox Developer Edition
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
OMAKUB_PATH="${OMAKUB_PATH:-$SCRIPT_DIR/../../..}"
source "$OMAKUB_PATH/src/utils/firefox-helpers.sh"
DEVELOPER_URL="https://download.mozilla.org/?product=firefox-devedition-latest-ssl&os=linux64&lang=en-US"
download_and_extract "Firefox Developer Edition" "$DEVELOPER_URL" "firefox-developer" "firefox-developer" "Firefox Developer Edition" "Web Browser (Developer)"
