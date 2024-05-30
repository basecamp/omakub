# Flameshot is a nice step-up over the default Gnome screenshot tool
if ! command -v flameshot &>/dev/null; then
	sudo apt install -y flameshot
	# FIXME: Move the hotkey setting over here when we have a command for it
fi
