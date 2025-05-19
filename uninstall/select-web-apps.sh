source $OMAKUB_PATH/defaults/bash/functions

AVAILABLE_WEB_APPS=("Chat GPT" "Google Photos" "Google Contacts" "Tailscale")
APPS=$(gum choose "${AVAILABLE_WEB_APPS[@]}" --no-limit --height 6 --header "Select web apps to uninstall" | tr ' ' '-')

if [[ -n "$APPS" ]]; then
  for APP in $APPS; do
    app=$(echo "$APP" | awk -F ' {2,}' '{print $1}' | tr '[:upper:]' '[:lower:]' | sed 's/ /-/g')

    case $app in
    "chat-gpt")
      web2app-remove 'Chat GPT'
      app2folder-remove 'Chat GPT.desktop' WebApps
      ;;
    "google-photos")
      web2app-remove 'Google Photos'
      app2folder-remove 'Google Photos.desktop' WebApps
      ;;
    "google-contacts")
      web2app-remove 'Google Contacts'
      app2folder-remove 'Google Contacts.desktop' WebApps
      ;;
    "tailscale")
      web2app-remove 'Tailscale'
      app2folder-remove 'Tailscale.desktop' WebApps
      ;;
    esac
  done
fi
