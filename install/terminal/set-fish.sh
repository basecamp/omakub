# Apparently, fish creates this be default, so we overwrite it.
[ -f "~/.config/fish/config.fish" ] && mv ~/.config/fish/config.fish ~/.config/fish/config.fish.bak
cp ~/.local/share/omakase-blue/configs/fish/config.fish ~/.config/fish/config.fish
if [ ! -d "$HOME/.config/fish/functions/fish_command_not_found.fish" ]; then
  mkdir -p ~/.config/fish/functions
  cp ~/.local/share/omakase-blue/configs/fish/fish_command_not_found.fish ~/.config/fish/functions/fish_command_not_found.fish
fi

# Set up completions
if [ ! -d "$HOME/.config/fish/completions" ]; then
  mkdir -p ~/.config/fish/completions
  cp -r ~/.local/share/omakase-bluefin/configs/fish/completions/*.fish ~/.config/fish/completions/
fi

# Set as default shell
chsh --shell /usr/bin/fish
