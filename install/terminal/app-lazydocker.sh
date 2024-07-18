cd /tmp
source ~/.local/share/omakub/get_arch.sh
ARCH=$(get_arch "lazydocker")
LAZYDOCKER_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazydocker/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
if curl -sLo lazydocker.tar.gz "https://github.com/jesseduffield/lazydocker/releases/latest/download/lazydocker_${LAZYDOCKER_VERSION}_Linux_${ARCH}.tar.gz"; then
    tar -xf lazydocker.tar.gz lazydocker
    sudo install lazydocker /usr/local/bin
    rm lazydocker.tar.gz lazydocker
fi
cd -
