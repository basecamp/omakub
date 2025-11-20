#!/bin/bash

if [ ! -f /etc/os-release ]; then
  echo "$(tput setaf 1)Error: Unable to determine OS. /etc/os-release file not found."
  echo "Installation stopped."
  exit 1
fi

. /etc/os-release

# Check if running on Ubuntu 24.04 or higher, or Debian 13
if { [ "$ID" != "ubuntu" ] || [ "$(echo "$VERSION_ID >= 24.04" | bc)" != 1 ]; } && \
   { [ "$ID" != "debian" ] || [ "$(echo "$VERSION_ID >= 13" | bc)" != 1 ]; }; then
  echo "$(tput setaf 1)Error: Unsupported operating system detected."
  echo "You are currently running: ${ID^} $VERSION_ID"
  echo "This script cannot be run on Ubuntu 24.04 or newer, or on Debian 13."
  echo "Installation aborted."
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
