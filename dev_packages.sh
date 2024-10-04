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
if [ "$PKG_MANAGER" = "apt" ]; then
    sudo $PKG_MANAGER install -y clang-tools
    
    # Install fzf from source for Ubuntu
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install --all
fi
