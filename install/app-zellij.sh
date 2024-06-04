if [ -n "$FORCE" ] || ! command -v zellij &>/dev/null; then
	sudo snap install zellij --classic
	mkdir -p ~/.config/zellij/
	cp ~/.local/share/omakub/configs/zellij.kdl ~/.config/zellij/config.kdl
	ln -s ~/.local/share/omakub/themes/zellij ~/.config/zellij/themes
fi
