# Catch 1.0.0 up to 1.1.0

# Add new applications
source $OMAKUB_PATH/install/app-fastfetch.sh
source $OMAKUB_PATH/install/flatpak.sh

# Add transparency to Neovim
mkdir -p ~/.config/nvim/plugin/after
source $OMAKUB_PATH/configs/neovim/transparency.lua ~/.config/nvim/plugin/after/

# Add the new Omakub application
source $OMAKUB_PATH/applications/Omakub.sh
