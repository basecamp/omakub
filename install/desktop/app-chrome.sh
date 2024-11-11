# Browse the web with the most popular browser. See https://www.google.com/chrome/
cd /tmp
sudo dnf install -y fedora-workstation-repositories
sudo dnf config-manager --set-enabled google-chrome
sudo dnf install -y google-chrome-stable
xdg-settings set default-web-browser google-chrome.desktop
cd -
