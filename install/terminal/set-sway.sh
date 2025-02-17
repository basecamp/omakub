if [ ! -d "$HOME/.config/sway/config" ]; then
  mkdir -p ~/.config/sway
  cp ~/.local/share/omakase-blue/configs/sway/config ~/.config/sway/config
fi
if [ ! -d "$HOME/.config/swaylock/config" ]; then
  mkdir -p ~/.config/swaylock
  cp ~/.local/share/omakase-blue/configs/swaylock/config ~/.config/swaylock/config
fi
if [ ! -d "$HOME/.config/waybar/config.jsonc" ]; then
  mkdir -p ~/.config/waybar
  cp ~/.local/share/omakase-blue/configs/waybar/config.jsonc ~/.config/waybar/config.jsonc
fi
