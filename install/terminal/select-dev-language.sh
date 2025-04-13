# Install default programming languages
if [[ -v OMAKUB_FIRST_RUN_LANGUAGES ]]; then
  languages=$OMAKUB_FIRST_RUN_LANGUAGES
else
  AVAILABLE_LANGUAGES=("Ruby on Rails" "Node.js" "Go" "PHP" "Python" "Elixir" "Rust" "Java")
  languages=$(gum choose "${AVAILABLE_LANGUAGES[@]}" --no-limit --height 10 --header "Select programming languages")
fi

install_extras=$(gum confirm "Would you like to enable the LazyVIM extras plugins (if available) too?" && echo true || echo false)

enable_lazyvim_extras() {
  local config_file="$HOME/.config/nvim/lazyvim.json"
  local extras=("$@")

  local extras_json
  extras_json=$(printf '"%s",' "${extras[@]}")
  extras_json="[${extras_json%,}]"

  # Create config file with empty JSON object if it doesn't exist
  if [[ ! -f "$config_file" ]]; then
    mkdir -p "$(dirname "$config_file")"
    echo '{}' > "$config_file"
  fi
  touch $config_file

  # This is cheating to mimic an in-place editing of files (without a tmp file)...
  { rm "$config_file" && jq --argjson extras "$extras_json" '.extras |= (. + $extras | unique)' >"$config_file"; } <"$config_file"
}

if [[ -n "$languages" ]]; then
  for language in $languages; do
    case $language in
    Ruby)
      mise use --global ruby@latest
      mise x ruby -- gem install rails --no-document
      ;;
    Node.js)
      mise use --global node@lts
      $install_extras && enable_lazyvim_extras "lazyvim.plugins.extras.lang.typescript"
      ;;
    Go)
      mise use --global go@latest
      $install_extras && enable_lazyvim_extras "lazyvim.plugins.extras.lang.go"
      ;;
    PHP)
      sudo add-apt-repository -y ppa:ondrej/php
      sudo apt -y install php8.4 php8.4-{curl,apcu,intl,mbstring,opcache,pgsql,mysql,sqlite3,redis,xml,zip}
      php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
      php composer-setup.php --quiet && sudo mv composer.phar /usr/local/bin/composer
      rm composer-setup.php
      $install_extras && enable_lazyvim_extras "lazyvim.plugins.extras.lang.php"
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
