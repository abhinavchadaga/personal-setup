#!/usr/bin/env zsh

mkdir -p ~/.config/tmux/
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
cp tmux.conf ~/.config/tmux/tmux.conf
