if [ "$OMAKUB_OS" = "ubuntu" ]; then
  cd /tmp
  LOCALSEND_VERSION=$(curl -s "https://api.github.com/repos/localsend/localsend/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
  wget -O localsend.deb "https://github.com/localsend/localsend/releases/latest/download/LocalSend-${LOCALSEND_VERSION}-linux-x86-64.deb"
  sudo apt install -y ./localsend.deb
  rm localsend.deb
  cd -
elif [ "$OMAKUB_OS" = "fedora" ]; then
  flatpak install flathub org.localsend.localsend_app
fi
