if [ -n "$FORCE" ] || ! command -v code &>/dev/null; then
	sudo snap install code --classic
	mkdir -p ~/.config/Code/User
	cp ~/.local/share/omakub/configs/vscode.json ~/.config/Code/User/settings.json

	# Install default supported themes
	code --install-extension enkia.tokyo-night
	code --install-extension jdinhlife.gruvbox
	code --install-extension Catppuccin.catppuccin-vsc
	code --install-extension mvllow.rose-pine
fi
