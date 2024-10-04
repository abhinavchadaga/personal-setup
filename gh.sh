#!/usr/bin/env zsh

echo "installing gh cli..."
if [ "$PKG_MANAGER" = "dnf" ]; then
    sudo $PKG_MANAGER install -y 'dnf-command(config-manager)'
    sudo $PKG_MANAGER config-manager -y --add-repo https://cli.github.com/packages/rpm/gh-cli.repo
    sudo $PKG_MANAGER install -y gh --repo gh-cli
elif [ "$PKG_MANAGER" = "apt" ]; then
    curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
    sudo $PKG_MANAGER update
    sudo $PKG_MANAGER install -y gh
fi

gh auth login
