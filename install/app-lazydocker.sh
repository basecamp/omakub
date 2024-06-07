cd ~/Downloads
LAZYDOCKER_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazydocker/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')

#For some reason, Lazydocker uses x86_64 instead of amd64 for naming, which means we can't use the variable ARCH for a 1 liner
if [[ $ARCH == "arm64" ]]; then
    curl -sLo lazydocker.tar.gz "https://github.com/jesseduffield/lazydocker/releases/latest/download/lazydocker_${LAZYDOCKER_VERSION}_Linux_${ARCH}.tar.gz"
elif [[ $ARCH == "amd64" ]]; then
    curl -sLo lazydocker.tar.gz "https://github.com/jesseduffield/lazydocker/releases/latest/download/lazydocker${LAZYDOCKER_VERSION}_Linux_x86_64.tar.gz"
fi
tar -xf lazydocker.tar.gz lazydocker
sudo install lazydocker /usr/local/bin
rm lazydocker.tar.gz
cd -
