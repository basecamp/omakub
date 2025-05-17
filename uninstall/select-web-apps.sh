source $OMAKUB_PATH/defaults/bash/functions

AVAILABLE_WEB_APPS=("Chat GPT" "Google Photos" "Google Contacts" "Tailscale")
apps=$(gum choose "${AVAILABLE_WEB_APPS[@]}" --no-limit --height 6 --header "Select web apps to uninstall")

if [[ -n "$apps" ]]; then
  for app in $apps; do
    case $app in
    Chat)
      web2app-remove 'Chat GPT'
      app2folder-remove 'Chat GPT.desktop' WebApps
      ;;
    Photos)
      web2app-remove 'Google Photos'
      app2folder-remove 'Google Photos.desktop' WebApps
      ;;
    Contacts)
      web2app-remove 'Google Contacts'
      app2folder-remove 'Google Contacts.desktop' WebApps
      ;;
    Tailscale)
      web2app-remove 'Tailscale'
      app2folder-remove 'Tailscale.desktop' WebApps
      ;;
    esac
  done
fi
