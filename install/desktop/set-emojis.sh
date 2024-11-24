cp ~/.local/share/omakase-bluefin/configs/xcompose ~/.XCompose
ibus restart
gsettings set org.gnome.desktop.input-sources xkb-options "['compose:ralt']"
