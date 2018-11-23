#!/bin/bash

if ! type "brew" > /dev/null; then
  ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
fi

brew update
brew upgrade            # Upgrade any already-installed formulae

brew tap mas-cli/tap
brew tap-pin mas-cli/tap
brew install mas

brew install coreutils  # Install GNU core utilities (those that come with OS X are outdated)
brew install findutils  # Install GNU `find`, `locate`, `updatedb`, and `xargs`, g-prefixed
brew install bash       # Install Bash 4

# Xcode, Magnet, 1Password, Pocket, Slack, Trello, Whatsapp
appStore=(
  497799835
  441258766
  1333542190
  568494494
  803453959
  1176895641
  1278508951
  1147396723
)

for i in "${appStore[@]}"
do
  mas install "$i"
done
  
binaries=(
  automake
  boost
  colordiff
  dep
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
  mongodb
  mp3info
  nginx
  nmap
  openssl
  pkg-config
  python
  python3
  redis
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
