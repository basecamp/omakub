#!/bin/bash

if [[ -n "$1" ]]; then
  INITIAL_THEME=$1
else
  INITIAL_THEME="tokyo-night"
fi

INITIAL_THEME="tokyo-night"

# Setup theme links
if [ -d ~/.config/omakub/themes ]; then
  rm -rf ~/.config/omakub/themes
fi

# Create themes folder into user config
mkdir -p ~/.config/omakub/themes

# Iterate all omakub themes creating/overriding symlinks for each theme into the user config themes folder
for f in ~/.local/share/omakub/themes/*; do ln -nfs "$f" ~/.config/omakub/themes/; done

# Set initial theme
mkdir -p ~/.config/omakub/current
ln -snf ~/.config/omakub/themes/$INITIAL_THEME ~/.config/omakub/current/theme
ln -snf ~/.config/omakub/current/theme/background.jpg ~/.config/omakub/current/background

# Set specific app links for current theme
ln -snf ~/.config/omakub/current/theme/alacritty.toml ~/.config/alacritty/theme.toml

ln -snf ~/.config/omakub/current/theme/zellij.kdl ~/.config/zellij/themes/$INITIAL_THEME.kdl
sed -i "s/theme \".*\"/theme \"$INITIAL_THEME\"/g" ~/.config/zellij/config.kdl

ln -snf ~/.config/omakub/current/theme/neovim.lua ~/.config/nvim/lua/plugins/theme.lua

if [ -f "~/.config/omakub/current/theme/btop.theme" ]; then
  ln -snf ~/.config/omakub/current/theme/btop.theme ~/.config/btop/themes/$INITIAL_THEME.theme
  sed -i "s/color_theme = \".*\"/color_theme = \"$INITIAL_THEME\"/g" ~/.config/btop/btop.conf
else
  sed -i "s/color_theme = \".*\"/color_theme = \"Default\"/g" ~/.config/btop/btop.conf
fi

source ~/.config/omakub/current/theme/gnome.sh
source ~/.config/omakub/current/theme/tophat.sh
source ~/.config/omakub/current/theme/vscode.sh