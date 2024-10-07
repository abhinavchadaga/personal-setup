#!/usr/bin/env zsh

set -e
set -o pipefail

# Function to check if a command exists
command_exists() {
  command -v "$1" >/dev/null 2>&1
}

# Function to get Ubuntu version
get_ubuntu_version() {
  lsb_release -rs
}

# Install pipx
install_pipx() {
  if [ "$PKG_MANAGER" = "dnf" ]; then
    sudo dnf install -y pipx
    pipx ensurepath
  elif [ "$PKG_MANAGER" = "apt-get" ]; then
    ubuntu_version=$(get_ubuntu_version)
    sudo apt-get install bc
    if [ "$(echo "$ubuntu_version >= 23.04" | bc)" -eq 1 ]; then
      sudo apt-get install -y pipx
      pipx ensurepath
    else
      python3 -m pip install --user pipx
      python3 -m pipx ensurepath
    fi
  else
    echo "Unsupported package manager: $PKG_MANAGER"
    exit 1
  fi

  # add completions to zshrc
  echo 'eval "$(register-python-argcomplete pipx)"' >>~/.zshrc
}

# Check if pipx is installed, if not, install it
if ! command_exists pipx; then
  echo "pipx not found. Installing..."
  install_pipx
else
  echo "pipx is already installed."
fi

# Install aider-chat using pipx
if ! command_exists aider; then
  echo "Installing aider-chat..."
  pipx install aider-chat
else
  echo "aider-chat is already installed. Upgrading..."
  pipx upgrade aider-chat
fi

echo "aider-chat installation completed."
