#!/usr/bin/env bash

set -e
set -v

chmod +x dev_packages.sh
chmod +x gh.sh
chmod +x zsh.sh
chmod +x nvm.sh
chmod +x neovim.sh
chmod +x tmux.sh

sudo dnf update -y && sudo dnf upgrade -y
sudo dnf install -y zsh
touch "$HOME/.zshrc"

./dev_packages.sh
./gh.sh
./zsh.sh
./nvm.sh
./neovim.sh
./tmux.sh
chsh -s "$(which zsh)"
exit
