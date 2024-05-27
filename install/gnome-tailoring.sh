if ! command -v gnome-tweak-tool &>/dev/null; then
	sudo apt install -y gnome-tweak-tool

	gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
	gsettings set org.gnome.desktop.interface cursor-theme 'Yaru'
	gsettings set org.gnome.desktop.interface gtk-theme 'Yaru-purple-dark'
	gsettings set org.gnome.desktop.interface icon-theme 'Yaru-purple'

	# FIXME: Only do this on Framework laptops or similar displays
	gsettings set org.gnome.desktop.interface text-scaling-factor 0.8
fi
