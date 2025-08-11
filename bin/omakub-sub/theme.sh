#!/bin/bash

THEME_NAMES=("Tokyo Night" "Catppuccin" "Nord" "Everforest" "Gruvbox" "Kanagawa" "Ristretto" "Rose Pine" "Matte Black")
THEME=$(gum choose "${THEME_NAMES[@]}" "<< Back" --header "Choose your theme" --height 12 | tr '[:upper:]' '[:lower:]' | sed 's/ /-/g')

CONFIG_THEMES_PATH="$HOME/.config/omakub/themes/"
CONFIG_CURRENT_THEME_PATH="$HOME/.config/omakub/current/theme"

if [ -n "$THEME" ] && [ "$THEME" != "<<-back" ]; then
  #Create the symlink from the new theme to our current theme
  ln -snf $CONFIG_THEMES_PATH/$THEME $CONFIG_CURRENT_THEME_PATH

  # Set specific app links for current theme
  ln -snf $CONFIG_CURRENT_THEME_PATH/alacritty.toml ~/.config/alacritty/theme.toml

  ln -snf $CONFIG_CURRENT_THEME_PATH/zellij.kdl ~/.config/zellij/themes/$THEME.kdl
  sed -i "s/theme \".*\"/theme \"$THEME\"/g" ~/.config/zellij/config.kdl

  ln -snf $CONFIG_CURRENT_THEME_PATH/neovim.lua ~/.config/nvim/lua/plugins/theme.lua

  if [ -f "$CONFIG_CURRENT_THEME_PATH/btop.theme" ]; then
    ln -snf $CONFIG_CURRENT_THEME_PATH/btop.theme ~/.config/btop/themes/$THEME.theme
    sed -i "s/color_theme = \".*\"/color_theme = \"$THEME\"/g" ~/.config/btop/btop.conf
  else
    sed -i "s/color_theme = \".*\"/color_theme = \"Default\"/g" ~/.config/btop/btop.conf
  fi

  source $CONFIG_CURRENT_THEME_PATH/gnome.sh
  source $CONFIG_CURRENT_THEME_PATH/tophat.sh
  source $CONFIG_CURRENT_THEME_PATH/vscode.sh

  # Forgo setting the Chrome theme until we might find a less disruptive way of doing it.
  # Having to quit Chrome, and all Chrome-based apps, is too much of an inposition.
  # source $OMAKUB_PATH/themes/$THEME/chrome.sh
fi

source $OMAKUB_PATH/bin/omakub-sub/menu.sh
