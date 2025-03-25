#!/bin/bash

if [ ! -f /etc/os-release ]; then
  echo "$(tput setaf 1)Error: Unable to determine OS. /etc/os-release file not found."
  echo "Installation stopped."
  exit 1
fi

. /etc/os-release

# Check if running on a supported OS (Ubuntu 24.04+ or Fedora 41+)
if [ "$ID" = "ubuntu" ] && [ $(echo "$VERSION_ID >= 24.04" | bc) -eq 1 ]; then
  echo "$(tput setaf 2)Detected Ubuntu $VERSION_ID.$(tput sgr0)"
  export OMAKUB_OS="ubuntu"
elif [ "$ID" = "fedora" ] && [ $(echo "$VERSION_ID >= 41" | bc) -eq 1 ]; then
  echo "$(tput setaf 2)Detected Fedora $VERSION_ID.$(tput sgr0)"
  export OMAKUB_OS="fedora"
else
  echo "$(tput setaf 1)Error: OS requirement not met"
  echo "You are currently running: $ID $VERSION_ID"
  echo "Supported OS: Ubuntu 24.04+ or Fedora 41+"
  echo "Installation stopped."
  exit 1
fi

# Check if running on x86
ARCH=$(uname -m)
if [ "$ARCH" != "x86_64" ] && [ "$ARCH" != "i686" ]; then
  echo "$(tput setaf 1)Error: Unsupported architecture detected"
  echo "Current architecture: $ARCH"
  echo "This installation is only supported on x86 architectures (x86_64 or i686)."
  echo "Installation stopped."
  exit 1
fi

# If current os is fedora, install snap
if [ "$OMAKUB_OS" = "fedora" ]; then

  # Install snap
  sudo dnf install -y snapd

  if [ ! -L /snap/snap ]; then
    sudo ln -s /var/lib/snapd/snap /snap
  fi

  sudo dnf install -y fuse squashfuse

fi

