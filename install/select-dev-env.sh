# Install default programming languages
languages=$(gum choose "Ruby" "Node.js" "Go" "Python" "Java" --no-limit --selected "Ruby","Node.js" --height 7 --header "Select programming languages")

for language in $languages; do
	case $language in
	Ruby)
		mise use --global ruby@3.3
		;;
	Node.js)
		mise use --global node@lts
		;;
	Go)
		mise use --global go@latest
		;;
	Java)
		mise use --global java@latest
		;;
	Python)
		mise use --global python@latest
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
