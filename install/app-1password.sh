if [[ $ARCH == "amd64" ]]; then
  wget https://downloads.1password.com/linux/debian/amd64/stable/1password-latest.deb
  sudo apt install -y ./1password-latest.deb
  rm 1password-latest.deb
elif [[ $ARCH == "arm64" ]]; then
  curl -sSO https://downloads.1password.com/linux/tar/stable/aarch64/1password-latest.tar.gz
  sudo tar -xf 1password-latest.tar.gz
  sudo mkdir -p /opt/1Password
  sudo mv 1password-*/* /opt/1Password
  sudo /opt/1Password/after-install.sh
  rm 1password-latest.tar.gz
fi