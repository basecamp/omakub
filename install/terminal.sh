# Needed for all installers
brew install curl unzip

# Run terminal installers
for installer in ~/.local/share/omakase-bluefin/install/terminal/*.sh; do source $installer; done
