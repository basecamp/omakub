#!/usr/bin/env bash

# present option to remove the default snap-based installation of Firefox
# (if running interactively)
[[ $- != *i* ]] || { clear
	read -p "Would you like to remove the snap-based installation of Firefox? (y/n) " RemoveFirefoxSnap
	if [[ "${RemoveFirefoxSnap,,}" == @(y)?(es) ]]; then
		sudo snap remove firefox -y
	fi
}

# configure Mozilla's official apt repository
wget -q https://packages.mozilla.org/apt/repo-signing-key.gpg -O- | gpg --dearmor | sudo tee /etc/apt/keyrings/packages.mozilla.org.gpg > /dev/null

cat << 'EOL' | sudo tee /etc/apt/sources.list.d/mozilla.sources >/dev/null
Types: deb
URIs: https://packages.mozilla.org/apt
Suites: mozilla
Components: main
Signed-By: /etc/apt/keyrings/packages.mozilla.org.gpg
EOL

# update, then install
sudo apt update && sudo apt install -y firefox-devedition
