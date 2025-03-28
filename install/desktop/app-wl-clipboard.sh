if [ "$OMAKUB_OS" = "ubuntu" ]; then
  # Provides a system clipboard interface for Neovim under Wayland
  sudo apt install -y wl-clipboard
elif [ "$OMAKUB_OS" = "fedora" ]; then
  # Provides a system clipboard interface for Neovim under Wayland
  sudo dnf install wl-clipboard -y
fi