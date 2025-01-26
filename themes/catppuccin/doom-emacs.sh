if ! grep -q "(package! catppuccin-theme" $HOME/.config/doom/packages.el; then
	echo -e "\n(package! catppuccin-theme)" >>$HOME/.config/doom/packages.el
	$HOME/.config/emacs/bin/doom sync >/dev/null
fi

sed -i "s/^(setq doom-theme "\'".\+)$/(setq doom-theme "\'"catppuccin)/g" $HOME/.config/doom/config.el
