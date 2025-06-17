cd /tmp
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor >packages.microsoft.gpg
sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" | sudo tee /etc/apt/sources.list.d/vscode.list >/dev/null
rm -f packages.microsoft.gpg
cd -

sudo apt update -y
sudo apt install -y code
# Installing vscode creates a new vscode.sources file in the
# /etc/apt/sources.list.d, which conflicts with the vscode.list file we created
# to do the installation. We can remove it now.
sudo rm -f /etc/apt/sources.list.d/vscode.list
sudo rm -f /etc/apt/keyrings/packages.microsoft.gpg

mkdir -p ~/.config/Code/User
cp "$BTR_OMAKUB_ROOT/configs/vscode.json" ~/.config/Code/User/settings.json

# Install default supported themes
code --install-extension enkia.tokyo-night

