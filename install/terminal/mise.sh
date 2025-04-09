# Install mise for managing multiple versions of languages. See https://mise.jdx.dev/
sudo dnf update -y && sudo dnf install -y gpg wget curl
sudo install -dm 755 /etc/dnf/keyrings
wget -qO - https://mise.jdx.dev/gpg-key.pub | gpg --dearmor | sudo tee /etc/dnf/keyrings/mise-archive-keyring.gpg 1>/dev/null
echo "deb [signed-by=/etc/dnf/keyrings/mise-archive-keyring.gpg arch=$(dpkg --print-architecture)] https://mise.jdx.dev/deb stable main" | sudo tee /etc/dnf/sources.list.d/mise.list
sudo dnf update
sudo dnf install -y mise
