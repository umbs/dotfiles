#!/bin/bash

# One script to cleanup all tools/software installed by me on MAC OSX.

brew uninstall alacritty
brew uninstall anki
brew uninstall azure-cli
brew uninstall bbedit
brew uninstall cloc
brew uninstall cscope
brew uninstall ctags
brew uninstall dropbox
brew uninstall flake8
brew uninstall git
brew uninstall google-chrome
brew uninstall java
brew uninstall jq
brew uninstall monodraw
brew uninstall neovim
brew uninstall nmap
brew uninstall node
brew uninstall postman
brew uninstall ripgrep
brew uninstall slack
brew uninstall shellcheck
brew uninstall tmux
brew uninstall vim
brew uninstall visual-studio-code
brew uninstall vlc
brew uninstall wireshark
brew uninstall zoom

rm -fr ~/neovim ~/Notes ~/dotfiles ~/practice ~/vim-configs 
rm -fr ~/.vim
rm -f ~/.zshrc ~/.vimrc ~/.gitconfig
