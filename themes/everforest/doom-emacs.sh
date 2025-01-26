if ! grep -q "(package! everforest" $HOME/.config/doom/packages.el; then
	echo -e "\n(package! everforest
	:recipe (:repo \"https://github.com/Theory-of-Everything/everforest-emacs.git\"))" \
		>>$HOME/.config/doom/packages.el

	$HOME/.config/emacs/bin/doom sync >/dev/null
fi

sed -i "s/^(setq doom-theme "\'".\+)$/(setq doom-theme "\'"everforest-hard-dark)/g" $HOME/.config/doom/config.el
