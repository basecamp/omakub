cd ~/Downloads
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')

#For some reason, Lazygit uses x86_64 instead of amd64 for naming, which means we can't use the variable ARCH for a 1 liner
if [[ $ARCH == "arm64" ]]; then
    curl -sLo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit${LAZYGIT_VERSION}_Linux_${ARCH}.tar.gz"
elif [[ $ARCH == "amd64" ]]; then
    curl -sLo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
fi
tar -xf lazygit.tar.gz lazygit
sudo install lazygit /usr/local/bin
rm lazygit.tar.gz
cd -
