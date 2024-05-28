if ! command -v gnome-tweak-tool &>/dev/null; then
	sudo apt install -y gnome-tweak-tool


# Set default UI theme
source ~/.local/share/omakub/themes/gnome/yaru-dark-purple.sh

	gsettings set org.gnome.desktop.wm.preferences num-workspaces 6

	# FIXME: Only do this on Framework laptops or similar displays
	gsettings set org.gnome.desktop.interface text-scaling-factor 0.8
fi
