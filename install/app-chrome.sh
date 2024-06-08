cd ~/Downloads
if [[ $ARCH == "amd64" ]]; then
  wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
  sudo apt install -y ./google-chrome-stable_current_amd64.deb
  rm google-chrome-stable_current_amd64.deb
elif [[ $ARCH == "arm64" ]]; then
  echo "Chrome is not supported on arm64 architecture."
fi
cd -