#!/bin/bash

# Setup theme links
if [ -d ~/.config/omakub/themes ]; then
  rm -rf ~/.config/omakub/themes
fi
mkdir -p ~/.config/omakub/themes
for f in ~/.local/share/omakub/themes/*; do ln -s "$f" ~/.config/omakub/themes/; done

# Set initial theme
mkdir -p ~/.config/omakub/current
ln -snf ~/.config/omakub/themes/tokyo-night ~/.config/omakub/current/theme
ln -snf $(find "$HOME/.config/omakub/current/theme/backgrounds/" -type f | head -n 1) "$HOME/.config/omakub/current/background"

# Set specific app links for current theme
ln -snf ~/.config/omakub/current/theme/neovim.lua ~/.config/nvim/lua/plugins/theme.lua

mkdir -p ~/.config/btop/themes
ln -snf ~/.config/omakub/current/theme/btop.theme ~/.config/btop/themes/current.theme


