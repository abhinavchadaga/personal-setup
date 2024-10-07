#!/usr/bin/env zsh

echo "installing dev packages"
sudo $PKG_MANAGER install -y vim \
  git \
  curl \
  wget \
  unzip \
  man \
  gcc \
  g++ \
  gdb \
  make \
  cmake \
  ninja-build \
  clang \
  python3-pip \
  ripgrep \
  fd-find \
  bat \
  tmux

# Install additional packages for Fedora
if [ "$PKG_MANAGER" = "dnf" ]; then
  sudo $PKG_MANAGER install -y git-all \
    clang-tools-extra \
    fzf
fi

# Install additional packages for Ubuntu
if [ "$PKG_MANAGER" = "apt-get" ]; then
  sudo $PKG_MANAGER install -y clang-tools

  fzf_link=""
  if [[ $ARCH_TYPE == "x86" ]]; then
    fzf_link='https://github.com/junegunn/fzf/releases/download/v0.55.0/fzf-0.55.0-linux_amd64.tar.gz'
  elif [[ $ARCH_TYPE == "arm" ]]; then
    fzf_link='https://github.com/junegunn/fzf/releases/download/v0.55.0/fzf-0.55.0-linux_arm64.tar.gz'
  else
    echo "invalid ARCH_TYPE"
    exit 1
  fi

  curl -L "$fzf_link" -o 'fzf.tar.gz'
  tar -xf 'fzf.tar.gz'
  sudo mv 'fzf' '/usr/local/bin'
fi
