#!/usr/bin/env zsh

mkdir -p $HOME/.config/tmux/
git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm
cp tmux.conf $HOME/.config/tmux/tmux.conf

