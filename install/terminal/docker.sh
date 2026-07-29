#!/bin/bash

source "${OMAKUB_PATH:-$HOME/.local/share/omakub}/install/lib/compat.sh"

# Add the official Docker repo
if [ ! -f /etc/apt/sources.list.d/docker.list ]; then
    # Docker publishes per Ubuntu codename and only some months after a release
    # ships. Fall back to the newest suite it does carry rather than writing a
    # source that 404s and breaks every later apt update.
    DOCKER_SUITE=$(repo_best_suite https://download.docker.com/linux/ubuntu) || {
        omakub_note "Docker has no repo for $(omakub_ubuntu_codename) or any earlier release" >&2
        return 1 2>/dev/null || exit 1
    }

    if [ "$DOCKER_SUITE" != "$(omakub_ubuntu_codename)" ]; then
        omakub_note "Docker has no $(omakub_ubuntu_codename) repo yet, using $DOCKER_SUITE"
    fi

    [ -f /etc/apt/keyrings/docker.asc ] && sudo rm /etc/apt/keyrings/docker.asc
    sudo install -m 0755 -d /etc/apt/keyrings
    sudo wget -qO /etc/apt/keyrings/docker.asc https://download.docker.com/linux/ubuntu/gpg
    sudo chmod a+r /etc/apt/keyrings/docker.asc
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu $DOCKER_SUITE stable" | sudo tee /etc/apt/sources.list.d/docker.list >/dev/null
fi

# Install Docker engine and standard plugins
sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin docker-ce-rootless-extras

# Give this user privileged Docker access
sudo usermod -aG docker ${USER}

# Limit log size to avoid running out of disk
echo '{"log-driver":"json-file","log-opts":{"max-size":"10m","max-file":"5"}}' | sudo tee /etc/docker/daemon.json
