# Install

## Fullsetup
### Clone the repo
git clone https://github.com/MrMatten/dotfiles ~/

### Install
./Fullsetup

## Partsetup
Install any of the scripts seperatly
./Brewfile
./Caskfile
./AppStore
./NPM

## Problems
Problems setting up zshrc and oh-my-zsh also with spaceship theme. 
Order of installation, brew needs to be installed to install nvm. 
Need to manually make .config/nvim
First run of FullSetup doesn't move past linking config files
    Second run says `brew command doesn't exists` brew need a restart of the terminal
    Also says mas command not found 
    Also says nvm and npn not found - replace with volta
iTerm doesn't show up in the links of downloadable apps
Nord colors need to be set
Mas for installing appstore applications have a lot of errors because of old commands and doesn't install any apps
Settings for iTerm are not being reused
Fira Code is not being downloaded
SSH config is not a part of the setup
