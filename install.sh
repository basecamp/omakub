# Libraries and infrastructure
echo -e "\e[32mINSTALLING OMAKUB\e[0m"

# Needed for all installers
sudo apt update -y
sudo apt install -y curl git

# Run installers
for script in ~/.omakub/install/*.sh; do source $script; done

# Reboot to pickup changes
read -p "Ready to reboot the system for all settings to take effect? (YES/no): " response
if [[ -z "$response" || "$response" =~ ^[Yy][Ee][Ss]$ || "$response" =~ ^[Yy]$ ]]; then
	sudo reboot
fi
