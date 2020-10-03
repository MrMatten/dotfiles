#!/bin/bash

command -v brew >/dev/null 2>&1 || { echo >&2 "Installing Homebrew Now"; \
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"; }

brew update
brew upgrade            # Upgrade any already-installed formulae

brew install coreutils  # Install GNU core utilities (those that come with OS X are outdated)
brew install findutils  # Install GNU `find`, `locate`, `updatedb`, and `xargs`, g-prefixed
  
binaries=(
  dep
  docker-cloud
  fastlane
  fzf
  go
  grep
  neovim
  nginx
  nvm
  openssl
  rename
  the_silver_searcher
  selecta
  tree
  vim
  wget
  zsh
)

for i in "${binaries[@]}"
do
  brew install "$i"
done
