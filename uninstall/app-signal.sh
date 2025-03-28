if [ -f /etc/os-release ]; then
    . /etc/os-release
    OMAKUB_OS="$ID"
else
    echo "Error: Cannot detect Linux distribution"
    exit 1
fi

if [ "$OMAKUB_OS" = "ubuntu" ]; then
  sudo apt remove --purge -y signal-desktop
elif [ "$OMAKUB_OS" = "fedora" ]; then
  sudo snap remove signal-desktop
fi
