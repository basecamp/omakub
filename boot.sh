#!/bin/bash

set -o pipefail

ascii_art='
 ██████  ███    ███  █████  ██   ██ ██    ██ ██████
██    ██ ████  ████ ██   ██ ██  ██  ██    ██ ██   ██
██    ██ ██ ████ ██ ███████ █████   ██    ██ ██████
██    ██ ██  ██  ██ ██   ██ ██  ██  ██    ██ ██   ██
 ██████  ██      ██ ██   ██ ██   ██  ██████  ██████
'
clear
echo -e "\n$ascii_art\n"

sudo apt-get update >/dev/null
sudo apt-get install -y git >/dev/null

# Use custom repo if specified, otherwise use default
OMAKUB_REPO="${OMAKUB_REPO:-basecamp/omakub}"

echo -e "\e[32m\nCloning Omakub...\e[0m"
rm -rf ~/.local/share/omakub
git clone https://github.com/$OMAKUB_REPO.git ~/.local/share/omakub >/dev/null

if [[ -n "$OMAKUB_REF" ]]; then
  echo -e "\e[32mUsing branch: $OMAKUB_REF\e[0m"
	cd ~/.local/share/omakub
	git fetch origin "${OMAKUB_REF}" && git checkout "${OMAKUB_REF}"
	cd -
fi

echo -e "\nInstallation starting..."
source ~/.local/share/omakub/install.sh
