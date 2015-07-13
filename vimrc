execute pathogen#infect()
execute pathogen#helptags()
syntax on
syntax enable 
filetype plugin indent on


" Vim settings 
set incsearch 
set hlsearch        " highlights search results  
set number          " line numbers
set ruler           " (row,column, % of document) are displayed at right bottom. 
set timeoutlen=2000     " 2 seconds timeout instead of 1 second 
                        " for operations involving multiple keys, 
		                " as in tmux & screen  
set textwidth=80    " 80 column width 
set wildmenu        " when ':help patt' + tab, gives options in status
                    " line 

set shiftwidth=4
set tabstop=4       " tab is 4 spaces long.
set expandtab       " tabs are expanded in to spaces.
set smarttab

set runtimepath^=~/.vim/bundle/ctrlp.vim

set backspace=indent,eol,start

" set autochdir   " change current working directory to the file that's open.
" Unfortunately, when this is set, some plugins do not work correctly. Instead,
" use below command. 
autocmd BufEnter * silent! lcd %:p:h 
" http://vim.wikia.com/wiki/Set_working_directory_to_the_current_file

"set nocscopeverbose   " suppress any warnings thrown by cscope  

"set tags=tags;/

set background=light
"colorscheme solarized
"colorscheme shine " color scheme is shine
"colorscheme zenburn
