source $OMAKUB_PATH/defaults/bash/functions

CHOICES=(
  "$(icon_status 'Brave Browser            Brave Browser Stable')"
  "$(icon_status 'Brave Browser Beta       Brave Browser Beta')"
  "$(icon_status 'Brave Browser Nightly    Brave Browser Nightly')"
  "$(icon_status 'Firefox                  Firefox Stable')"
  "$(icon_status 'Firefox Beta             Firefox Beta Channel')"
  "$(icon_status 'Firefox Developer        Firefox Developer Edition')"
  "$(icon_status 'Firefox Nightly          Firefox Nightly Channel')"
  "$(icon_status 'Google Chrome            Google Chrome Stable')"
  "$(icon_status 'Google Chrome Beta       Google Chrome Beta Channel')"
  "$(icon_status 'Google Chrome Unstable   Google Chrome Developer (Dev) Channel')"
  "$(icon_status 'Google Chrome Canary     Google Chrome Canary Channel')"
  "<< Back                   "
)

CHOICE=$(gum choose "${CHOICES[@]}" --height 13 --header "Install optional applications")

if [[ "$CHOICE" == "<< Back"* ]] || [[ -z "$CHOICE" ]]; then
  # Don't install anything
  echo ""
else
  INSTALLER=$(normalize "$CHOICE")
  INSTALLER_FILE="$OMAKUB_PATH/install/desktop/optional/app-$INSTALLER.sh"
  source $INSTALLER_FILE && gum spin --spinner globe --title "Install completed!" -- sleep 3
fi

clear
source $OMAKUB_PATH/bin/omakub-sub/header.sh
source $OMAKUB_PATH/bin/omakub-sub/install.sh
