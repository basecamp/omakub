# Uninstall default programming languages
if [[ -v OMAKUB_FIRST_RUN_LANGUAGES ]]; then
  languages=$OMAKUB_FIRST_RUN_LANGUAGES
else
  AVAILABLE_LANGUAGES=("Ruby on Rails" "Node.js" "Go" "PHP" "Python" "Elixir" "Rust" "Java")
  languages=$(gum choose "${AVAILABLE_LANGUAGES[@]}" --no-limit --height 10 --header "Select programming languages to uninstall")
fi

if [[ -n $languages ]]; then
  for language in $languages; do
    case $language in
    Ruby)
      mise uninstall ruby@3.4
      mise x ruby -- gem uninstall rails
      ;;
    Node.js)
      mise uninstall node@lts
      ;;
    Go)
      mise uninstall go@latest
      ;;
    PHP)
      sudo apt -y purge php8.4 php8.4-{curl,apcu,intl,mbstring,opcache,pgsql,mysql,sqlite3,redis,xml,zip}
      sudo add-apt-repository -y --remove ppa:ondrej/php
      sudo rm /usr/local/bin/composer
      ;;
    Python)
      mise uninstall python@latest
      ;;
    Elixir)
      mise uninstall elixir@latest
      mise uninstall erlang@latest
      ;;
    Rust)
      rustup self uninstall -y
      ;;
    Java)
      mise uninstall java@latest
      ;;
    esac
  done
fi
