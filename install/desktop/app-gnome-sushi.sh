if [ "$OMAKUB_OS" = "ubuntu" ]; then
  # Gives you previews in the file manager when pressing space
  sudo apt install -y gnome-sushi
elif [ "$OMAKUB_OS" = "fedora" ]; then
  # Gives you previews in the file manager when pressing space
  sudo dnf install -y sushi
fi
