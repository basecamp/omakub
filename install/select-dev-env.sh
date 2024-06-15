# Install default programming languages
languages=$(gum choose "Ruby on Rails" "Node.js" "Go" "PHP" "Python" "Elixir" "Java" --no-limit --selected "Ruby on Rails","Node.js" --height 9 --header "Select programming languages")

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
		code --install-extension golang.go
		;;
	Java)
		mise use --global java@latest
		;;
	Python)
		mise use --global python@latest
		;;
	Elixir)
		mise use --global erlang@latest
		mise use --global elixir@latest
		mise x elixir -- mix local.hex --force
		;;
	PHP)
		sudo add-apt-repository -y ppa:ondrej/php
		sudo apt -y install php8.3 php8.3-{curl,apcu,intl,mbstring,opcache,pgsql,mysql,sqlite3,redis,xml,zip}
		php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
		php composer-setup.php --quiet && sudo mv composer.phar /usr/local/bin/composer
		rm composer-setup.php
		;;
	esac
done

# Install default databases
dbs=$(gum choose "MySQL" "Redis" "PostgreSQL" --no-limit --selected "MySQL","Redis" --height 5 --header "Select databases (runs in Docker)")

for db in $dbs; do
	case $db in
	MySQL)
		sudo docker run -d --restart unless-stopped -p "127.0.0.1:3306:3306" --name=mysql8 -e MYSQL_ROOT_PASSWORD= -e MYSQL_ALLOW_EMPTY_PASSWORD=true mysql:8.4
		;;
	Redis)
		sudo docker run -d --restart unless-stopped -p "127.0.0.1:6379:6379" --name=redis redis:7
		;;
	PostgreSQL)
		sudo docker run -d --restart unless-stopped -p "127.0.0.1:5432:5432" --name=postgres16 -e POSTGRES_HOST_AUTH_METHOD=trust postgres:16
		;;
	esac
done
