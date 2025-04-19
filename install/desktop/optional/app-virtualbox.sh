# Virtualbox allows you to run VMs for other flavors of Linux or even Windows
# See https://ubuntu.com/tutorials/how-to-run-ubuntu-desktop-on-a-virtual-machine-using-virtualbox#1-overview
# for a guide on how to run Ubuntu inside it.

# First remove any conflicting virtualization options
sudo apt remove --purge -y qemu-kvm libvirt-daemon virt-manager

# Ensure kvm modprobes aren't still loaded
sudo modprobe -r kvm_amd
sudo modprobe -r kvm

sudo apt update
sudo apt install -y gcc-14 virtualbox virtualbox-ext-pack
sudo usermod -aG vboxusers ${USER}
