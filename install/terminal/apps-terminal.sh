if [ "$OMAKUB_OS" = "ubuntu" ]; then
  sudo apt install -y fzf ripgrep bat eza zoxide plocate btop apache2-utils fd-find tldr
elif [ "$OMAKUB_OS" = "fedora" ]; then
  sudo dnf install -y fzf ripgrep bat eza zoxide plocate btop httpd-tools fd-find tldr
fi