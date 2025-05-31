#!/bin/bash
# Install Firefox Nightly
source "$OMAKUB_PATH/utils/firefox-helpers.sh"

NIGHTLY_URL="https://download.mozilla.org/?product=firefox-nightly-latest-ssl&os=linux64&lang=en-US"
download_and_extract "Firefox Nightly" "$NIGHTLY_URL" "firefox-nightly" "firefox-nightly" "Firefox Nightly" "Web Browser (Nightly)"
