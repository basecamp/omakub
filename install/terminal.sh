if [ "$OMAKUB_OS" = "ubuntu" ]; then
  # Needed for all installers
  sudo apt update -y
  sudo apt upgrade -y
  sudo apt install -y curl git unzip
elif [ "$OMAKUB_OS" = "fedora" ]; then
  # Needed for all installers
  sudo dnf update -y
  sudo dnf upgrade -y
  sudo dnf install -y curl git unzip
fi

# Run terminal installers
for installer in ~/.local/share/omakub/install/terminal/*.sh; do source $installer; done
