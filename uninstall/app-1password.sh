if [ -f /etc/os-release ]; then
    . /etc/os-release
    OMAKUB_OS="$ID"
else
    echo "Error: Cannot detect Linux distribution"
    exit 1
fi

if [ "$OMAKUB_OS" = "ubuntu" ]; then
  sudo rm /etc/apt/sources.list.d/1password.list
  sudo rm /usr/share/keyrings/1password-archive-keyring.gpg
  sudo rm /usr/share/debsig/keyrings/AC2D62742012EA22/debsig.gpg
  sudo rm -r /etc/debsig/policies/AC2D62742012EA22/
  sudo apt-get remove --purge -y 1password 1password-cli
elif [ "$OMAKUB_OS" = "fedora" ]; then
  sudo dnf remove -y 1password
fi