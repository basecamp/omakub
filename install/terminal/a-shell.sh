#!/bin/bash

# ============================================
# OMAKUB SHELL SETUP
# Supports: Bash, Zsh
# ============================================

# Normalize shell selection
case "$OMAKUB_SHELL" in
  Zsh|zsh|"Zsh") selected_shell="zsh" ;;
  *) selected_shell="bash" ;;
esac

echo "Setting up shell: $selected_shell"

# ============================================
# ZSH SETUP
# ============================================
if [[ "$selected_shell" == "zsh" ]]; then

  # Install zsh if needed
  if ! command -v zsh &> /dev/null; then
    echo "Installing Zsh..."
    sudo apt install -y zsh

    if ! command -v zsh &> /dev/null; then
      echo "Zsh installation failed. Falling back to Bash."
      selected_shell="bash"
    fi
  fi

  if [[ "$selected_shell" == "zsh" ]]; then
    # Register in /etc/shells if needed
    zsh_path=$(which zsh)
    if ! grep -q "$zsh_path" /etc/shells; then
      echo "$zsh_path" | sudo tee -a /etc/shells > /dev/null
    fi

    # Backup existing zsh configs
    [ -f ~/.zshrc ] && mv ~/.zshrc ~/.zshrc.pre-omakub.bak
    [ -f ~/.zshenv ] && mv ~/.zshenv ~/.zshenv.pre-omakub.bak

    # Install Omakub zsh config
    cp ~/.local/share/omakub/configs/zshrc ~/.zshrc

    # Set as default shell
    sudo chsh -s "$zsh_path" $USER

    # Load environment for remaining installers
    source ~/.local/share/omakub/defaults/shared/environment.sh
  fi
fi

# ============================================
# BASH SETUP (default or fallback)
# ============================================
if [[ "$selected_shell" == "bash" ]]; then

  # Backup existing bash configs
  [ -f ~/.bashrc ] && mv ~/.bashrc ~/.bashrc.bak
  [ -f ~/.inputrc ] && mv ~/.inputrc ~/.inputrc.bak

  # Install Omakub bash config
  cp ~/.local/share/omakub/configs/bashrc ~/.bashrc
  cp ~/.local/share/omakub/configs/inputrc ~/.inputrc

  # Load environment for remaining installers
  source ~/.local/share/omakub/defaults/shared/environment.sh
fi

# ============================================
# RECORD SHELL CHOICE
# ============================================
echo "$selected_shell" > ~/.local/share/omakub/.shell-choice
