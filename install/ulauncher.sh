if ! command -v ulauncher &>/dev/null; then
	sudo add-apt-repository universe -y
	sudo add-apt-repository ppa:agornostal/ulauncher -y
	sudo apt update -y
	sudo apt install -y ulauncher

	# Start ulauncher to have it populate config before we overwrite
	ulauncher &
	cp ~/.local/share/omakub/configs/ulauncher.json ~/.config/ulauncher/settings.json
fi
