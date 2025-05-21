
#!/usr/bin/env bash

# Browse the web with the Beta version of the most popular browser.
# See https://www.google.com/chrome/beta/

# Source shared helpers
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(dirname "$(dirname "$SCRIPT_DIR")")"
source "$ROOT_DIR/../shared/helpers.sh"

app_name="chrome-beta"
log_file="$(setup_log "$app_name")"

tmp_dir="$(create_temp_dir)"
cd "$tmp_dir" || exit 1

deb_url="https://dl.google.com/linux/direct/google-chrome-beta_current_amd64.deb"
deb_file="$tmp_dir/google-chrome-beta_current_amd64.deb"

download_file "$deb_url" "$deb_file" "$log_file"
if install_deb_package "$deb_file" "$log_file"; then
  log_message "SUCCESS" "Google Chrome Beta installed successfully." "$log_file"
else
  log_message "ERROR" "Failed to install Google Chrome Beta." "$log_file"
  exit 1
fi

rm -f "$deb_file"
log_message "INFO" "Cleaned up the downloaded package." "$log_file"

xdg-settings set default-web-browser google-chrome-beta.desktop
log_message "INFO" "Set Google Chrome Beta as the default web browser." "$log_file"

log_message "SUCCESS" "Google Chrome Beta installation script finished." "$log_file"