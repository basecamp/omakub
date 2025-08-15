#!/bin/bash

THEME_NAMES=("Tokyo Night" "Catppuccin" "Nord" "Everforest" "Gruvbox" "Kanagawa" "Ristretto" "Rose Pine" "Matte Black")
THEME=$(gum choose "${THEME_NAMES[@]}" "Default" --header "Choose your theme" --height 12 | tr '[:upper:]' '[:lower:]' | sed 's/ /-/g')

# The the new theme management feature directories are created
if [ -n "$THEME" ] && [ "$THEME" != "default" ]; then
  source $OMAKUB_PATH/install/desktop/theme.sh "$THEME"
else
  source $OMAKUB_PATH/install/desktop/theme.sh
fi
