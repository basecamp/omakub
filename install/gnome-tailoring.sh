if ! command -v gnome-tweak-tool &>/dev/null; then
	sudo apt install -y gnome-tweak-tool
fi

# Turn off default Ubuntu extensions
gsettings set org.gnome.shell disabled-extensions ['tiling-assistant@ubuntu.com', 'ubuntu-appindicators@ubuntu.com', 'ubuntu-dock@ubuntu.com']

# FIXME: Only do this on Framework laptops or similar displays
gsettings set org.gnome.desktop.interface text-scaling-factor 0.8
