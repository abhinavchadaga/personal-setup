#!/usr/bin/env zsh

echo "installing gh cli..."
sudo dnf install -y 'dnf-command(config-manager)'
sudo dnf config-manager -y --add-repo https://cli.github.com/packages/rpm/gh-cli.repo
sudo dnf install -y gh --repo gh-cli

gh auth login
