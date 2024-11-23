# Install the omakase-toolbox distrobox for terminal usage
[ -f "~/.config/containers/systemd/omakase-toolbox.container" ] && mv ~/.config/containers/systemd/omakase-toolbox.container ~/.config/containers/systemd/omakase-toolbox.container.bak
mkdir -p ~/.config/containers/systemd
cp ~/.local/share/omakase-bluefin/configs/omakase-toolbox.container ~/.config/containers/systemd/omakase-toolbox.container
systemctl --user daemon-reload
systemctl --user start omakase-toolbox.service

# Disable built-in ephemeral containers
systemctl disable --now --user ubuntu-toolbox.target fedora-toolbox.target
