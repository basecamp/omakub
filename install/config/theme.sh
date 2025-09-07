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

# Set gnome theme colors
OMAKUB_THEME_COLOR=$(<~/.config/omakub/current/theme/gnome.theme)

gsettings set org.gnome.desktop.interface color-scheme "prefer-dark"
gsettings set org.gnome.desktop.interface cursor-theme "Yaru"
gsettings set org.gnome.desktop.interface gtk-theme "Yaru-$OMAKUB_THEME_COLOR-dark"
gsettings set org.gnome.desktop.interface icon-theme "$(<~/.config/omakub/current/theme/icons.theme)"
gsettings set org.gnome.desktop.interface accent-color "$OMAKUB_THEME_COLOR" 2>/dev/null || true

# Change gnome extensions theme
gsettings set org.gnome.shell.extensions.tophat meter-fg-color "$(<~/.config/omakub/current/theme/tophat.theme)"

# Update GNOME background settings
gsettings set org.gnome.desktop.background picture-uri "$HOME/.config/omakub/current/background"
gsettings set org.gnome.desktop.background picture-uri-dark "$HOME/.config/omakub/current/background"
gsettings set org.gnome.desktop.background picture-options 'zoom'

# Set specific app links for current theme
ln -snf ~/.config/omakub/current/theme/neovim.lua ~/.config/nvim/lua/plugins/theme.lua

mkdir -p ~/.config/btop/themes
ln -snf ~/.config/omakub/current/theme/btop.theme ~/.config/btop/themes/current.theme

mkdir -p ~/.config/zellij/themes
ln -snf ~/.config/omakub/current/theme/zellij.kdl ~/.config/zellij/themes/current.kdl
