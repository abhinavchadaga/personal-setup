#!/usr/bin/env zsh

echo "installing dev packages"
sudo dnf install -y vim \
  git-all \
  curl \
  wget \
  unzip \
  man \
  gcc \
  g++ \
  gdb \
  make \
  cmake ninja-build \
  clang \
  clang-tools-extra \
  python3-pip \
  fzf \
  ripgrep \
  fd-find \
  bat
