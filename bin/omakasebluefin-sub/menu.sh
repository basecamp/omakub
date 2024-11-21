if [ $# -eq 0 ]; then
	SUB=$(gum choose "Update" "Install" "Uninstall" "Quit" --height 10 --header "" | tr '[:upper:]' '[:lower:]')
else
	SUB=$1
fi

[ -n "$SUB" ] && [ "$SUB" != "quit" ] && source $OMAKASEBLUEFIN_PATH/bin/omakasebluefin-sub/$SUB.sh
