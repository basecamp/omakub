#!/bin/bash
set -e;

#assoc array to list app specific arch aliases
declare -A arch_config=(
    ["gum.x86_64"]="amd64"
    ["gum.aarch64"]="arm64"
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
    ["vscode.x86_64"]="x64"
    ["vscode.aarch64"]="arm64"
    ["neovim.x86_64"]="x64"
)

#a getter func to lookup into above assos array. Unfound keys/default value is what is returned from lscpu
get_arch_config() {
    local arch="${1}"
    local prog="${2:-"default"}"
    local searchStr="${prog}.${arch}"
    local archAlias="${arch_config[$searchStr]:-$arch}"
    echo -n "$archAlias"
}

# Usage:
# echo "$(get_arch "chrome")" //for aarch64, returns arm64
get_arch() {
    local prog="$1"
    local ARCH=$(lscpu | awk -F: 'NR==1 {print $2}' | xargs)
    echo -n "$(get_arch_config "$ARCH" "$prog")"
}