#!/bin/bash
set -e;

get_arch() {
    ARCH=$(lscpu | awk -F: 'NR==1 {print $2}' | xargs)
    if [ "$ARCH" == "aarch64" ]; then
        ARCH="arm64"
    fi
    echo "$ARCH"
}