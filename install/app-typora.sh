if [ -n "$FORCE" ] || ! command -v typora &>/dev/null; then
	sudo snap install typora
	cd ~/Downloads
	git clone https://github.com/dhh/ia_typora
	mkdir -p ~/.local/share/fonts
	cp ia_typora/fonts/iAWriterMonoS-* ~/.local/share/fonts/
	fc-cache
	mkdir -p ~/snap/typora/current/.config/Typora/themes/
	cp ia_typora/ia_typora*.css ~/snap/typora/current/.config/Typora/themes/
	cd -
fi
