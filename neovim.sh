#!/usr/bin/env zsh

source "$HOME/.zshrc"

if ! type nvm >/dev/null 2>&1; then
  echo "nvm not found!!"
  exit 1
fi

# setup nodejs support for neovim
nvm install --lts
nvm use --lts
npm i -g neovim

# setup python3 support for neovim
sudo dnf install -y python3-neovim

# luarocks package manager for luacheck
sudo dnf install -y luarocks

# install neovim
sudo dnf install -y neovim
neovim_config_dir="$HOME/.config/nvim"

if [ ! -e "$neovim_config_dir" ]; then
  mkdir -p "$neovim_config_dir"
fi

gh repo clone "abhinavchadaga/nvim-setup" "$neovim_config_dir"

echo "setting git editor as nvim..."
git config --global core.editor "nvim"
