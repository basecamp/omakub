cd ~/Downloads
if [[ "$ARCH" == "amd64" ]]; then
  ZELLIJ_ARCH="x86_64"
else
  ZELLIJ_ARCH="aarch64"
fi

wget -O zellij.tar.gz "https://github.com/zellij-org/zellij/releases/latest/download/zellij-${ZELLIJ_ARCH}-unknown-linux-musl.tar.gz"
tar -xf zellij.tar.gz zellij
sudo install zellij /usr/local/bin
rm zellij.tar.gz zellij
cd -

mkdir -p ~/.config/zellij/
[ ! -f "$HOME/.config/zellij/config.kdl" ] && cp ~/.local/share/omakub/configs/zellij.kdl ~/.config/zellij/config.kdl
[ ! -L "$HOME/.config/zellij/themes" ] && ln -s ~/.local/share/omakub/themes/zellij ~/.config/zellij/themes
