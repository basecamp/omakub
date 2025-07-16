#!/bin/bash

sudo echo "Running upgrade migration..."

# Add rustc and pgsql client libs
source $OMAKUB_PATH/install/terminal/libraries.sh

# Set name and class for desktop files
source $OMAKUB_PATH/applications/About.sh
source $OMAKUB_PATH/applications/Activity.sh
source $OMAKUB_PATH/applications/Basecamp.sh
source $OMAKUB_PATH/applications/HEY.sh
source $OMAKUB_PATH/applications/Docker.sh
source $OMAKUB_PATH/applications/Neovim.sh
source $OMAKUB_PATH/applications/Omakub.sh
source $OMAKUB_PATH/applications/WhatsApp.sh
