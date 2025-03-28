if [ -f /etc/os-release ]; then
    . /etc/os-release
    OMAKUB_OS="$ID"
else
    echo "Error: Cannot detect Linux distribution"
    exit 1
fi

if [ "$OMAKUB_OS" = "ubuntu" ]; then
  sudo apt remove --purge -y emacs emacs-gtk
  sudo rm -rf ~/.config/emacs
  sudo rm -rf ~/.emacs.d
  sudo rm -rf ~/.config/doom
elif [ "$OMAKUB_OS" = "fedora" ]; then
  sudo apt remove --purge -y emacs emacs-gtk
  sudo rm -rf ~/.config/emacs
  sudo rm -rf ~/.emacs.d
  sudo rm -rf ~/.config/doom
fi
