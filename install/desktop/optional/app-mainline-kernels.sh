if [ "$OMAKUB_OS" = "ubuntu" ]; then
  sudo add-apt-repository ppa:cappelikan/ppa
  sudo apt update -y
  sudo apt install -y mainline
fi

# Fedora use the latest kernel, no need for this