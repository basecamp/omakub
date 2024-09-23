#!/bin/zsh

echo "Installing Homebrew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval "$(/opt/homebrew/bin/brew shellenv)"
brew update
echo "Done!"

echo "Installing terminal..."
brew install --cask iterm2
echo "Done!"

echo "Installing compiler toolchain..."
xcode-select --install
echo "Done!"

echo "Installing shell tools..."
brew install nvim git lazygit fd ripgrep zellij tmux
echo "Done!"

echo "Installing LazyVim..."
git clone https://github.com/LazyVim/starter ~/.config/nvim/
echo "Done!"

