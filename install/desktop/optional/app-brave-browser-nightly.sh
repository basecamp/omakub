#!/usr/bin/env bash
# Install Brave Browser Nightly

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
OMAKUB_ROOT="/home/joel/.local/share/omakub"
HELPERS_PATH="${OMAKUB_ROOT}/shared/helpers.sh"

if [ -f "$HELPERS_PATH" ]; then
  source "$HELPERS_PATH"
else
  echo "Error: Helper functions not found at $HELPERS_PATH"
  exit 1
fi

APP_NAME="brave-browser-nightly"
TEMP_DIR=$(create_temp_dir)
LOG_FILE=$(setup_log "$APP_NAME")

log_message "INFO" "Starting Brave Browser Nightly installation..." "$LOG_FILE"

# Prerequisites
log_message "INFO" "Checking and installing prerequisites..." "$LOG_FILE"
gum spin --spinner dot --title "Updating package lists..." -- bash -c "sudo apt-get update 2>&1 | tee '${TEMP_DIR}/apt_update_output.txt'"
cat "${TEMP_DIR}/apt_update_output.txt" >> "$LOG_FILE"
gum spin --spinner dot --title "Installing dependencies..." -- bash -c "sudo apt-get install -y curl gpg apt-transport-https 2>&1 | tee '${TEMP_DIR}/apt_install_output.txt'"
cat "${TEMP_DIR}/apt_install_output.txt" >> "$LOG_FILE"

# Setup GPG key and repo
KEY_PATH="/usr/share/keyrings/brave-browser-nightly-archive-keyring.gpg"
KEY_FILE="brave-browser-nightly-archive-keyring.gpg"
REPO_PATH="/etc/apt/sources.list.d/brave-browser-nightly.list"

gum spin --spinner dot --title "Downloading Brave Browser Nightly key..." -- \
  bash -c "sudo curl -fsSLo '${KEY_PATH}' https://brave-browser-apt-nightly.s3.brave.com/${KEY_FILE} 2>&1"
if [ -f "$KEY_PATH" ] && [ -s "$KEY_PATH" ]; then
  gum spin --spinner dot --title "Setting up Brave Nightly repository..." -- \
    bash -c "echo 'deb [signed-by=${KEY_PATH}] https://brave-browser-apt-nightly.s3.brave.com/ stable main' | sudo tee ${REPO_PATH} > /dev/null"
else
  log_message "ERROR" "Failed to install GPG key for Brave Browser Nightly" "$LOG_FILE"
  exit 1
fi

gum spin --spinner dot --title "Updating package lists..." -- bash -c "sudo apt-get update -y 2>&1 | tee '${TEMP_DIR}/apt_update_after_key.txt'"
cat "${TEMP_DIR}/apt_update_after_key.txt" >> "$LOG_FILE"

# Install Brave Nightly
if package_installed "brave-browser-nightly"; then
  gum style --foreground 10 -- "✓ Brave Browser Nightly is already installed"
else
  gum spin --spinner line --title "Installing Brave Browser Nightly..." -- \
    bash -c "sudo apt-get install -y brave-browser-nightly 2>&1 | tee '${TEMP_DIR}/brave-browser-nightly-install.txt'"
  if package_installed "brave-browser-nightly"; then
    gum style --foreground 10 -- "✓ Brave Browser Nightly installed successfully"
  else
    gum style --foreground 9 -- "✗ Failed to install Brave Browser Nightly"
    exit 1
  fi
fi

gum style --foreground 212 -- "✨ Brave Browser Nightly Installation Complete! ✨"
log_message "INFO" "Brave Browser Nightly installation complete." "$LOG_FILE"
sudo cp "$LOG_FILE" "/usr/local/share/brave-browser-nightly-install-log-$(date +%Y%m%d_%H%M%S).log"
