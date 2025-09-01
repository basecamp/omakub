#!/bin/bash

#!/bin/bash

abort() {
  echo -e "\e[31mOmakub install requires: $1\e[0m"
  echo
  gum confirm "Proceed anyway on your own accord and without assistance?" || exit 1
}

# Must be a valid OS
[[ -f /etc/os-release ]] || abort "/etc/os-release"

. /etc/os-release

# Check if running on Ubuntu 24.04+
[[ "$ID" == "ubuntu" ]] || abort "Ubuntu 24.04 or higher"
[[ $(echo "$VERSION_ID >= 24.04" | bc) != 1 ]] && abort "Ubuntu 24.04 or higher"

# Must be x86 only to fully work
ARCH=$(uname -m)
if [[ "$ARCH" != "x86_64" ]] && [[ "$ARCH" != "i686" ]]; then
  abort "x86_64 CPU"
fi

# Cleared all guards
echo "Guards: OK"
