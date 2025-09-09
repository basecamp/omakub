#!/bin/bash

# Revert to normal idle and lock settings
gsettings set org.gnome.desktop.screensaver lock-enabled true
gsettings set org.gnome.desktop.session idle-delay 300

# Warning on x11 sessions to use Wayland instead
if [ "$XDG_SESSION_TYPE" = "x11" ]; then
  echo -e "\e[33m\nWarning: You are currently using an X11 session. It is recommended to switch to a Wayland session for the best experience with Omakub.\e[0m"
  echo -e "\e[33mYou can select the Wayland session at the login screen by clicking on the gear icon and choosing 'Ubuntu (Wayland)'.\e[0m"
  echo
fi

# Logout to pickup changes
gum confirm "Ready to reboot for all settings to take effect?" && sudo reboot