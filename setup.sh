#!/usr/bin/env bash

set -e
set -v

sudo dnf update -y && sudo dnf upgrade -y
sudo dnf install -y zsh
touch "$HOME/.zshrc"

./dev_packages.sh
./gh.sh
./zsh.sh
./nvm.sh
./neovim.sh
chsh -s "$(which zsh)"
exit
