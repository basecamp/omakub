cd /tmp
source ~/.local/share/omakub/get_arch.sh
ARCH=$(get_arch "zellij")
if wget -O zellij.tar.gz "https://github.com/zellij-org/zellij/releases/latest/download/zellij-${ARCH}-unknown-linux-musl.tar.gz"; then
    ZELLIJ_SUCCESS=true
    tar -xf zellij.tar.gz zellij
    sudo install zellij /usr/local/bin
    rm zellij.tar.gz zellij

    mkdir -p ~/.config/zellij/themes
    [ ! -f "$HOME/.config/zellij/config.kdl" ] && cp ~/.local/share/omakub/configs/zellij.kdl ~/.config/zellij/config.kdl
    cp ~/.local/share/omakub/themes/tokyo-night/zellij.kdl ~/.config/zellij/themes/tokyo-night.kdl
fi
cd -
