#!/usr/bin/env zsh

zshrc_dst="$HOME/.zshrc"
p10k_dst="$HOME/.p10k.zsh"

cat .zshrc >"$zshrc_dst"
cat .p10k.zsh >"$p10k_dst"
