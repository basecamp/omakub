# Needed for all installers
sudo apt update -y
sudo apt upgrade -y
sudo apt install -y curl git unzip

# Run terminal each installer
for installer in ~/.local/share/omakub/install/terminal/*.sh; do source $installer; done
