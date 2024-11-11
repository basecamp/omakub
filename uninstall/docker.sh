sudo dnf remove -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin docker-ce-rootless-extras
sudo rm /etc/yum.repos.d/docker-ce.repo
sudo groupdel docker
