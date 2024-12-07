# Only attempt to set configuration if none is present
if [ ! -f "$HOME/.config/helix/config.toml" ]; then
  mkdir -p ~/.config/helix
  cp ~/.local/share/omakase-blue/configs/helix/config.toml ~/.config/helix/config.toml
  cp ~/.local/share/omakase-blue/configs/helix/languages.toml ~/.config/helix/languages.toml

	# Default to Selenized Dark
  mkdir -p ~/.config/helix/themes
	cp ~/.local/share/omakase-blue/themes/selenized-dark/helix.toml ~/.config/helix/themes/selenized_dark.toml
fi
