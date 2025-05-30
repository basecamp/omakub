#!/usr/bin/env bash
# Install Brave Browser Stable

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
OMAKUB_ROOT="/home/joel/.local/share/omakub"
HELPERS_PATH="${OMAKUB_ROOT}/shared/helpers.sh"

if [ -f "$HELPERS_PATH" ]; then
  source "$HELPERS_PATH"
else
  echo "Error: Helper functions not found at $HELPERS_PATH"
  exit 1
fi

APP_NAME="brave-browser"
TEMP_DIR=$(create_temp_dir)
LOG_FILE=$(setup_log "$APP_NAME")

log_message "INFO" "Starting Brave Browser Stable installation..." "$LOG_FILE"

# Prerequisites
log_message "INFO" "Checking and installing prerequisites..." "$LOG_FILE"
gum spin --spinner dot --title "Updating package lists..." -- bash -c "sudo apt-get update 2>&1 | tee '${TEMP_DIR}/apt_update_output.txt'"
cat "${TEMP_DIR}/apt_update_output.txt" >> "$LOG_FILE"
gum spin --spinner dot --title "Installing dependencies..." -- bash -c "sudo apt-get install -y curl gpg apt-transport-https 2>&1 | tee '${TEMP_DIR}/apt_install_output.txt'"
cat "${TEMP_DIR}/apt_install_output.txt" >> "$LOG_FILE"

# Setup GPG key and repo
KEY_PATH="/usr/share/keyrings/brave-browser-archive-keyring.gpg"
KEY_FILE="brave-browser-archive-keyring.gpg"
REPO_PATH="/etc/apt/sources.list.d/brave-browser-release.list"

gum spin --spinner dot --title "Downloading Brave Browser Stable key..." -- \
  bash -c "sudo curl -fsSLo '${KEY_PATH}' https://brave-browser-apt-release.s3.brave.com/${KEY_FILE} 2>&1"
if [ -f "$KEY_PATH" ] && [ -s "$KEY_PATH" ]; then
  gum spin --spinner dot --title "Setting up Brave Stable repository..." -- \
    bash -c "echo 'deb [signed-by=${KEY_PATH}] https://brave-browser-apt-release.s3.brave.com/ stable main' | sudo tee ${REPO_PATH} > /dev/null"
else
  log_message "ERROR" "Failed to install GPG key for Brave Browser Stable" "$LOG_FILE"
  exit 1
fi

gum spin --spinner dot --title "Updating package lists..." -- bash -c "sudo apt-get update -y 2>&1 | tee '${TEMP_DIR}/apt_update_after_key.txt'"
cat "${TEMP_DIR}/apt_update_after_key.txt" >> "$LOG_FILE"

# Install Brave Stable
if package_installed "brave-browser"; then
  gum style --foreground 10 -- "✓ Brave Browser Stable is already installed"
else
  gum spin --spinner line --title "Installing Brave Browser Stable..." -- \
    bash -c "sudo apt-get install -y brave-browser 2>&1 | tee '${TEMP_DIR}/brave-browser-install.txt'"
  if package_installed "brave-browser"; then
    gum style --foreground 10 -- "✓ Brave Browser Stable installed successfully"
  else
    gum style --foreground 9 -- "✗ Failed to install Brave Browser Stable"
    exit 1
  fi
fi

gum style --foreground 212 -- "✨ Brave Browser Stable Installation Complete! ✨"
log_message "INFO" "Brave Browser Stable installation complete." "$LOG_FILE"
sudo cp "$LOG_FILE" "/usr/local/share/brave-browser-install-log-$(date +%Y%m%d_%H%M%S).log"
