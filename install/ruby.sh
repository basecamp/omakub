# FIXME: Change to use whatever latest release is
DEFAULT_RUBY_VERSION=$(curl -s https://api.github.com/repos/ruby/ruby/tags | jq -r '[.[].name | select(test("preview|rc") | not)] | .[0]')

sudo apt install -y rbenv

RUBY_BUILD_DIR="$(rbenv root)/plugins/ruby-build"

# Check if the directory exists
if [ -d "$RUBY_BUILD_DIR" ]; then
	cd "$RUBY_BUILD_DIR" && git pull
	cd -
else
	git clone https://github.com/rbenv/ruby-build.git "$RUBY_BUILD_DIR"
fi

git clone https://github.com/rbenv/ruby-build.git "$(rbenv root)"/plugins/ruby-build
rbenv install $DEFAULT_RUBY_VERSION
rbenv global $DEFAULT_RUBY_VERSION
