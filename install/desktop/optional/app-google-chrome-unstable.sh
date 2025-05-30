#!/bin/bash

# Browse the web with the Developer version of the most popular browser.
# See https://www.google.com/chrome/dev/
echo "Changing to /tmp directory..."
cd /tmp

echo "Downloading Google Chrome Dev (unstable) package..."
wget https://dl.google.com/linux/direct/google-chrome-unstable_current_amd64.deb

echo "Installing Google Chrome Dev package..."
sudo apt install -y ./google-chrome-unstable_current_amd64.deb

echo "Cleaning up the downloaded package..."
rm google-chrome-unstable_current_amd64.deb

echo "Setting Google Chrome Dev as the default web browser..."
# The .desktop file for the Dev version is typically 'google-chrome-unstable.desktop'.
# If you had a stable version installed, its .desktop file is usually 'google-chrome.desktop'.
# Installing the 'unstable' version might not automatically make 'google-chrome.desktop' point to the dev channel.
# It's safer to specify the unstable version's .desktop file.
# You can verify the exact .desktop file name in /usr/share/applications/ after installation.
xdg-settings set default-web-browser google-chrome-unstable.desktop

echo "Returning to the previous directory..."
cd -

echo "Google Chrome Dev installation script finished."