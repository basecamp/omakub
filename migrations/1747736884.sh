#!/bin/bash

# Ensure all alacritty configs have been migrated
alacritty migrate
alacritty migrate --config-file ~/.config/alacritty/btop.toml
alacritty migrate --config-file ~/.config/alacritty/pane.toml
