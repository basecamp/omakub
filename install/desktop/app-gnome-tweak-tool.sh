if [ "$OMAKUB_OS" = "ubuntu" ]; then
  sudo apt install -y gnome-tweak-tool
elif [ "$OMAKUB_OS" = "fedora" ]; then
  sudo dnf install -y gnome-tweak-tool
  flatpak install com.mattjakeman.ExtensionManager
fi