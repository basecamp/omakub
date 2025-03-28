if [ "$OMAKUB_OS" = "ubuntu" ]; then
  sudo apt install -y emacs
elif [ "$OMAKUB_OS" = "fedora" ]; then
  sudo dnf install -y emacs
fi

git clone --depth 1 https://github.com/doomemacs/doomemacs ~/.config/emacs
~/.config/emacs/bin/doom install
