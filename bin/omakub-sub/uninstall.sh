CHOICES=($(find $OMAKUB_PATH/uninstall -type f -exec basename {} \; | sed 's/app-//;s/\.sh$//' | sort))
CHOICES+=("<< Back")

choice=$(gum choose "${CHOICES[@]}" --height 29 --header "Uninstall application")
app_user_wishes_to_uninstall=$(find $OMAKUB_PATH/uninstall -type f -name *"$choice".sh)

[ -n "$app_user_wishes_to_uninstall" ] && gum confirm "Run uninstaller for $choice?" && source $app_user_wishes_to_uninstall && gum spin --spinner globe --title "Uninstall completed!" -- sleep 3
clear
source $OMAKUB_PATH/bin/omakub
