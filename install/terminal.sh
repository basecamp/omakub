# Needed for all installers
sudo apt update -y
sudo apt upgrade -y
sudo apt install -y curl git unzip

# Run required installers first
for installer in ~/.local/share/omakub/install/terminal/required/*.sh; do source $installer; done

# Run terminal installers
for installer in ~/.local/share/omakub/install/terminal/*.sh; do source $installer; done
