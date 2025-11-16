#!/bin/bash

. /etc/os-release

if [ "$ID" == "ubuntu" ]; then
  sudo add-apt-repository universe -y
  sudo add-apt-repository ppa:agornostal/ulauncher -y
else
  sudo apt update && sudo apt install -y gnupg
  gpg --keyserver keyserver.ubuntu.com --recv 0xfaf1020699503176
  gpg --export 0xfaf1020699503176 | sudo tee /usr/share/keyrings/ulauncher-archive-keyring.gpg > /dev/null
  echo "deb [signed-by=/usr/share/keyrings/ulauncher-archive-keyring.gpg] \
    http://ppa.launchpad.net/agornostal/ulauncher/ubuntu noble main" \
    | sudo tee /etc/apt/sources.list.d/ulauncher-noble.list
fi

sudo apt update
sudo apt install ulauncher -y

# Start ulauncher to have it populate config before we overwrite
mkdir -p ~/.config/autostart/
cp ~/.local/share/omakub/configs/ulauncher.desktop ~/.config/autostart/ulauncher.desktop
gtk-launch ulauncher.desktop >/dev/null 2>&1
gum spin --title "Init Ulauncher..." -- sleep 10 # ensure enough time for ulauncher to set defaults
cp ~/.local/share/omakub/configs/ulauncher.json ~/.config/ulauncher/settings.json
