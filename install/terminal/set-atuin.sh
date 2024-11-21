# Only attempt to set configuration if none is present
if [ ! -d "$HOME/.config/atuin" ]; then
  mkdir -p ~/.config/atuin
  cp ~/.local/share/omakase-bluefin/configs/atuin.toml ~/.config/atuin/config.toml
fi
