if [[ $ARCH == "amd64" ]]; then
  sudo apt install -y nautilus-dropbox
  gtk-launch dropbox.desktop
elif [[ $ARCH == "arm64" ]]; then
  #https://packages.ubuntu.com/noble/nautilus-dropbox
  echo "Dropbox is not supported on arm64 architecture."
fi