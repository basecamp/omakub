if [ "$OMAKUB_OS" = "ubuntu" ]; then
  sudo apt install -y vlc
elif [ "$OMAKUB_OS" = "fedora" ]; then
  sudo dnf install -y vlc
fi
