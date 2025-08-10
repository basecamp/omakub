#!/bin/bash

UNINSTALLER=$(gum choose $(ls -1 $OMAKUB_PATH/uninstall) "<< Back" --height 40)

if [[ "$UNINSTALLER" == "<< Back"* ]] || [[ -z "$UNINSTALLER" ]]; then
  # Don't uninstall anything
  echo ""
else
  [ -n "$UNINSTALLER" ] && gum confirm "Run uninstaller?" && source $UNINSTALLER && gum spin --spinner globe --title "Uninstall completed!" -- sleep 3
fi

clear
source $OMAKUB_PATH/bin/omakub
