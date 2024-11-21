# Only attempt to set configuration if none is present
if [ ! -f "$HOME/.config/fastfetch/config.jsonc" ]; then
  mkdir -p ~/.config/fastfetch
  cp ~/.local/share/omakase-bluefin/configs/fastfetch.jsonc ~/.config/fastfetch/config.jsonc
fi
