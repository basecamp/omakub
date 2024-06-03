if [ -n "$FORCE" ] || [ ! -f "~/.XCompose" ]; then
	cp $OMAKUB_PATH/configs/xcompose ~/.XCompose
	ibus restart
	gsettings set org.gnome.desktop.input-sources xkb-options "['compose:caps']"
fi
