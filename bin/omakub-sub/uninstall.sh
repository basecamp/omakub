UNINSTALLER_LIST=()
while IFS= read -r path; do
  UNINSTALLER_LIST+=("$(basename "$path" | sed 's/\.sh$//')")
done < <(find "$OMAKUB_PATH/uninstall" -mindepth 1 -maxdepth 1 -type f | sort)

CHOICE=$(gum choose "${UNINSTALLER_LIST[@]}" "<< Back" --header "Uninstall application" --height "$((${#UNINSTALLER_LIST[@]} + 2))")

if [[ "$CHOICE" == "<< Back"* ]] || [[ -z "$CHOICE" ]]; then
  # Don't uninstall anything
  echo ""
else
  [ -n "$CHOICE" ] && gum confirm "Run uninstaller?" && source "$CHOICE" && gum spin --spinner globe --title "Uninstall completed!" -- sleep 3
fi

clear
source $OMAKUB_PATH/bin/omakub