#!/bin/bash

if ! lsusb | grep -Eiq 'fingerprint|synaptics|goodix'; then
  echo -e "\e[31m\nNo fingerprint sensor detected.\e[0m"
else
  # Enable the fingerprint authentication in common-auth via utility
  # This will enable it for sudo and app-based PAM
  sudo pam-auth-update --enable fprintd

  # Check whether any fingers have already been enrolled, to handle omamix update scenarios
  enrolled_fingers=$(fprintd-list $USER | grep -E "\-(thumb|finger)")
  if [ -n "$enrolled_fingers" ]; then
    echo -e "\e[32m\nYou already have fingerprints enrolled; let's check one.\e[0m"
  else

    # Enroll the first finger
    echo -e "\e[32m\nLet's setup your first fingerprint.\nKeep moving the finger around on the sensor until the process completes.\n\e[0m"
    sudo fprintd-enroll $USER
  fi

  if fprintd-verify; then
    # fprintd's enroll message will pick a finger, right index by default.
    echo -e "\e[32m\nPerfect! Now you can use your fingerprint to login, sudo, and app auth (like 1password).\e[0m"

    echo -e "\e[32m\nYou can enroll additional fingers in settings.\e[0m"
  else
    echo -e "\e[31m\nSomething went wrong. Maybe try again?\e[0m"
  fi
fi
