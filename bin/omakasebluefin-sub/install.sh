CHOICES=(
	"Dev Language  Install programming language environment"
	"Dev Database  Install development database in Docker"
	"Audacity      Record and edit audio"
	"Spotify       Stream music from the world's most popular service"
	"Zoom          Attend and host video chat meetings"
	"> All         Re-run any of the default installers"
	"<< Back       "
)

CHOICE=$(gum choose "${CHOICES[@]}" --height 19 --header "Install application")

if [[ "$CHOICE" == "<< Back"* ]] || [[ -z "$CHOICE" ]]; then
	# Don't install anything
	echo ""
elif [[ "$CHOICE" == "> All"* ]]; then
	INSTALLER_FILE=$(gum file $OMAKASEBLUEFIN_PATH/install)

	[[ -n "$INSTALLER_FILE" ]] &&
		gum confirm "Run installer?" &&
		source $INSTALLER_FILE &&
		gum spin --spinner globe --title "Install completed!" -- sleep 3
else
	INSTALLER=$(echo "$CHOICE" | awk -F ' {2,}' '{print $1}' | tr '[:upper:]' '[:lower:]' | sed 's/ /-/g')

	case "$INSTALLER" in
	"dev-language") INSTALLER_FILE="$OMAKASEBLUEFIN_PATH/install/terminal/select-dev-language.sh" ;;
	"dev-database") INSTALLER_FILE="$OMAKASEBLUEFIN_PATH/install/terminal/select-dev-storage.sh" ;;
	*) INSTALLER_FILE="$OMAKASEBLUEFIN_PATH/install/desktop/optional/app-$INSTALLER.sh" ;;
	esac

	source $INSTALLER_FILE && gum spin --spinner globe --title "Install completed!" -- sleep 3
fi

clear
source $OMAKASEBLUEFIN_PATH/bin/omakasebluefin
