#!/bin/bash
set -e;

declare -A arch_config=(
    ["chrome.x86_64"]="amd64"
    ["chrome.aarch64"]="arm64"
    ["signal.x86_64"]="amd64"
    ["signal.aarch64"]="arm64"
    ["zoom.x86_64"]="amd64"
    ["zoom.aarch64"]="arm64"
    ["localsend.x86_64"]="x86-64"
    ["localsend.aarch64"]="arm-64"
    ["lazygit.aarch64"]="arm64"
    ["lazydocker.aarch64"]="arm64"
)

get_arch_config() {
    local arch="${1}"
    local prog="${2:-"default"}"
    local searchStr="${prog}.${arch}"
    local archAlias="${arch_config[$searchStr]:-$arch}"
    echo -n "$archAlias"
}

get_arch() {
    local prog="$1"
    local ARCH=$(lscpu | awk -F: 'NR==1 {print $2}' | xargs)
    echo -n "$(get_arch_config "$ARCH" "$prog")"
}