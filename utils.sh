#!/bin/bash
set -e;

UTILS_SOURCED=true

logRED='\033[0;31m'
logGREEN='\033[0;32m' 
logBLUE='\033[0;34m'
logCYAN='\033[0;36m' 
logNEUT='\033[0m'
clearLINE='\033[K'

function includes() {
    local haystack=("${@:1: $#-1}")
    local needle="${@: -1}"
    for item in "${haystack[@]}"; do
        if [[ "$item" == "$needle" ]]; then
            return 0
        fi
    done
    return 1
}

#Usage:  issueInfo "PROCESSING: %s" "${trgtFolder}/$d"
function issueWarning() {
    printf "${logRED}---::WARNING::---\n$1\n---::---${logNEUT}\n" ${@: 2};
}

function issueInfo() {
    printf "${logCYAN}---::INFO: ""$1 ""::---${logNEUT}\n" ${@: 2};
}

function issueSuccess() {
    printf "${logGREEN}---::INFO: ""$1 ""::---${logNEUT}\n" ${@: 2};
}

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

omakub_installation_success=()
omakub_installation_failed=()

handle_omakub_source_error() {
    local installer = "$1"
    omakub_installation_failed+=("$installer")
}

handle_omakub_source_success() {
    local installer = "$1"
    omakub_installation_success+=("$installer")
}

print_omakub_report() {
    for element in "${omakub_installation_success[@]}"; do
        issueSuccess "[+] %s completed." "$element"
    done
    echo "---::::---"
    for element in "${omakub_installation_failed[@]}"; do
        issueWarning "[-] %s failed." "$element"
    done
}

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