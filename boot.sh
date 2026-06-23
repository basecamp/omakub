#!/bin/bash

set -e

echo ""
echo "  ██████  ███    ██ ██    ██ ██   ██"
echo " ██    ██ ████   ██  ██  ██   ██ ██"
echo " ██    ██ ██ ██  ██   ████     ███"
echo " ██    ██ ██  ██ ██    ██     ██ ██"
echo "  ██████  ██   ████    ██    ██   ██"
echo "          artificial-softworks"
echo ""
echo "=> Onyx supports Ubuntu 26.04 LTS."
echo -e "\nBegin installation (or abort with ctrl+c)..."

. /etc/os-release
if [ "$ID" = "ubuntu" ]; then
  echo "=> Detected distro: Ubuntu $VERSION_ID — using Ubuntu build."
  sudo apt-get update >/dev/null
  sudo apt-get install -y git >/dev/null
else
  echo "Error: Unsupported distro '$ID'. Onyx supports Ubuntu 26.04 LTS."
  exit 1
fi

echo "Cloning Onyx..."
rm -rf ~/.local/share/onyx
git clone https://github.com/Vicjocaso/onyx-setup.git ~/.local/share/onyx >/dev/null
if [[ -n $ONYX_REF && $ONYX_REF != "master" ]]; then
	cd ~/.local/share/onyx
	git fetch origin "$ONYX_REF" && git checkout "$ONYX_REF"
	cd -
fi

echo "Installation starting..."
source ~/.local/share/onyx/install.sh
