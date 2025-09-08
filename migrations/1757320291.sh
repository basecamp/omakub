#!/bin/bash

# Update Gum
echo -e "\e[32m\nUpdating gum...\e[0m"
echo
cd /tmp
GUM_VERSION="0.16.2" # Tested Version
wget -qO gum.deb "https://github.com/charmbracelet/gum/releases/download/v${GUM_VERSION}/gum_${GUM_VERSION}_amd64.deb"
sudo apt-get install -y --allow-downgrades ./gum.deb
rm gum.deb
cd -

# Install Wofi
echo -e "\e[32m\nInstalling wofi...\e[0m"
echo
sudo apt install -y wofi

# Install Starship
echo -e "\e[32m\nInstalling starship...\e[0m"
echo
curl -sS https://starship.rs/install.sh | sh -s -- -y

# Update Zellij
echo -e "\e[32m\nUpdating zellij...\e[0m"
echo
cd /tmp
wget -O zellij.tar.gz "https://github.com/zellij-org/zellij/releases/latest/download/zellij-x86_64-unknown-linux-musl.tar.gz"
tar -xf zellij.tar.gz zellij
sudo install zellij /usr/local/bin
rm zellij.tar.gz zellij
cd -

# Install Chromium
echo -e "\e[32m\nInstalling Chromium...\e[0m"
echo
source ~/.local/share/omakub/applications/install/chromium.sh

# Install ufw
echo -e "\e[32m\nInstalling ufw...\e[0m"
echo
sudo apt install -y ufw

# Configs
echo -e "\e[32m\nApplying new Omakub configurations...\e[0m"
echo

# Configure the bash shell using Omakub defaults
mv ~/.bashrc ~/.bashrc.bak
cp ~/.local/share/omakub/default/bashrc ~/.bashrc
# Remove .inputrc if it exists
[ -f ~/.inputrc ] && mv ~/.inputrc ~/.inputrc.bak

# Migrate to new configs
omakub-refresh-config alacritty/alacritty.toml
omakub-refresh-config btop/btop.conf
omakub-refresh-fastfetch
omakub-refresh-config zellij/config.kdl
omakub-refresh-config brave-flags.conf
omakub-refresh-config chromium-flags.conf
omakub-refresh-config starship.toml

mkdir -p ~/.config/wofi
cp -R ~/.local/share/omakub/config/wofi/* ~/.config/wofi

cp -R ~/.local/share/omakub/config/nvim/* ~/.config/nvim/

# Applications
echo -e "\e[32m\nApplying application configurations...\e[0m"
echo

rm -rf ~/.local/share/applications/About.desktop
rm -rf ~/.local/share/applications/Basecamp.desktop
rm -rf ~/.local/share/applications/Hey.desktop
rm -rf ~/.local/share/applications/Neovim.desktop
rm -rf ~/.local/share/applications/Omakub.desktop
rm -rf ~/.local/share/applications/WhatsApp.desktop
rm -rf ~/.local/share/applications/icons

source ~/.local/share/omakub/install/config/defaults.sh

omakub-webapp-install "HEY" https://app.hey.com https://www.hey.com/assets/images/general/hey.png
omakub-webapp-install "Basecamp" https://launchpad.37signals.com https://basecamp.com/assets/images/general/basecamp.png
omakub-webapp-install "WhatsApp" https://web.whatsapp.com/ https://cdn.jsdelivr.net/gh/homarr-labs/dashboard-icons/png/whatsapp.png

# Firewall
echo -e "\e[32m\nApplying Firewall...\e[0m"
echo

source ~/.local/share/omakub/install/config/firewall.sh

# Hotkeys
echo -e "\e[32m\nApplying Hotkey...\e[0m"
echo

source ~/.local/share/omakub/install/config/gnome/hotkeys.sh

# Theme
echo -e "\e[32m\nApplying Theme...\e[0m"
echo

source ~/.local/share/omakub/install/config/theme.sh

# Boot and Login
echo -e "\e[32m\nApplying new Boot and Login configurations...\e[0m"
echo
source ~/.local/share/omakub/install/login/plymouth.sh
source ~/.local/share/omakub/install/login/gdm3.sh
source ~/.local/share/omakub/install/login/alt-bootloaders.sh

# Migrations
echo -e "\e[32m\nTurning off previous migrations...\e[0m"
echo
source ~/.local/share/omakub/install/preflight/migrations.sh

# Finish
echo -e "\e[32m\nMigration completed! Please restart your computer to apply all changes.\e[0m"
echo
gum confirm "Restart now?" && systemctl reboot now