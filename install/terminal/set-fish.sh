# Only attempt to set configuration if none is present
if [ ! -d "$HOME/.config/fish" ]; then
  mkdir -p ~/.config/fish
  cp ~/.local/share/omakase-bluefin/configs/fish/config.fish ~/.config/fish/config.fish
fi
if [ ! -d "$HOME/.config/fish/functions/fish_command_not_found.fish" ]; then
  mkdir -p ~/.config/fish/functions
  cp ~/.local/share/omakase-bluefin/configs/fish/fish_command_not_found.fish ~/.config/fish/functions/fish_command_not_found.fish
fi

