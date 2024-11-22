# Only attempt to set configuration if none is present
if [ ! -d "$HOME/.config/zellij/config.kdl" ]; then
  mkdir -p ~/.config/zellij
  cp ~/.local/share/omakase-bluefin/configs/zellij.kdl ~/.config/zellij/config.kdl
fi

