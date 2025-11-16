#!/bin/bash

. /etc/os-release

if [ "$ID" == "ubuntu" ]; then
  sudo add-apt-repository universe -y
  sudo add-apt-repository ppa:agornostal/ulauncher -y
else
  cd /tmp
  ULAUNCHER_VERSION=$(curl -s "https://api.github.com/repos/Ulauncher/Ulauncher/releases/latest" | grep -Po '"tag_name": "\K[^"]*')
  wget -qO ulauncher.deb "https://github.com/Ulauncher/Ulauncher/releases/latest/download/ulauncher_${ULAUNCHER_VERSION}_all.deb"
  sudo apt install -y ./ulauncher.deb
  rm ulauncher.deb
  cd -
fi

sudo apt update
sudo apt install ulauncher -y

# Start ulauncher to have it populate config before we overwrite
mkdir -p ~/.config/autostart/
cp ~/.local/share/omakub/configs/ulauncher.desktop ~/.config/autostart/ulauncher.desktop
gtk-launch ulauncher.desktop >/dev/null 2>&1
gum spin --title "Init Ulauncher..." -- sleep 10 # ensure enough time for ulauncher to set defaults
cp ~/.local/share/omakub/configs/ulauncher.json ~/.config/ulauncher/settings.json
