#!/bin/bash

target_shell=$1
current_shell=$(basename "$SHELL")
timestamp=$(date +%Y%m%d_%H%M%S)
backup_dir="$HOME/.omakub-shell-backups/$timestamp"

# ============================================
# Confirmation
# ============================================
echo ""
gum style --border double --padding "1 2" --border-foreground 212 \
  "SHELL SWITCH" \
  "" \
  "From: $current_shell" \
  "To:   $target_shell" \
  "" \
  "This will:" \
  "  - Backup current config" \
  "  - Install $target_shell config" \
  "  - Migrate your customizations" \
  "  - Change default login shell"

echo ""
if ! gum confirm "Proceed?"; then
  echo "Cancelled."
  sleep 1
  return 0
fi

echo ""
gum style --foreground 214 "Administrator privileges required."
echo ""

# ============================================
# Backup
# ============================================
echo "Creating backup..."
mkdir -p "$backup_dir"

case $current_shell in
  bash)
    [ -f ~/.bashrc ] && cp ~/.bashrc "$backup_dir/"
    [ -f ~/.inputrc ] && cp ~/.inputrc "$backup_dir/"
    ;;
  zsh)
    [ -f ~/.zshrc ] && cp ~/.zshrc "$backup_dir/"
    ;;
esac
echo "Backup saved: $backup_dir"

# ============================================
# Extract customizations
# ============================================
echo "Extracting customizations..."
customizations="$backup_dir/customizations.sh"

case $current_shell in
  bash)
    if [ -f ~/.bashrc ]; then
      # Extract lines after the Omakub source line and EDITOR settings
      sed -n '/^# Add your customizations/,$p' ~/.bashrc > "$customizations" 2>/dev/null
      # If that didn't work, try extracting after SUDO_EDITOR
      if [ ! -s "$customizations" ]; then
        sed -n '/^export SUDO_EDITOR/,$p' ~/.bashrc | tail -n +2 > "$customizations" 2>/dev/null
      fi
    fi
    ;;
  zsh)
    if [ -f ~/.zshrc ]; then
      sed -n '/^# Add your customizations/,$p' ~/.zshrc > "$customizations" 2>/dev/null
      if [ ! -s "$customizations" ]; then
        sed -n '/^export SUDO_EDITOR/,$p' ~/.zshrc | tail -n +2 > "$customizations" 2>/dev/null
      fi
    fi
    ;;
esac

if [ -s "$customizations" ]; then
  lines=$(wc -l < "$customizations")
  echo "Found $lines lines to migrate"
else
  rm -f "$customizations"
  echo "No customizations found"
fi

# ============================================
# Install target shell
# ============================================
case $target_shell in
  zsh)
    if ! command -v zsh &> /dev/null; then
      echo "Installing Zsh..."
      sudo apt install -y zsh
      if ! command -v zsh &> /dev/null; then
        gum style --foreground 196 "Installation failed!"
        return 1
      fi
      echo "Zsh installed"
    fi

    zsh_path=$(which zsh)
    grep -q "$zsh_path" /etc/shells || echo "$zsh_path" | sudo tee -a /etc/shells > /dev/null

    echo "Configuring Zsh..."
    cp $OMAKUB_PATH/configs/zshrc ~/.zshrc

    if [ -f "$customizations" ]; then
      echo "" >> ~/.zshrc
      cat "$customizations" >> ~/.zshrc
      echo "Customizations migrated"
    fi

    echo "Setting default shell..."
    sudo chsh -s "$zsh_path" $USER
    echo "Default shell: Zsh"
    ;;

  bash)
    bash_path=$(which bash)

    echo "Configuring Bash..."
    cp $OMAKUB_PATH/configs/bashrc ~/.bashrc
    cp $OMAKUB_PATH/configs/inputrc ~/.inputrc

    if [ -f "$customizations" ]; then
      echo "" >> ~/.bashrc
      cat "$customizations" >> ~/.bashrc
      echo "Customizations migrated"
    fi

    echo "Setting default shell..."
    sudo chsh -s "$bash_path" $USER
    echo "Default shell: Bash"
    ;;
esac

# Record choice
echo "$target_shell" > ~/.local/share/omakub/.shell-choice

# ============================================
# Complete
# ============================================
echo ""
gum style --border double --padding "1 2" --border-foreground 82 \
  "SWITCH COMPLETE" \
  "" \
  "Changed: $current_shell -> $target_shell" \
  "Backup:  $backup_dir" \
  "" \
  "To activate:" \
  "  - Log out and back in, OR" \
  "  - Run: exec $target_shell"

echo ""
if gum confirm "Start $target_shell now?"; then
  exec $target_shell
fi
