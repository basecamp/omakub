#!/usr/bin/env bash
set -euo pipefail

# ── CLI flags ──────────────────────────────────────────────────────────────
REPO_RAW=https://raw.githubusercontent.com/Aaronontheweb/ardbegian/master/boot.sh
VM_NAME=omakub-test
PASSWD=omakub     # password for “ubuntu” (RDP)

while [[ $# -gt 0 ]]; do
  case $1 in
    --vm)     VM_NAME="$2"; shift 2 ;;
    --passwd) PASSWD="$2"; shift 2 ;;
    *) echo "Unknown flag $1"; exit 1 ;;
  esac
done

# ── LAUNCH VM, pass user-data on stdin ─────────────────────────────────────
echo "▶ Launching VM '${VM_NAME}' …"

multipass launch 24.04 \
  --name    "${VM_NAME}" \
  --cpus    4            \
  --memory  8G           \
  --disk    25G          \
  --cloud-init - <<EOF
#cloud-config
ssh_pwauth: true

chpasswd:
  list: |
    ubuntu:${PASSWD}
  expire: false

package_update: true
packages:
  - curl
  - git
  - ubuntu-desktop-minimal
  - gnome-shell-extension-manager
  - xrdp

# optional: guarantee DHCP + DNS every boot
write_files:
  - path: /etc/netplan/50-multipass.yaml
    permissions: '0644'
    content: |
      network:
        version: 2
        ethernets:
          ens3:
            dhcp4: true
            nameservers:
              addresses: [1.1.1.1, 8.8.8.8]

runcmd:
  # enable & start RDP
  - [ systemctl, enable, xrdp ]
  - [ systemctl, restart, xrdp ]

  # fetch and execute boot.sh under the ubuntu user
  - [ bash, -c, "su - ubuntu -c 'curl -fsSL ${REPO_RAW} -o ~/boot.sh'" ]
  - [ bash, -c, "su - ubuntu -c 'chmod +x ~/boot.sh && ~/boot.sh'" ]
EOF

# ── PRINT RDP INFO ─────────────────────────────────────────────────────────
IP=\$(multipass info "$VM_NAME" | awk '/IPv4/ {print \$2}')

cat <<EOS

🎉  VM is booting.  When it’s ready, connect via RDP:

    Host : \$IP
    User : ubuntu
    Pass : $PASSWD

The fetched 'boot.sh' script will finish cloning & setup automatically.

To reset:

    multipass delete ${VM_NAME} && multipass purge
    ./test-omakub.sh --vm ${VM_NAME}

EOS
