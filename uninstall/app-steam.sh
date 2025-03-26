if [ -f /etc/os-release ]; then
    . /etc/os-release
    OMAKUB_OS="$ID"
else
    echo "Error: Cannot detect Linux distribution"
    exit 1
fi

if [ "$OMAKUB_OS" = "ubuntu" ]; then
  sudo apt remove -y steam steam-launcher
elif [ "$OMAKUB_OS" = "fedora" ]; then
  sudo snap remove steam
fi
