# Uninstall default programming languages
if [[ -v OMAKUB_FIRST_RUN_LANGUAGES ]]; then
    languages=$OMAKUB_FIRST_RUN_LANGUAGES
else
    AVAILABLE_LANGUAGES=("Ruby on Rails" "Node.js" "Go" "PHP" "Python" "Elixir" "Rust" "Java")
    languages=$(gum choose "${AVAILABLE_LANGUAGES[@]}" --no-limit --height 10 --header "Select programming languages to uninstall")
fi

disable_lazyvim_extras() {
    local config_file="$HOME/.config/nvim/lazyvim.json"
    local extras=("$@")

    local extras_json
    extras_json=$(printf '"%s",' "${extras[@]}")
    extras_json="[${extras_json%,}]"

    # This is cheating to mimic an in-place editing of files (without a tmp file)...
    { rm "$config_file" && jq --argjson extras "$extras_json" '.extras |= (. - $extras)' >"$config_file"; } <"$config_file"
}

if [[ -n "$languages" ]]; then
    for language in $languages; do
        case $language in
        Ruby)
            mise uninstall ruby@3.4
            mise x ruby -- gem uninstall rails
            ;;
        Node.js)
            mise uninstall node@lts
            disable_lazyvim_extras "lazyvim.plugins.extras.lang.typescript"
            ;;
        Go)
            mise uninstall go@latest
            disable_lazyvim_extras "lazyvim.plugins.extras.lang.go"
            ;;
        PHP)
            sudo apt -y purge php8.4 php8.4-{curl,apcu,intl,mbstring,opcache,pgsql,mysql,sqlite3,redis,xml,zip}
            sudo add-apt-repository -y --remove ppa:ondrej/php
            sudo rm /usr/local/bin/composer
            disable_lazyvim_extras "lazyvim.plugins.extras.lang.php"
            ;;
        Python)
            mise uninstall python@latest
            ;;
        Elixir)
            mise uninstall elixir@latest
            mise uninstall erlang@latest
            disable_lazyvim_extras "lazyvim.plugins.extras.lang.elixir" "lazyvim.plugins.extras.lang.erlang"
            ;;
        Rust)
            rustup self uninstall -y
            disable_lazyvim_extras "lazyvim.plugins.extras.lang.rust"
            ;;
        Java)
            mise uninnstall java@latest
            ;;
        esac
    done
fi
