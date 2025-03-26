if [ "$OMAKUB_OS" = "ubuntu" ]; then
  # Make video calls using https://zoom.us/
  cd /tmp
  wget https://zoom.us/client/latest/zoom_amd64.deb
  sudo apt install -y ./zoom_amd64.deb
  rm zoom_amd64.deb
  cd -
elif [ "$OMAKUB_OS" = "fedora" ]; then
  # Make video calls using https://zoom.us/
  sudo snap install zoom
fi