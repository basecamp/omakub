# Only attempt to set configuration if none is present
if [ ! -d "$HOME/.config/zellij/config.kdl" ]; then
  mkdir -p ~/.config/zellij/themes
  cp ~/.local/share/omakase-blue/configs/zellij.kdl ~/.config/zellij/config.kdl
fi
