#!/usr/bin/env zsh

echo "installing gh cli..."
if [ "$PKG_MANAGER" = "dnf" ]; then
  sudo dnf install -y 'dnf-command(config-manager)'
  sudo dnf config-manager -y --add-repo https://cli.github.com/packages/rpm/gh-cli.repo
  sudo dnf install -y gh --repo gh-cli
elif [ "$PKG_MANAGER" = "apt-get" ]; then
  (type -p wget >/dev/null || (sudo apt update && sudo apt-get install wget -y)) &&
    sudo mkdir -p -m 755 /etc/apt/keyrings &&
    wget -qO- https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo tee /etc/apt/keyrings/githubcli-archive-keyring.gpg >/dev/null &&
    sudo chmod go+r /etc/apt/keyrings/githubcli-archive-keyring.gpg &&
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list >/dev/null &&
    sudo apt update &&
    sudo apt install gh -y
fi

gh auth login

# set up some git aliases

aliases='
[alias]
  br = "branch"
  cim = "commit -m"
  cp  = "cherry-pick"
  st = "status -s"
  lg = "log --oneline --graph --decorate --all"
  co = "checkout"
  cob = "checkout -b"
[push]
  default = simple
[color]
  ui = true
'
