if ! command -v zellij &>/dev/null; then
	sudo snap install zellij --classic
	mkdir -p ~/.config/zellij/
	cp $OMAKUB_PATH/configs/zellij.kdl ~/.config/zellij/config.kdl
	ln -s $OMAKUB_PATH/themes/zellij ~/.config/zellij/themes
fi
