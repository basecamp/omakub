if [ "$OMAKUB_OS" = "ubuntu" ]; then
  sudo apt install -y flatpak
  sudo apt install -y gnome-software-plugin-flatpak
  sudo flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
elif [ "$OMAKUB_OS" = "fedora" ]; then
  # Install Flatpak
  sudo dnf install -y flatpak

  # Add the Flathub repository
  sudo flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
fi