cd ~/Downloads
curl -sLo zellij.tar.gz "https://github.com/zellij-org/zellij/releases/latest/download/zellij-x86_64-unknown-linux-musl.tar.gz"
tar -xf zellij.tar.gz zellij
sudo install zellij /usr/local/bin
rm zellij.tar.gz
cd -

mkdir -p ~/.config/zellij/
cp ~/.local/share/omakub/configs/zellij.kdl ~/.config/zellij/config.kdl
ln -s ~/.local/share/omakub/themes/zellij ~/.config/zellij/themes
