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
sudo $PKG_MANAGER install -y python3-neovim

# luarocks package manager for luacheck
sudo $PKG_MANAGER install -y luarocks

# install neovim
if [ "$PKG_MANAGER" = "dnf" ]; then
  sudo $PKG_MANAGER install -y neovim
elif [ "$PKG_MANAGER" = "apt-get" ]; then
  sudo add-apt-repository ppa:neovim-ppa/unstable -y
  sudo $PKG_MANAGER update
  sudo $PKG_MANAGER install -y neovim
fi

neovim_config_dir="$HOME/.config/nvim"

if [ ! -e "$neovim_config_dir" ]; then
  mkdir -p "$neovim_config_dir"
fi

gh repo clone "abhinavchadaga/nvim-setup" "$neovim_config_dir"

echo "setting git editor as nvim..."
git config --global core.editor "nvim"
