#!/bin/bash

# Define the desktop path
DESKTOP_FOLDER="$HOME/Desktop"

# Create the projects folder on the desktop
mkdir -p "$DESKTOP_FOLDER"

# Create subfolders inside the projects folder
mkdir -p "$DESKTOP_FOLDER/dblscoop"
mkdir -p "$DESKTOP_FOLDER/dblscoop/admin"
mkdir -p "$DESKTOP_FOLDER/dblscoop/clients"
mkdir -p "$DESKTOP_FOLDER/dblscoop/clients/0-templates"
mkdir -p "$DESKTOP_FOLDER/dblscoop/documents"
mkdir -p "$DESKTOP_FOLDER/dblscoop/projects"
mkdir -p "$DESKTOP_FOLDER/dblscoop/vs-workspaces"
mkdir -p "$DESKTOP_FOLDER/work"
mkdir -p "$DESKTOP_FOLDER/work/vectorworks"
mkdir -p "$DESKTOP_FOLDER/work/captavi"
mkdir -p "$DESKTOP_FOLDER/explorations"
mkdir -p "$DESKTOP_FOLDER/explorations/ai"
mkdir -p "$DESKTOP_FOLDER/explorations/go"
mkdir -p "$DESKTOP_FOLDER/games"
mkdir -p "$DESKTOP_FOLDER/games/minecraft"
mkdir -p "$DESKTOP_FOLDER/personal"
mkdir -p "$DESKTOP_FOLDER/personal/notes"
mkdir -p "$DESKTOP_FOLDER/personal/projects"
mkdir -p "$DESKTOP_FOLDER/personal/vs-workspaces"

# Print success message
echo "Folders created successfully in $DESKTOP_FOLDER."
