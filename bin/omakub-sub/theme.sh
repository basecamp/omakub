#!/bin/bash

THEME_LIST=()
while IFS= read -r path; do
  THEME_LIST+=("$(basename "$path" | sed -E 's/(^|-)([a-z])/\1\u\2/g; s/-/ /g')")
done < <(find "$OMAKUB_PATH/themes/" -mindepth 1 -maxdepth 1 \( -type d -o -type l \) | sort)

THEME=$(gum choose "${THEME_LIST[@]}" "<< Back" --header "Choose your theme" --height "$((${#THEME_LIST[@]} + 2))" | tr '[:upper:]' '[:lower:]' | sed 's/ /-/g')

if [ -n "$THEME" ] && [ "$THEME" != "<<-back" ]; then
  cp $OMAKUB_PATH/themes/$THEME/alacritty.toml ~/.config/alacritty/theme.toml
  cp $OMAKUB_PATH/themes/$THEME/zellij.kdl ~/.config/zellij/themes/$THEME.kdl
  sed -i "s/theme \".*\"/theme \"$THEME\"/g" ~/.config/zellij/config.kdl
  if [ -d "$HOME/.config/nvim" ]; then
    cp $OMAKUB_PATH/themes/$THEME/neovim.lua ~/.config/nvim/lua/plugins/theme.lua
  fi

  if [ -f "$OMAKUB_PATH/themes/$THEME/btop.theme" ]; then
    cp $OMAKUB_PATH/themes/$THEME/btop.theme ~/.config/btop/themes/$THEME.theme
    sed -i "s/color_theme = \".*\"/color_theme = \"$THEME\"/g" ~/.config/btop/btop.conf
  else
    sed -i "s/color_theme = \".*\"/color_theme = \"Default\"/g" ~/.config/btop/btop.conf
  fi

  source $OMAKUB_PATH/themes/$THEME/gnome.sh
  source $OMAKUB_PATH/themes/$THEME/tophat.sh
  source $OMAKUB_PATH/themes/$THEME/vscode.sh
fi

source $OMAKUB_PATH/bin/omakub-sub/menu.sh