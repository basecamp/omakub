if [ "$OMAKUB_OS" = "ubuntu" ]; then
  cd /tmp
  wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor >packages.microsoft.gpg
  sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
  echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" | sudo tee /etc/apt/sources.list.d/vscode.list >/dev/null
  rm -f packages.microsoft.gpg
  cd -

  sudo apt update -y
  sudo apt install -y code

  mkdir -p ~/.config/Code/User
  cp ~/.local/share/omakub/configs/vscode.json ~/.config/Code/User/settings.json

  # Install default supported themes
  code --install-extension enkia.tokyo-night
elif [ "$OMAKUB_OS" = "fedora" ]; then
  # Add the Microsoft Visual Studio Code repository
  sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
  sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'

  # Install Visual Studio Code
  sudo dnf install -y code

  # Configure Visual Studio Code settings
  mkdir -p ~/.config/Code/User
  cp ~/.local/share/omakub/configs/vscode.json ~/.config/Code/User/settings.json

  # Install default supported themes
  code --install-extension enkia.tokyo-night
fi
