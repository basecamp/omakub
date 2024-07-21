cd /tmp
if [[ -z $UTILS_SOURCED ]]; then
    source ~/.local/share/omakub/utils.sh
fi
ARCH=$(get_arch "localsend")
LOCALSEND_VERSION=$(curl -s "https://api.github.com/repos/localsend/localsend/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
if wget -O localsend.deb "https://github.com/localsend/localsend/releases/latest/download/LocalSend-${LOCALSEND_VERSION}-linux-${ARCH}.deb"; then
    sudo apt install -y ./localsend.deb
    rm localsend.deb
    cd -
else
    cd -
    false
fi
