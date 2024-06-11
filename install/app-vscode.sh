cd ~/Downloads
wget -O code.deb 'https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64'
sudo apt install -y ./code.deb
rm code.deb
cd -

mkdir -p ~/.config/Code/User
cp ~/.local/share/omakub/configs/vscode.json ~/.config/Code/User/settings.json

# Install default supported themes
code --install-extension dbaeumer.vscode-eslint
code --install-extension eamodio.gitlens
code --install-extension gruntfuggly.todo-tree
code --install-extension kaiwood.endwise
code --install-extension mashduek.jbuilder-highlight
code --install-extension ms-vscode-remote.vscode-remote-extensionpack
code --install-extension pkief.material-icon-theme
code --install-extension shopify.ruby-lsp
code --install-extension vue.volar
