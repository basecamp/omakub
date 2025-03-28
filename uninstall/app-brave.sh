if [ -f /etc/os-release ]; then
    . /etc/os-release
    OMAKUB_OS="$ID"
else
    echo "Error: Cannot detect Linux distribution"
    exit 1
fi

if [ "$OMAKUB_OS" = "ubuntu" ]; then
  sudo apt remove --purge -y brave-browser
  sudo rm /etc/apt/sources.list.d/brave-browser-release.list
  sudo rm /usr/share/keyrings/brave-browser-*
elif [ "$OMAKUB_OS" = "fedora" ]; then
  sudo dnf config-manager setopt brave-browser.enabled=0
  sudo dnf remove -y brave-browser
fi
