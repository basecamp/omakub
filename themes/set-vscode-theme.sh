#!/bin/bash

CODE_NODE_OPTIONS="${NODE_OPTIONS:+$NODE_OPTIONS }--no-deprecation"

if command -v code &>/dev/null; then
  NODE_OPTIONS="$CODE_NODE_OPTIONS" code --install-extension "$VSC_EXTENSION" >/dev/null
  sed -i "s/\"workbench.colorTheme\": \".*\"/\"workbench.colorTheme\": \"$VSC_THEME\"/g" ~/.config/Code/User/settings.json
fi
