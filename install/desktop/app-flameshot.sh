# Flameshot is a nice step-up over the default Gnome screenshot tool
cd /tmp
curl --remote-name \
    --remote-header-name \
    --location $(curl -s https://api.github.com/repos/flameshot-org/flameshot/releases/latest \
                | grep -Po 'https://github.com/flameshot-org/flameshot/releases/download/[^}]*\.AppImage' \
                | uniq)
chmod +x Flameshot-*.AppImage
mv Flameshot-*.AppImage ~/.local/bin/flameshot
cd -
