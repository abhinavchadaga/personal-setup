#!/usr/bin/env bash

set -e
set -v

chmod +x dev_packages.sh
chmod +x gh.sh
chmod +x zsh.sh
chmod +x nvm.sh
chmod +x neovim.sh
chmod +x tmux.sh

# Detect the operating system and set the package manager
if [ -f /etc/os-release ]; then
  . /etc/os-release
  OS=$NAME
  if echo "$OS" | grep -qi "ubuntu"; then
    PKG_MANAGER="apt"
    echo "detected UBUNTU"
  elif echo "$OS" | grep -qi "fedora"; then
    PKG_MANAGER="dnf"
    echo "detected FEDORA"
  else
    echo "Unsupported operating system: $OS"
    exit 1
  fi
fi

# sudo "$PKG_MANAGER" update -y && sudo "$PKG_MANAGER" upgrade -y
# sudo "$PKG_MANAGER" install -y zsh
# touch "$HOME/.zshrc"

# Export PKG_MANAGER for use in other scripts
export PKG_MANAGER

./dev_packages.sh
./gh.sh
./zsh.sh
./nvm.sh
./neovim.sh
./tmux.sh
chsh -s "$(which zsh)"
exit
