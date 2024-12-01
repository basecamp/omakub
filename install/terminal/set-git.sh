# Only attempt to set configuration if none is present
if [ ! -d "$HOME/.config/git" ]; then
  mkdir -p ~/.config/git
  cp ~/.local/share/omakase-blue/configs/git/config ~/.config/git/config
  cp ~/.local/share/omakase-blue/configs/git/attributes ~/.config/git/attributes
  cp ~/.local/share/omakase-blue/configs/git/commit-template ~/.config/git/commit-template
fi
