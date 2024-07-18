cd /tmp

if [[ -z $UTILS_SOURCED ]]; then
    source ~/.local/share/omakub/utils.sh
fi
ARCH=$(get_arch "vscode") 

if wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor >packages.microsoft.gpg; then
    sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
    echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" | sudo tee /etc/apt/sources.list.d/vscode.list >/dev/null
    rm -f packages.microsoft.gpg
    cd -

    sudo apt update -y
    sudo apt install -y code

    mkdir -p ~/.config/Code/User
    cp ~/.local/share/omakub/configs/vscode.json ~/.config/Code/User/settings.json

    # Install default supported themes
    code --install-extension enkia.tokyo-night
    cd -
elif wget -O code.deb "https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-${ARCH}"; then
    sudo apt install -y ./code.deb
    rm code.deb

    mkdir -p ~/.config/Code/User
    cp ~/.local/share/omakub/configs/vscode.json ~/.config/Code/User/settings.json

    # Install default supported themes
    code --install-extension enkia.tokyo-night
    cd -
else
    cd -
    false
fi

