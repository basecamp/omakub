if [ ! -d "$HOME/.config/sway/config" ]; then
  mkdir -p ~/.config/sway
  cp ~/.local/share/omakase-blue/configs/sway/config ~/.config/sway/config
fi
if [ ! -d "$HOME/.config/swaylock/config" ]; then
  mkdir -p ~/.config/swaylock
  cp ~/.local/share/omakase-blue/configs/swaylock/config ~/.config/swaylock/config
fi
