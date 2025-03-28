if [ "$OMAKUB_OS" = "ubuntu" ]; then
  # Play games from https://store.steampowered.com/
  cd /tmp
  wget https://cdn.akamai.steamstatic.com/client/installer/steam.deb
  sudo apt install -y ./steam.deb
  rm steam.deb
  cd -
elif [ "$OMAKUB_OS" = "fedora" ]; then
  # Play games from https://store.steampowered.com/
  sudo snap install steam
fi