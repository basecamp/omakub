#!/bin/bash

# Script to generate a new empty .sh file named with the current Unix timestamp
# in a specified directory.

# --- Configuration ---
# Set to true to use a more human-readable date format (YYYYMMDD_HHMMSS.sh)
# Set to false to use Unix timestamp (e.g., 1718359027.sh)
USE_HUMAN_READABLE_DATE=false

# --- Script Logic ---

# Check if a directory argument is provided
# if [ -z "$1" ]; then
#   echo "Usage: $0 <directory_path>"
#   echo "Example: $0 /home/joel/migrations"
#   exit 1
# fi

# TARGET_DIR="$1"
TARGET_DIR="${HOME}/.local/share/omakub/migrations"

# Check if the provided path actually exists and is a directory
if [ ! -d "$TARGET_DIR" ]; then
  echo "Error: Directory '$TARGET_DIR' does not exist or is not a directory."
  sleep 2
  exit 1
fi

# Check if the directory is writable
if [ ! -w "$TARGET_DIR" ]; then
  echo "Error: Directory '$TARGET_DIR' is not writable. Please check permissions."
  sleep 2
  exit 1
fi

# Generate the filename
if [ "$USE_HUMAN_READABLE_DATE" = true ]; then
  # Human-readable format: YYYYMMDD_HHMMSS.sh
  FILENAME="$(date +'%Y%m%d_%H%M%S').sh"
else
  # Unix timestamp format (seconds since epoch): 1718359027.sh
  # This matches the pattern you initially provided.
  CURRENT_TIMESTAMP=$(date +%s)
  FILENAME="${CURRENT_TIMESTAMP}.sh"
fi

FULL_PATH="${TARGET_DIR}/${FILENAME}"

# Check if a file with this name already exists (optional, as touch handles it)
# Timestamps are generally unique enough, but good for awareness.
if [ -e "$FULL_PATH" ]; then
  echo "Warning: File '$FULL_PATH' already exists. Touch will update its timestamp."
fi

# Create the empty file
if touch "$FULL_PATH"; then
  echo "Successfully created empty file: $FULL_PATH"
  # You can optionally make it executable if these are typically scripts to be run
  # chmod +x "$FULL_PATH"
  # echo "Made file executable: $FULL_PATH"
else
  echo "Error: Failed to create file '$FULL_PATH'."
  sleep 2
  exit 1
fi

# exit 0