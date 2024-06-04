# Flameshot is a nice step-up over the default Gnome screenshot tool
if [ -n "$FORCE" ] || ! command -v flameshot &>/dev/null; then
	sudo apt install -y flameshot
fi
