if ! command -v gnome-tweak-tool &>/dev/null; then
	sudo apt install -y gnome-tweak-tool
fi

# FIXME: Only do this on Framework laptops or similar displays
gsettings set org.gnome.desktop.interface text-scaling-factor 0.8
