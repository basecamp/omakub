#!/bin/bash

if [ ! -f /etc/os-release ]; then
    echo "$(tput setaf 1)Error: Unable to determine OS. /etc/os-release file not found."
    echo "Installation stopped."
    exit 1
fi

. /etc/os-release

# Check if running on Fedora 41
if [ "$ID" != "fedora" ] || [ "$VERSION_ID" != "41" ]; then
    echo "$(tput setaf 1)Error: OS requirement not met"
    echo "You are currently running: $ID $VERSION_ID"
    echo "OS required: Fedora 41"
    echo "Installation stopped."
    exit 1
fi
