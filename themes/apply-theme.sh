#!/bin/bash

# Apply theme script for Omakub
# Usage: apply-theme.sh <theme-name>

set -e

THEME_NAME="${1:-tokyo-night}"
OMAKUB_PATH="${OMAKUB_PATH:-$HOME/.local/share/omakub}"
THEME_DIR="$OMAKUB_PATH/themes/$THEME_NAME"

if [ ! -d "$THEME_DIR" ]; then
  echo "Error: Theme '$THEME_NAME' not found in $OMAKUB_PATH/themes/"
  exit 1
fi

echo "Applying theme: $THEME_NAME"

# Export OMAKUB_PATH for theme scripts
export OMAKUB_PATH

# Apply GNOME theme if script exists
if [ -f "$THEME_DIR/gnome.sh" ]; then
  echo "  → Applying GNOME theme..."
  bash "$THEME_DIR/gnome.sh"
fi

# Apply TopHat theme if script exists
if [ -f "$THEME_DIR/tophat.sh" ]; then
  echo "  → Applying TopHat theme..."
  bash "$THEME_DIR/tophat.sh"
fi

# Apply Alacritty theme if script exists and Alacritty config exists
if [ -f "$THEME_DIR/alacritty.toml" ]; then
  ALACRITTY_CONFIG="$HOME/.config/alacritty/theme.toml"
  if [ -f "$HOME/.config/alacritty/alacritty.toml" ]; then
    echo "  → Applying Alacritty theme..."
    cp "$THEME_DIR/alacritty.toml" "$ALACRITTY_CONFIG"
  fi
fi

# Apply Neovim theme if script exists
if [ -f "$THEME_DIR/neovim.lua" ]; then
  NVIM_THEME="$HOME/.config/nvim/lua/plugins/theme.lua"
  if [ -d "$HOME/.config/nvim" ]; then
    echo "  → Applying Neovim theme..."
    mkdir -p "$(dirname "$NVIM_THEME")"
    cp "$THEME_DIR/neovim.lua" "$NVIM_THEME"
  fi
fi

# Apply VS Code theme if script exists
if [ -f "$THEME_DIR/vscode.sh" ]; then
  if command -v code >/dev/null 2>&1; then
    echo "  → Applying VS Code theme..."
    bash "$THEME_DIR/vscode.sh"
  fi
fi

# Apply btop theme if it exists
if [ -f "$THEME_DIR/btop.theme" ]; then
  BTOP_THEME_DIR="$HOME/.config/btop/themes"
  if [ -d "$HOME/.config/btop" ]; then
    echo "  → Applying btop theme..."
    mkdir -p "$BTOP_THEME_DIR"
    cp "$THEME_DIR/btop.theme" "$BTOP_THEME_DIR/$THEME_NAME.theme"
    # Set as current theme
    if [ -f "$HOME/.config/btop/btop.conf" ]; then
      sed -i "s/^color_theme = .*/color_theme = \"$THEME_NAME\"/" "$HOME/.config/btop/btop.conf"
    fi
  fi
fi

# Apply Zellij theme if it exists
if [ -f "$THEME_DIR/zellij.kdl" ]; then
  ZELLIJ_THEME="$HOME/.config/zellij/themes/$THEME_NAME.kdl"
  if [ -d "$HOME/.config/zellij" ]; then
    echo "  → Applying Zellij theme..."
    mkdir -p "$(dirname "$ZELLIJ_THEME")"
    cp "$THEME_DIR/zellij.kdl" "$ZELLIJ_THEME"
  fi
fi

echo "✓ Theme '$THEME_NAME' applied successfully!"
