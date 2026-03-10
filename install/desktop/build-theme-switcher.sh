#!/bin/bash

OMAKUB_PATH="${OMAKUB_PATH:-$HOME/.local/share/omakub}"
APP_DIR="$OMAKUB_PATH/apps/theme-switcher"
BIN="$APP_DIR/target/release/omakub-theme-switcher"
DESKTOP_SRC="$APP_DIR/omakub-theme-switcher.desktop"
DESKTOP_DST="$HOME/.local/share/applications/omakub-theme-switcher.desktop"
ICON_SRC="$OMAKUB_PATH/icons/omakub-theme-symbolic.svg"
ICON_DST="$HOME/.local/share/icons/hicolor/scalable/apps/omakub-theme-symbolic.svg"
WRAPPER_SRC="$OMAKUB_PATH/bin/omakub-theme-switcher"
WRAPPER_DST="$HOME/.local/bin/omakub-theme-switcher"

if [[ ! -d "$APP_DIR" ]]; then
  echo "Theme switcher app not found. Skipping GUI build."
  return 0
fi

# Install Rust toolchain if not present
if ! command -v cargo >/dev/null 2>&1; then
  echo "Installing Rust toolchain for theme switcher..."
  bash -c "$(curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs)" -- -y
  source "$HOME/.cargo/env"
fi

# Install GTK4 development packages if not present
if ! pkg-config --exists gtk4; then
  echo "Installing GTK4 development packages for theme switcher..."
  sudo apt install -y libgtk-4-dev
fi

echo "Building theme switcher GUI..."
(cd "$APP_DIR" && cargo build --release)

if [[ -x "$BIN" ]]; then
  echo "✓ Theme switcher GUI built"
  if [[ -f "$DESKTOP_SRC" ]]; then
    mkdir -p "$(dirname "$DESKTOP_DST")"
    cp "$DESKTOP_SRC" "$DESKTOP_DST"
    echo "✓ Theme switcher desktop entry installed"
  fi
  if [[ -f "$ICON_SRC" ]]; then
    mkdir -p "$(dirname "$ICON_DST")"
    cp "$ICON_SRC" "$ICON_DST"
    echo "✓ Theme switcher icon installed"
  fi
  if [[ -f "$WRAPPER_SRC" ]]; then
    mkdir -p "$(dirname "$WRAPPER_DST")"
    cp "$WRAPPER_SRC" "$WRAPPER_DST"
    chmod +x "$WRAPPER_DST"
    echo "✓ Theme switcher launcher installed"
  fi
fi
