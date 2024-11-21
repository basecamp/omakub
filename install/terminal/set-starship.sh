# Only attempt to set configuration if none is present
if [ ! -d "$HOME/.config/starship.toml" ]; then
  cp ~/.local/share/omakase-bluefin/configs/starship.toml ~/.config/starship.toml
fi
