# Install default databases
if [[ -v OMAKASEBLUEFIN_FIRST_RUN_DBS ]]; then
	dbs=$OMAKASEBLUEFIN_FIRST_RUN_DBS
else
	AVAILABLE_DBS=("MySQL" "Redis" "PostgreSQL")
	dbs=$(gum choose "${AVAILABLE_DBS[@]}" --no-limit --height 5 --header "Select databases (runs in Docker)")
fi


if [[ -n "$dbs" ]]; then
	for db in $dbs; do
		case $db in
		MySQL)
			podman run -d --restart unless-stopped -p "127.0.0.1:3306:3306" --name=mysql8 -e MYSQL_ROOT_PASSWORD= -e MYSQL_ALLOW_EMPTY_PASSWORD=true docker.io/library/mysql:8.4
			;;
		Redis)
			podman run -d --restart unless-stopped -p "127.0.0.1:6379:6379" --name=redis docker.io/library/redis:7
			;;
		PostgreSQL)
			podman run -d --restart unless-stopped -p "127.0.0.1:5432:5432" --name=postgres16 -e POSTGRES_HOST_AUTH_METHOD=trust docker.io/library/postgres:16
			# Only attempt to set configuration if none is present
			if [ ! -f "$HOME/.psqlrc" ]; then
			  cp ~/.local/share/omakase-bluefin/configs/psqlrc ~/.psqlrc
			fi
			;;
		esac
	done
fi
