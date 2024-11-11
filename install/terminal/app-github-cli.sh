sudo rpm --import https://cli.github.com/packages/githubcli-archive-keyring.gpg
sudo tee /etc/yum.repos.d/github-cli.repo <<EOF
[github-cli]
name=GitHub CLI
baseurl=https://cli.github.com/packages/rpm/gh-cli.repo
enabled=1
gpgcheck=1
gpgkey=https://cli.github.com/packages/githubcli-archive-keyring.gpg
EOF
sudo dnf update
sudo dnf install -y gh
