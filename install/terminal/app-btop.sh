# This script installs btop, a resource monitor that shows usage and stats for processor, memory, disks, network and processes.
sudo apt install -y btop

# Only attempt to set configuration if btop is not already set
if [ ! -f "$HOME/.config/btop/btop.conf" ]; then
  # Use Omakub btop config
  mkdir -p ~/.config/btop
  cp ~/.local/share/omakub/configs/btop.conf ~/.config/btop/btop.conf
fi