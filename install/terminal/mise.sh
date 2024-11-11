# Install mise for managing multiple versions of languages. See https://mise.jdx.dev/
sudo dnf update -y && sudo dnf install -y gpg wget curl
sudo mkdir -p /etc/yum.repos.d
wget -qO - https://mise.jdx.dev/gpg-key.pub | gpg --dearmor | sudo tee /etc/yum.repos.d/mise-archive-keyring.gpg 1>/dev/null
echo "[mise]
name=mise Repository
baseurl=https://mise.jdx.dev/rpm
enabled=1
gpgcheck=1
gpgkey=file:///etc/yum.repos.d/mise-archive-keyring.gpg
" | sudo tee /etc/yum.repos.d/mise.repo
sudo dnf update
sudo dnf install -y mise
