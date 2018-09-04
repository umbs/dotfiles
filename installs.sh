#!/bin/bash

# One script for installation of essential software on a new MAC OSX book.

# Homebrew:
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Brew Cask (may be already installed with brew)
brew install brew-cask

# Tmux
brew install tmux

# Git:
brew install git

# Projects from Github:
git clone https://github.com/umbs/dotfiles.git
git clone https://github.com/umbs/Notes.git
git clone https://github.com/umbs/practice.git

# Copy files to $HOME
cp dotfiles/vimrc ~/.vimrc
cp dotfiles/gitconfig ~/.gitconfig
cp dotfiles/bashrc ~/.bashrc

# Python comes pre-installed with Mac OS. Install pip and others
sudo easy_install pip
sudo easy_install pudb
sudo easy_install pep8
brew install flake8

# Chrome:
brew cask install google-chrome

# Dropbox
brew cask install dropbox

# EMAIL
brew install mutt
brew install alpine
