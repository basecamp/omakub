# Only attempt to set configuration if none is present
if [ ! -d "$HOME/.config/bottom" ]; then
  mkdir -p ~/.config/bottom
  cp ~/.local/share/omakase-bluefin/configs/bottom.toml ~/.config/bottom/bottom.toml
fi
