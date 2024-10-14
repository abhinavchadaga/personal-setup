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
    PKG_MANAGER="apt-get"
    echo "detected UBUNTU"
  elif echo "$OS" | grep -qi "fedora"; then
    PKG_MANAGER="dnf"
    echo "detected FEDORA"
  else
    echo "Unsupported operating system: $OS"
    exit 1
  fi
fi

# detect the architecture
ARCH=$(uname -m)
if [[ $ARCH == "x86_64" ]]; then
  ARCH_TYPE="x86"
elif [[ $ARCH == "aarch64" || $ARCH == "arm64" ]]; then
  ARCH_TYPE="arm"
else
  echo "Unsupported architecture: $ARCH"
  exit 1
fi

echo "Detected architecture: $ARCH_TYPE"
export ARCH_TYPE

sudo "$PKG_MANAGER" update -y && sudo "$PKG_MANAGER" upgrade -y
sudo "$PKG_MANAGER" install -y zsh
touch "$HOME/.zshrc" # We'll keep this line to ensure the file exists

# Export PKG_MANAGER for use in other scripts
export PKG_MANAGER

./dev_packages.sh
./gh.sh
./zsh.sh
./nvm.sh
./neovim.sh
./tmux.sh
./aider.sh

chsh -s "$(which zsh)"
exit
