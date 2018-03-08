dotfiles
========

Config files

Plugins used for VIM
---
MUST HAVES:
---
pathogen.vim
Vim plugin manager. I think Vundle is better option. Still thinking.
https://github.com/tpope/vim-pathogen

vim-cscope-util
A great find. Builds ctags, cscope and pycscope databases. Read following link
for further details. After this, I don't see need for cscope_maps and
autoload_cscope plugins. But still early and testing this.
https://github.com/JCLiang/vim-cscope-utils

nerdtree
File explorer
https://github.com/scrooloose/nerdtree

tagbar
Functions/variable list
https://github.com/majutsushi/tagbar

vim-fugitive
Git integration for Vim from legendary Tim Pope
https://github.com/tpope/vim-fugitive

ctrlp
Fuzzy file finder. fzf is gaining more popularity. Even though file's can be
searched using cscope, this is a fuzzy search.
https://github.com/kien/ctrlp.vim

YouCompleteMe


NICE TO HAVE:
---
cscope_maps
Maps cscope DB to shortcut keys. cscope.out must still be built for which I use
'cscope.sh' script
https://github.com/chazy/cscope_maps

autoload_cscope
Used to search up directory path (until root) looking for cscope.out DB
https://github.com/vim-scripts/autoload_cscope.vim

Syntastic
This looks very helpful to lot of people and show's up in every 'must have
plugins' list. But I found it too noisy and distracting.
https://github.com/vim-syntastic/syntastic
