#!/bin/bash

if ! command -v nvim &>/dev/null; then
  # Install Neovim
  cd /tmp
  wget -O nvim.tar.gz "https://github.com/neovim/neovim/releases/download/stable/nvim-linux-x86_64.tar.gz"
  tar -xf nvim.tar.gz
  sudo install nvim-linux-x86_64/bin/nvim /usr/local/bin/nvim
  sudo cp -R nvim-linux-x86_64/lib /usr/local/
  sudo cp -R nvim-linux-x86_64/share /usr/local/
  rm -rf nvim-linux-x86_64 nvim.tar.gz
  cd -

  # Install luarocks and tree-sitter-cli to resolve lazyvim :checkhealth warnings
  sudo apt install -y luarocks tree-sitter-cli

  # Use LazyVim
  rm -rf ~/.config/nvim
  git clone https://github.com/LazyVim/starter ~/.config/nvim
  cp -R ~/.local/share/omakub/config/nvim/* ~/.config/nvim/
  rm -rf ~/.config/nvim/.git
  echo "vim.opt.relativenumber = false" >>~/.config/nvim/lua/config/options.lua
fi