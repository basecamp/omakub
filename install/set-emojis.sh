cp ~/.local/share/omakora/configs/xcompose ~/.XCompose
ibus restart
gsettings set org.gnome.desktop.input-sources xkb-options "['compose:caps']"
