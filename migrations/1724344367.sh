#!/bin/bash

# Check if fastfetch config.jsonc is already set
if [ -f "$HOME/.config/fastfetch/config.jsonc" ]; then
  gum confirm "It appears that a fastfetch configuration is already set. Do you want to overwrite it?" && rm "$HOME/.config/fastfetch/config.jsonc"
fi

# Only attempt to set configuration if fastfetch is not already set
if [ ! -f "$HOME/.config/fastfetch/config.jsonc" ]; then
  # Use Omakub fastfetch config
  mkdir -p ~/.config/fastfetch
  cp "$OMAKUB_PATH/configs/fastfetch.jsonc" ~/.config/fastfetch/config.jsonc
fi
