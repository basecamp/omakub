#!/bin/bash

source $OMAKUB_PATH/defaults/bash/functions

AVAILABLE_WEB_APPS=("Chat GPT" "Google Photos" "Google Contacts" "Tailscale" "Youtube Music")
apps=$(gum choose "${AVAILABLE_WEB_APPS[@]}" --no-limit --height 7 --header "Select web apps to uninstall")

if [[ -n "$apps" ]]; then
  IFS=$'\n'
  for app in $apps; do
    case $app in
    "Chat GPT")
      web2app-remove 'Chat GPT'
      app2folder-remove 'Chat GPT.desktop' WebApps
      ;;
    "Google Photos")
      web2app-remove 'Google Photos'
      app2folder-remove 'Google Photos.desktop' WebApps
      ;;
    "Google Contacts")
      web2app-remove 'Google Contacts'
      app2folder-remove 'Google Contacts.desktop' WebApps
      ;;
    "Tailscale")
      web2app-remove 'Tailscale'
      app2folder-remove 'Tailscale.desktop' WebApps
      ;;
    "Youtube Music")
      web2app-remove 'Youtube Music'
      app2folder-remove 'Youtube Music.desktop' WebApps
      ;;
    esac
  done
fi
