#!/bin/bash

echo "Downloading the VirtIO drivers to ~/Downloads"
mkdir -p ~/Downloads
wget -O ~/Downloads/virtio-win-0.1.240.iso https://fedorapeople.org/groups/virt/virtio-win/direct-downloads/archive-virtio/virtio-win-0.1.240-1/virtio-win-0.1.240.iso

echo "Download the Windows 11 ISO..."
open https://www.microsoft.com/software-download/windows11
gum confirm "Have you finished downloading?"

echo "Follow instructions in..."
open https://sysguides.com/install-a-windows-11-virtual-machine-on-kvm
