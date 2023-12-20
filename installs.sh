#!/bin/bash

# One script for installation of essential software on a new MAC OSX.

# Homebrew:
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Default shell on MacOS is zsh. Homebrew is installed in /opt/homebrew/...
# location. This is not in the PATH. Following makes `brew` command available
# in the path
echo "eval $(/opt/homebrew/bin/brew shellenv)" >> ~/.zshrc

# Brew Cask (may be already installed with brew). Cask is extension of brew and
# is mainly used for apps that require GUI. More importantly, brew installs
# source and compiles it (apparently). But cask installs only the compiled
# binary. So, it's fast and maybe that's the reason it's used for large GUI
# based apps
# https://apple.stackexchange.com/questions/125468/what-is-the-difference-between-brew-and-brew-cask
# brew install brew-cask

brew install --HEAD neovim  # install developer version
brew install --HEAD vim     # install developer version
brew install bbedit --cask
brew install cloc   # Counts number of lines of code
brew install cscope
brew install ctags
brew install docker --cask
brew install git
brew install kindle
brew install monodraw --cask
brew install nmap   # networking tools
brew install node   # installs NodeJS and npm
brew install ripgrep
brew install shellcheck
brew install tmux
brew install vlc

# Azure Cloud NGFW related installs
brew install jq
brew install azure-cli

# Python comes pre-installed with Mac OS. Install pip, flake8 ...
brew install flake8

# Applications
# plugins for browser: ublock, adblock, bitwarden, lastpass, pocket,
# raindrop.io stayfocused, printfriendly, tomatotimer, coders calendar

brew install alacritty --cask
brew install anki --cask
brew install dropbox --cask	# Requires entering password
brew install google-chrome --cask
brew install openjdk --cask
brew install visual-studio-code --cask
brew install wireshark --cask

# Apps used at work
brew install slack --cask
brew install postman --cask
brew install zoom --cask	# Requires entering password
# ... End

# TODO: Softwares that do not have brew installations
# alacritty, Microsoft Teams
# Dash app,

# Projects I keep grokking
git clone https://github.com/neovim/neovim.git ~/neovim

# Personal Projects from Github:
git clone https://github.com/umbs/dotfiles.git ~/dotfiles
git clone https://github.com/umbs/Notes.git ~/Notes
git clone https://github.com/umbs/practice.git ~/practice
git clone https://github.com/umbs/vim-configs.git ~/vim-configs

cp dotfiles/vimrc ~/.vimrc
cp dotfiles/gitconfig ~/.gitconfig
cp dotfiles/bashrc ~/.bashrc

# Vim plugin manager (Vundle) installation. This package manager is needed to
# install rest of the plugins
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
