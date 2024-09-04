cd /tmp
TARGET_ARCH=$(["$(dpkg --print-architecture)" = "arm64"] && echo "aarch64" || echo "x86_64")
wget -O zellij.tar.gz "https://github.com/zellij-org/zellij/releases/latest/download/zellij-${TARGET_ARCH}-unknown-linux-musl.tar.gz"
tar -xf zellij.tar.gz zellij
sudo install zellij /usr/local/bin
rm zellij.tar.gz zellij
cd -

mkdir -p ~/.config/zellij/themes
[ ! -f "$HOME/.config/zellij/config.kdl" ] && cp ~/.local/share/omakub/configs/zellij.kdl ~/.config/zellij/config.kdl
cp ~/.local/share/omakub/themes/tokyo-night/zellij.kdl ~/.config/zellij/themes/tokyo-night.kdl
