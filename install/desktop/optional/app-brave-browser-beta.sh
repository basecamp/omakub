#!/usr/bin/env bash
# Install Brave Browser Beta

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
OMAKUB_ROOT="/home/joel/.local/share/omakub"
HELPERS_PATH="${OMAKUB_ROOT}/shared/helpers.sh"

if [ -f "$HELPERS_PATH" ]; then
  source "$HELPERS_PATH"
else
  echo "Error: Helper functions not found at $HELPERS_PATH"
  exit 1
fi

APP_NAME="brave-browser-beta"
TEMP_DIR=$(create_temp_dir)
LOG_FILE=$(setup_log "$APP_NAME")

log_message "INFO" "Starting Brave Browser Beta installation..." "$LOG_FILE"

# Prerequisites
log_message "INFO" "Checking and installing prerequisites..." "$LOG_FILE"
gum spin --spinner dot --title "Updating package lists..." -- bash -c "sudo apt-get update 2>&1 | tee '${TEMP_DIR}/apt_update_output.txt'"
cat "${TEMP_DIR}/apt_update_output.txt" >> "$LOG_FILE"
gum spin --spinner dot --title "Installing dependencies..." -- bash -c "sudo apt-get install -y curl gpg apt-transport-https 2>&1 | tee '${TEMP_DIR}/apt_install_output.txt'"
cat "${TEMP_DIR}/apt_install_output.txt" >> "$LOG_FILE"

# Setup GPG key and repo
KEY_PATH="/usr/share/keyrings/brave-browser-beta-archive-keyring.gpg"
KEY_FILE="brave-browser-beta-archive-keyring.gpg"
REPO_PATH="/etc/apt/sources.list.d/brave-browser-beta.list"

gum spin --spinner dot --title "Downloading Brave Browser Beta key..." -- \
  bash -c "sudo curl -fsSLo '${KEY_PATH}' https://brave-browser-apt-beta.s3.brave.com/${KEY_FILE} 2>&1"
if [ -f "$KEY_PATH" ] && [ -s "$KEY_PATH" ]; then
  gum spin --spinner dot --title "Setting up Brave Beta repository..." -- \
    bash -c "echo 'deb [signed-by=${KEY_PATH}] https://brave-browser-apt-beta.s3.brave.com/ stable main' | sudo tee ${REPO_PATH} > /dev/null"
else
  log_message "ERROR" "Failed to install GPG key for Brave Browser Beta" "$LOG_FILE"
  exit 1
fi

gum spin --spinner dot --title "Updating package lists..." -- bash -c "sudo apt-get update -y 2>&1 | tee '${TEMP_DIR}/apt_update_after_key.txt'"
cat "${TEMP_DIR}/apt_update_after_key.txt" >> "$LOG_FILE"

# Install Brave Beta
if package_installed "brave-browser-beta"; then
  gum style --foreground 10 -- "✓ Brave Browser Beta is already installed"
else
  gum spin --spinner line --title "Installing Brave Browser Beta..." -- \
    bash -c "sudo apt-get install -y brave-browser-beta 2>&1 | tee '${TEMP_DIR}/brave-browser-beta-install.txt'"
  if package_installed "brave-browser-beta"; then
    gum style --foreground 10 -- "✓ Brave Browser Beta installed successfully"
  else
    gum style --foreground 9 -- "✗ Failed to install Brave Browser Beta"
    exit 1
  fi
fi

gum style --foreground 212 -- "✨ Brave Browser Beta Installation Complete! ✨"
log_message "INFO" "Brave Browser Beta installation complete." "$LOG_FILE"
sudo cp "$LOG_FILE" "/usr/local/share/brave-browser-beta-install-log-$(date +%Y%m%d_%H%M%S).log"
