#!/bin/bash

# Stream music using https://spotify.com
curl -sS https://download.spotify.com/debian/pubkey_C85668DF69375001.gpg | sudo gpg --dearmor --yes -o /etc/apt/trusted.gpg.d/spotify.gpg
echo "deb [signed-by=/etc/apt/trusted.gpg.d/spotify.gpg] http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt update -y
sudo apt install -y spotify-client

# Create a desktop entry if it doesn't exist
if [ ! -f /usr/share/applications/spotify.desktop ]; then
  sudo ln -s /usr/share/spotify/spotify.desktop /usr/share/applications/spotify.desktop
fi