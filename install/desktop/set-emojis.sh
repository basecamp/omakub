cp ~/.local/share/omakub/configs/xcompose ~/.XCompose
ibus restart
# If you want to enable emojis: `gsettings set org.gnome.desktop.input-sources xkb-options "['compose:caps']"`
gsettings set org.gnome.desktop.input-sources xkb-options "['caps:ctrl_modifier']"
