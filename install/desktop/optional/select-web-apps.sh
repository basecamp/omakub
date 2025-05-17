source $OMAKUB_PATH/defaults/bash/functions

# Install default web apps
if [[ -v OMAKUB_FIRST_RUN_WEB_APPS ]]; then
  apps=$OMAKUB_FIRST_RUN_WEB_APPS
else
  AVAILABLE_WEB_APPS=("Chat GPT" "Google Photos" "Google Contacts" "Tailscale")
  apps=$(gum choose "${AVAILABLE_WEB_APPS[@]}" --no-limit --height 7 --header "Select web apps")
fi

if [[ -n "$apps" ]]; then
  for app in $apps; do
    case $app in
    Chat)
      web2app 'Chat GPT' https://chatgpt.com/ https://cdn.jsdelivr.net/gh/homarr-labs/dashboard-icons/png/chatgpt.png
      app2folder 'Chat GPT.desktop' WebApps
      ;;
    Photos)
      web2app 'Google Photos' https://photos.google.com/ https://cdn.jsdelivr.net/gh/homarr-labs/dashboard-icons/png/google-photos.png
      app2folder 'Google Photos.desktop' WebApps
      ;;
    Contacts)
      web2app 'Google Contacts' https://contacts.google.com/ https://cdn.jsdelivr.net/gh/homarr-labs/dashboard-icons/png/google-contacts.png
      app2folder 'Google Contacts.desktop' WebApps
      ;;
    Tailscale)
      web2app 'Tailscale' https://login.tailscale.com/admin/ https://cdn.jsdelivr.net/gh/homarr-labs/dashboard-icons/png/tailscale-light.png
      app2folder 'Tailscale.desktop' WebApps
      ;;
    esac
  done
fi
