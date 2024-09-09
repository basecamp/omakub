# Install default programming languages
if [[ -v OMAKUB_FIRST_RUN_LANGUAGES ]]; then
	languages=$OMAKUB_FIRST_RUN_LANGUAGES
else
	AVAILABLE_LANGUAGES=("Ruby on Rails" "Node.js" "Go" "PHP" "Python" "Elixir" "Rust" "Java")
	languages=$(gum choose "${AVAILABLE_LANGUAGES[@]}" --no-limit --height 10 --header "Select programming languages")
fi

enable_lazyvim_extras() {
	local temp_file=$(mktemp /tmp/omakub.XXXXX)
	local extras=("$@")
	local jq_extras=$(printf '"%s",' "${extras[@]}")
	jq_extras="[${jq_extras%,}]"

	jq --argjson extras "$jq_extras" '.extras |= (. + $extras | unique)' ~/.config/nvim/lazyvim.json >"$temp_file" &&
	mv "$temp_file" ~/.config/nvim/lazyvim.json
}

if [[ -n "$languages" ]]; then
	for language in $languages; do
		case $language in
		Ruby)
			mise use --global ruby@3.3
			mise x ruby -- gem install rails --no-document
			;;
		Node.js)
			mise use --global node@lts

			enable_lazyvim_extras "lazyvim.plugins.extras.lang.typescript"
			;;
		Go)
			mise use --global go@latest

			enable_lazyvim_extras "lazyvim.plugins.extras.lang.go"
			;;
		PHP)
			sudo add-apt-repository -y ppa:ondrej/php
			sudo apt -y install php8.3 php8.3-{curl,apcu,intl,mbstring,opcache,pgsql,mysql,sqlite3,redis,xml,zip}
			php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
			php composer-setup.php --quiet && sudo mv composer.phar /usr/local/bin/composer
			rm composer-setup.php

			enable_lazyvim_extras "lazyvim.plugins.extras.lang.php" "lazyvim.plugins.extras.lang.typescript"
			;;
		Python)
			mise use --global python@latest
			;;
		Elixir)
			mise use --global erlang@latest
			mise use --global elixir@latest
			mise x elixir -- mix local.hex --force
			;;
		Rust)
			bash -c "$(curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs)" -- -y
			;;
		Java)
			mise use --global java@latest
			;;
		esac
	done
fi
