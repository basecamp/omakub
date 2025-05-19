source $OMAKUB_PATH/defaults/bash/functions

AVAILABLE_WEB_APPS=("Chat GPT" "Google Photos" "Google Contacts" "Tailscale")
APPS=$(gum choose "${AVAILABLE_WEB_APPS[@]}" --no-limit --height 7 --header "Select web apps" | tr ' ' '-')

if [[ -n "$APPS" ]]; then
  for APP in $APPS; do
    app=$(echo "$APP" | awk -F ' {2,}' '{print $1}' | tr '[:upper:]' '[:lower:]' | sed 's/ /-/g')

    case $app in
    "chat-gpt")
      web2app 'Chat GPT' https://chatgpt.com/ https://cdn.jsdelivr.net/gh/homarr-labs/dashboard-icons/png/chatgpt.png
      app2folder 'Chat GPT.desktop' WebApps
      ;;
    "google-photos")
      web2app 'Google Photos' https://photos.google.com/ https://cdn.jsdelivr.net/gh/homarr-labs/dashboard-icons/png/google-photos.png
      app2folder 'Google Photos.desktop' WebApps
      ;;
    "google-contacts")
      web2app 'Google Contacts' https://contacts.google.com/ https://cdn.jsdelivr.net/gh/homarr-labs/dashboard-icons/png/google-contacts.png
      app2folder 'Google Contacts.desktop' WebApps
      ;;
    "tailscale")
      web2app 'Tailscale' https://login.tailscale.com/admin/ https://cdn.jsdelivr.net/gh/homarr-labs/dashboard-icons/png/tailscale-light.png
      app2folder 'Tailscale.desktop' WebApps
      ;;
    esac
  done
fi
