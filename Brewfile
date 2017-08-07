#!/bin/bash

if ! type "brew" > /dev/null; then
  ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
fi

brew update
brew upgrade            # Upgrade any already-installed formulae
brew install coreutils  # Install GNU core utilities (those that come with OS X are outdated)
brew install findutils  # Install GNU `find`, `locate`, `updatedb`, and `xargs`, g-prefixed
brew install bash       # Install Bash 4

brew tap homebrew/dupes
brew tap homebrew/php
brew install homebrew/dupes/grep

binaries=(
  automake
  bash
  boost
  colordiff
  coreutils
  findutils
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
  keybase
  lighttpd
  lynx
  mad
  memcached
  mitmproxy
  mongodb
  mono
  mp3info
  mysql
  nginx
  ngrok
  nmap
  node
  openssl
  php56
  php56-memcache
  pkg-config
  postgresql
  python
  python3
  redis
  rename
  sqlite
  tmux
  tokyo-cabinet
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
  brew install $i
done

brew install go --cross-compile-all
brew tap thoughtbot/formulae

brew linkapps
brew cleanup
