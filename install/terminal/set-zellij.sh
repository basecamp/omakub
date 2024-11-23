# Only attempt to set configuration if none is present
if [ ! -d "$HOME/.config/zellij/config.kdl" ]; then
  mkdir -p ~/.config/zellij/themes
  cp ~/.local/share/omakase-bluefin/configs/zellij.kdl ~/.config/zellij/config.kdl
  cp ~/.local/share/omakase-bluefin/selenized-dark/zellij.kdl ~/.config/zellij/themes/selenized-dark.kdl
fi
