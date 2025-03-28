if [ "$OMAKUB_OS" = "ubuntu" ]; then
  sudo apt install -y xournalpp
elif [ "$OMAKUB_OS" = "fedora" ]; then
  sudo dnf install -y xournalpp
fi
