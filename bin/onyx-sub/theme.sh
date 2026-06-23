#!/bin/bash

THEME_NAMES=("Tokyo Night" "Catppuccin" "Nord" "Everforest" "Ristretto" "Matte Black" "Lunar Peaks" "Neon Circuit" "Forest Haven" "Castle Dusk" "Autumn Walk" "Chalk Board" "Lost Temple" "Azure Canyon")
THEME=$(gum choose "${THEME_NAMES[@]}" "<< Back" --header "Choose your theme" --height 12 | tr '[:upper:]' '[:lower:]' | sed 's/ /-/g')

if [ -n "$THEME" ] && [ "$THEME" != "<<-back" ]; then
  source $ONYX_PATH/themes/$THEME/gnome.sh
  if gsettings list-schemas 2>/dev/null | grep -q "org.gnome.shell.extensions.tophat"; then
    source $ONYX_PATH/themes/$THEME/tophat.sh
  fi
  source $ONYX_PATH/themes/$THEME/vscode.sh

  # Forgo setting the Chrome theme until we might find a less disruptive way of doing it.
  # Having to quit Chrome, and all Chrome-based apps, is too much of an inposition.
  # source $ONYX_PATH/themes/$THEME/chrome.sh
fi

source $ONYX_PATH/bin/onyx-sub/menu.sh
