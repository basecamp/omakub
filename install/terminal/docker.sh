# Add the official Docker repo
sudo install -m 0755 -d /etc/dnf/keyrings
sudo wget -qO /etc/dnf/keyrings/docker.asc https://download.docker.com/linux/ubuntu/gpg
sudo chmod a+r /etc/dnf/keyrings/docker.asc
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/dnf/keyrings/docker.asc] https://download.docker.com/linux/ubuntu $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | sudo tee /etc/dnf/sources.list.d/docker.list > /dev/null
sudo dnf update

# Install Docker engine and standard plugins
sudo dnf install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin docker-ce-rootless-extras

# Give this user privileged Docker access
sudo usermod -aG docker ${USER}

# Limit log size to avoid running out of disk
echo '{"log-driver":"json-file","log-opts":{"max-size":"10m","max-file":"5"}}' | sudo tee /etc/docker/daemon.json
