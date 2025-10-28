#!/bin/bash

if [ ! -f /etc/apt/sources.list.d/signal-desktop.sources ]; then
  [ -f /usr/share/keyrings/signal-desktop-keyring.gpg ] && sudo rm /usr/share/keyrings/signal-desktop-keyring.gpg
  wget -O- https://updates.signal.org/desktop/apt/keys.asc | gpg --dearmor > signal-desktop-keyring.gpg;
  cat signal-desktop-keyring.gpg | sudo tee /usr/share/keyrings/signal-desktop-keyring.gpg > /dev/null
  wget -O signal-desktop.sources https://updates.signal.org/static/desktop/apt/signal-desktop.sources;
  cat signal-desktop.sources | sudo tee /etc/apt/sources.list.d/signal-desktop.sources > /dev/null
  rm signal-desktop-keyring.gpg signal-desktop.sources
fi

sudo apt update
sudo apt install -y signal-desktop
