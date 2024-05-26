if ! command -v rbenv &>/dev/null; then
	DEFAULT_RUBY_VERSION="3.3.1"

	sudo apt install -y rbenv
	git clone https://github.com/rbenv/ruby-build.git "$(rbenv root)"/plugins/ruby-build
	rbenv install $DEFAULT_RUBY_VERSION
	rbenv global $DEFAULT_RUBY_VERSION
fi
