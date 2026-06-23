#!/bin/bash

# Set the terminal (Alacritty) font size. Used by both the legacy bash menu
# (font-size.sh) and the Bubble Tea TUI.
#
#   set-font-size.sh <size>

size="$1"
[[ "$size" =~ ^[0-9]+$ ]] || exit 1
sed -i "s/^size = .*$/size = $size/g" ~/.config/alacritty/font-size.toml
