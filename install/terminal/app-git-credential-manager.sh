# Git credential helper that supports major source control hosts
cd /tmp
wget -O gcm.tar.gz "https://github.com/git-ecosystem/git-credential-manager/releases/download/v2.6.1/gcm-linux_amd64.2.6.1.tar.gz"
sudo tar -xvf ./gcm.tar.gz -C /usr/local/bin
git-credential-manager configure
rm ./gcm.tar.gz
cd -

git config --global credential.credentialStore secretservice
