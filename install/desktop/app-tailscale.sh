# It is recommended to install VPNs via layering
# Ref: https://discord.com/channels/1202304549294190602/1202306391499620402/1312951127418998806
if ! which tailscale > /dev/null; then
  sudo curl -L https://pkgs.tailscale.com/stable/fedora/tailscale.repo -o /etc/yum.repos.d/tailscale.repo
  rpm-ostree install tailscale
fi
