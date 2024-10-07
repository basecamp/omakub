#!/usr/bin/env bash

# optionally remove the default snap-based installation of Firefox
clear
read -p "Would you like to remove the snap-based installation of Firefox? (y/n) " RemoveFirefoxSnap

if [[ "${RemoveFirefoxSnap,,}" == @(y)?(es) ]]; then
	sudo snap remove firefox
fi

# configure Mozilla's official apt repository
wget -q https://packages.mozilla.org/apt/repo-signing-key.gpg -O- | gpg --dearmor | sudo tee /etc/apt/keyrings/packages.mozilla.org.gpg > /dev/null

cat << 'EOL' | sudo tee /etc/apt/sources.list.d/mozilla.sources >/dev/null
Types: deb
URIs: https://packages.mozilla.org/apt
Suites: mozilla
Components: main
Signed-By: /etc/apt/keyrings/packages.mozilla.org.gpg
EOL

sudo apt update



# allow selection of Firefox Nightly and/or FireFox Developer Edition
_install_firefox() {
	clear
	cat <<'EOL'
[Installation]

Note that Mozilla's official repository is now configured on the system.
Feel free to choose cancel if you'd like to decide later.

Which version(s) of Firefox would you like to install?
EOL

	select sel in firefox-nightly firefox-devedition both cancel ; do
		case "$sel" in
		'cancel') return 0 ;;
		'both') sudo apt install -y firefox-nightly firefox-devedition ;;
		'firefox-'*) sudo apt install -y $sel ;;
		*) _install_firefox
		esac
		break
	done
}

_install_firefox
