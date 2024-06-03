if ! command -v code &>/dev/null; then
	sudo snap install code --classic
	mkdir -p ~/.config/Code/User
	cp $OMAKUB_PATH/configs/vscode.json ~/.config/Code/User/settings.json
	code --install-extension enkia.tokyo-night
fi
