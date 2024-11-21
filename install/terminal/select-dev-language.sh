# Install default programming languages
if [[ -v OMAKASEBLUEFIN_FIRST_RUN_LANGUAGES ]]; then
	languages=$OMAKASEBLUEFIN_FIRST_RUN_LANGUAGES
else
	AVAILABLE_LANGUAGES=("Ruby on Rails" "Node.js" "Go" "Python" "Elixir" "Rust" "Java")
	languages=$(gum choose "${AVAILABLE_LANGUAGES[@]}" --no-limit --height 10 --header "Select programming languages")
fi

if command -v mise &> /dev/null; then
  eval "$(mise activate bash)"
fi

if [[ -n "$languages" ]]; then
	for language in $languages; do
		case $language in
		Ruby)
			mise use --global ruby@3.3
			mise x ruby -- gem install rails --no-document
			;;
		Node.js)
			mise use --global node@lts
			;;
		Go)
			mise use --global go@latest
			;;
		Python)
			mise use --global python@latest
			# Only attempt to set configuration if none is present
			if [ ! -f "$HOME/.config/pypoetry/config.toml" ]; then
			  mkdir -p ~/.config/pypoetry
			  cp ~/.local/share/omakase-bluefin/configs/poetry.toml ~/.config/pypoetry/config.toml
			fi
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
