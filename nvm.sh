#!/usr/bin/env zsh

export NVM_DIR="$HOME/.nvm" && (
  git clone https://github.com/nvm-sh/nvm.git "$NVM_DIR"
  cd "$NVM_DIR"
  git checkout "$(git describe --abbrev=0 --tags --match "v[0-9]*" "$(git rev-list --tags --max-count=1)")"
) && \. "$NVM_DIR/nvm.sh"

nvm_content='# source nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion'

# Check if the content is already in .zshrc
zshrc_path="$HOME/.zshrc"
if ! grep -q "$nvm_content" "$zshrc_path"; then
  echo "$nvm_content" >>"$zshrc_path"
  echo "NVM configuration added to .zshrc"
else
  echo "NVM configuration already exists in .zshrc"
fi

source "$zshrc_path"

if type nvm >/dev/null 2>&1; then
  echo "NVM is installed and reachable."
else
  echo "NVM installation failed or is not reachable."
  return 1
fi
