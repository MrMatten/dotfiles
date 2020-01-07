#!/bin/bash

command -v brew >/dev/null 2>&1 || { echo >&2 "Installing Homebrew Now"; \
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"; }

brew update
brew upgrade            # Upgrade any already-installed formulae

brew tap mas-cli/tap
brew tap-pin mas-cli/tap
brew install mas

brew install coreutils  # Install GNU core utilities (those that come with OS X are outdated)
brew install findutils  # Install GNU `find`, `locate`, `updatedb`, and `xargs`, g-prefixed
brew install bash       # Install Bash 4
  
binaries=(
  automake
  boost
  colordiff
  dep
  docker-cloud
  fzf
  gcc
  gcc49
  gdbm
  gettext
  git
  glew
  gmp
  gmp4
  gnupg
  go
  gor
  grep
  ical-buddy
  imagemagick
  jpeg
  lighttpd
  lynx
  mad
  memcached
  mitmproxy
  mp3info
  neovim
  nginx
  nmap
  openssl
  pkg-config
  python
  python3
  rename
  the_silver_searcher
  selecta
  sqlite
  tmux
  tree
  unixodbc
  vim
  webkit2png
  wget
  x264
  xvid
  zsh
)

for i in "${binaries[@]}"
do
  brew install "$i"
done

brew install go --cross-compile-all
brew tap thoughtbot/formulae
