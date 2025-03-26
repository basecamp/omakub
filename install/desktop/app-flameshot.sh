if [ "$OMAKUB_OS" = "ubuntu" ]; then
  # Flameshot is a nice step-up over the default Gnome screenshot tool
  sudo apt install -y flameshot
elif [ "$OMAKUB_OS" = "fedora" ]; then
  # Flameshot is a nice step-up over the default Gnome screenshot tool
  sudo dnf install -y flameshot
fi
