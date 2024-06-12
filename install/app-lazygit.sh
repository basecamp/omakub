cd ~/Downloads
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')

if [[ "$ARCH" == "amd64" ]]; then
  LAZYGIT_ARCH="x86_64"
else
  LAZYGIT_ARCH="$ARCH"  
fi

curl -sLo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit${LAZYGIT_VERSION}_Linux_${LAZYGIT_ARCH}.tar.gz"
tar -xf lazygit.tar.gz lazygit
sudo install lazygit /usr/local/bin
rm lazygit.tar.gz lazygit
cd -
