if ! command -v nodenv &>/dev/null; then
	# FIXME: Make this pick whatever the latest LTS is
	DEFAULT_NODE_VERSION="20.13.1"

	git clone https://github.com/nodenv/nodenv.git ~/.nodenv
	sudo ln -vs ~/.nodenv/bin/nodenv /usr/local/bin/nodenv
	cd ~/.nodenv
	src/configure && make -C src || true
	cd ~/
	mkdir -p "$(nodenv root)"/plugins
	git clone https://github.com/nodenv/node-build.git "$(nodenv root)"/plugins/node-build
	git clone https://github.com/nodenv/nodenv-aliases.git $(nodenv root)/plugins/nodenv-aliases
	nodenv install $DEFAULT_NODE_VERSION
	nodenv global $DEFAULT_NODE_VERSION
	sudo ln -vs $(nodenv root)/shims/* /usr/local/bin/
fi
