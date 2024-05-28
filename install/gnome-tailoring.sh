if ! command -v gnome-tweak-tool &>/dev/null; then
	sudo apt install -y gnome-tweak-tool

	gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
	gsettings set org.gnome.desktop.interface cursor-theme 'Yaru'
	gsettings set org.gnome.desktop.interface gtk-theme 'Yaru-purple-dark'
	gsettings set org.gnome.desktop.interface icon-theme 'Yaru-purple'

	# Use alt for pinned apps
	gsettings set org.gnome.shell.keybindings switch-to-application-1 "['<Alt>1']"
	gsettings set org.gnome.shell.keybindings switch-to-application-2 "['<Alt>2']"
	gsettings set org.gnome.shell.keybindings switch-to-application-3 "['<Alt>3']"
	gsettings set org.gnome.shell.keybindings switch-to-application-4 "['<Alt>4']"
	gsettings set org.gnome.shell.keybindings switch-to-application-5 "['<Alt>5']"
	gsettings set org.gnome.shell.keybindings switch-to-application-6 "['<Alt>6']"
	gsettings set org.gnome.shell.keybindings switch-to-application-7 "['<Alt>7']"
	gsettings set org.gnome.shell.keybindings switch-to-application-8 "['<Alt>8']"
	gsettings set org.gnome.shell.keybindings switch-to-application-9 "['<Alt>9']"

	gsettings set org.gnome.desktop.wm.preferences num-workspaces 6

	# FIXME: Only do this on Framework laptops or similar displays
	gsettings set org.gnome.desktop.interface text-scaling-factor 0.8
fi
