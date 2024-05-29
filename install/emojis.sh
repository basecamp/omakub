if [ ! -f "~/.XCompose" ]; then
	cp ~/.local/share/omakub/configs/xcompose ~/.XCompose
	gsettings set org.gnome.desktop.input-sources xkb-options ['compose:caps']
fi
