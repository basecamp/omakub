if ! command -v nodenv &>/dev/null; then
	git clone https://github.com/nodenv/nodenv.git ~/.nodenv
	sudo ln -vs ~/.nodenv/bin/nodenv /usr/local/bin/nodenv
	cd ~/.nodenv
	src/configure && make -C src || true
	cd ~/
	mkdir -p "$(nodenv root)"/plugins
	git clone https://github.com/nodenv/node-build.git "$(nodenv root)"/plugins/node-build
	git clone https://github.com/nodenv/nodenv-aliases.git $(nodenv root)/plugins/nodenv-aliases
	nodenv install 20.11.1
	nodenv global 20.11.1
	sudo ln -vs $(nodenv root)/shims/* /usr/local/bin/
fi
