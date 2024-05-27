if ! command -v ulauncher &>/dev/null; then
	sudo add-apt-repository universe -y
	sudo add-apt-repository ppa:agornostal/ulauncher -y
	sudo apt update -y
	sudo apt install -y ulauncher

	# FIXME: Install this keybinding
	# gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybindings.custom0 binding '<Super>space'
	# gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybindings.custom0 command 'ulauncher-toggle'
	# gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybindings.custom0 name 'ulauncher'
fi
