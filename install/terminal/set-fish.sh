# Only attempt to set configuration if none is present
if [ ! -d "$HOME/.config/fish" ]; then
  mkdir -p ~/.config/fish
  cp ~/.local/share/omakase-bluefin/configs/config.fish ~/.config/fish/config.fish
fi

