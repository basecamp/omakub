#!/bin/bash

gum confirm "Do you want to install Starship?" && {
  source $OMAKUB_PATH/install/terminal/app-starship.sh
  cp "$OMAKUB_PATH/configs/starship.toml" ~/.config/starship.toml
} || true
