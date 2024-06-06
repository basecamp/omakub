if ! command -v nodenv &>/dev/null; then
	URL="https://nodejs.org/download/release/index.json"
	DEFAULT_NODE_VERSION=$(curl -s "$URL" | jq -r '.[] | select(.lts != false) | .version' | head -n 1)

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
