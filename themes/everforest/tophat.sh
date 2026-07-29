#!/bin/bash

source "${OMAKUB_PATH:-$HOME/.local/share/omakub}/install/lib/compat.sh"

# Skipped rather than errored when TopHat is not installed
gsettings_set_if_available org.gnome.shell.extensions.tophat meter-fg-color "#78ab50"
