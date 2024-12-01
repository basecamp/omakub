if [ ! -d "$HOME/.config/sway/config" ]; then
  mkdir -p ~/.config/sway
  cp ~/.local/share/omakase-blue/configs/sway/config ~/.config/sway/config
fi
