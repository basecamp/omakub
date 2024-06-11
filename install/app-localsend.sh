cd ~/Downloads
LOCALSEND_VERSION=$(curl -s "https://api.github.com/repos/localsend/localsend/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
#For some reason, Localsend uses x86_64 instead of amd64 for naming, which means we can't use the variable ARCH for a 1 liner
if [[ $ARCH == "arm64" ]]; then
    wget -O localsend.deb "https://github.com/localsend/localsend/releases/latest/download/LocalSend-${LOCALSEND_VERSION}-linux-arm-64.deb"
elif [[ $ARCH == "amd64" ]]; then
    wget -O localsend.deb "https://github.com/localsend/localsend/releases/latest/download/LocalSend-${LOCALSEND_VERSION}-linux-x86-64.deb"
fi
sudo apt install -y ./localsend.deb
rm localsend.deb
cd -