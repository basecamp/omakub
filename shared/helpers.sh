#!/usr/bin/env bash

# Shared helper functions for Omakub installation scripts
# This file contains common utilities used across multiple scripts

# Define colors for output
GREEN="\033[0;32m"
RED="\033[0;31m"
YELLOW="\033[0;33m"
BLUE="\033[0;34m"
BOLD="\033[1m"
RESET="\033[0m"

# Setup logging for scripts
# Usage: setup_log "app-name"
setup_log() {
  local app_name="$1"
  local timestamp=$(date '+%Y%m%d_%H%M%S')
  local log_dir="${HOME}/.local/share/omakub/logs"
  
  # Create logs directory if it doesn't exist
  mkdir -p "$log_dir"
  
  # Create log file with timestamp
  local log_file="${log_dir}/${app_name}_install_${timestamp}.log"
  
  # Return the log file path
  echo "$log_file"
}

# Print a formatted message with timestamp
# Usage: log_message "INFO" "Message to log" "$log_file"
log_message() {
  local level="$1"
  local message="$2"
  local log_file="$3"
  local timestamp=$(date '+%Y-%m-%d %H:%M:%S')
  
  case "$level" in
    "INFO")
      level_color="$BLUE"
      ;;
    "SUCCESS")
      level_color="$GREEN"
      ;;
    "WARNING")
      level_color="$YELLOW"
      ;;
    "ERROR")
      level_color="$RED"
      ;;
    *)
      level_color="$RESET"
      ;;
  esac
  
  # Print to console with color
  echo -e "${level_color}${timestamp} [${level}]${RESET} ${message}"
  
  # Print to log file without color codes
  echo "${timestamp} [${level}] ${message}" >> "$log_file"
}
