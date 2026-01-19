#!/bin/bash

current_shell=$(basename "$SHELL")

echo ""
gum style --foreground 212 --bold "Shell Management"
echo ""
echo "Current shell: $current_shell"
echo ""

CHOICE=$(gum choose "Switch to Bash" "Switch to Zsh" "Shell Info" "<< Back" --header "")

case "$CHOICE" in
  "Switch to Bash")
    if [[ "$current_shell" == "bash" ]]; then
      gum style --foreground 208 "Already using Bash!"
      sleep 2
    else
      source $OMAKUB_PATH/bin/omakub-sub/shell-switch.sh bash
    fi
    ;;

  "Switch to Zsh")
    if [[ "$current_shell" == "zsh" ]]; then
      gum style --foreground 208 "Already using Zsh!"
      sleep 2
    else
      source $OMAKUB_PATH/bin/omakub-sub/shell-switch.sh zsh
    fi
    ;;

  "Shell Info")
    echo ""
    echo "Current shell: $current_shell"
    echo "Default shell: $(getent passwd $USER | cut -d: -f7)"
    echo ""
    echo "Bash: $(bash --version | head -1)"
    if command -v zsh &> /dev/null; then
      echo "Zsh:  $(zsh --version)"
    else
      echo "Zsh:  Not installed"
    fi
    echo ""
    echo "Shell choice file: ~/.local/share/omakub/.shell-choice"
    if [ -f ~/.local/share/omakub/.shell-choice ]; then
      echo "Recorded choice: $(cat ~/.local/share/omakub/.shell-choice)"
    fi
    echo ""
    echo "Config location:"
    case "$current_shell" in
      bash) echo "  ~/.bashrc" ;;
      zsh)  echo "  ~/.zshrc" ;;
    esac
    echo ""
    read -p "Press Enter to continue..."
    ;;

  *)
    # Back to menu
    ;;
esac

clear
source $OMAKUB_PATH/bin/omakub
