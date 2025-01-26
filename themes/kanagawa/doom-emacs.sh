if ! grep -q "(package! kanagawa-themes" $HOME/.config/doom/packages.el; then
	echo -e "\n(package! kanagawa-themes)" >>$HOME/.config/doom/packages.el
	$HOME/.config/emacs/bin/doom sync >/dev/null
fi

sed -i "s/^(setq doom-theme "\'".\+)$/(setq doom-theme "\'"kanagawa-wave)/g" $HOME/.config/doom/config.el
