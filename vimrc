"execute pathogen#infect()
call pathogen#infect() 

syntax on 
filetype plugin indent on 
filetype plugin on 

"mappings 
"nmap <F3> a<C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR><Esc>
"imap <F3> <C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR>

nmap <F3> a<C-R>=strftime("[%I:%M%p]")<CR><Esc>
imap <F3> <C-R>=strftime("[%I:%M%p]")<CR>

set autoindent
set incsearch   " incremental search  
set hlsearch
set nu
set textwidth=74
set ruler       " show line & column # of cursor position. When there is
                " room, relative position of the text is shown w.r.t start
                " of file 
                
set timeoutlen=4000  " 4 sec timeout instead of default 1 sec for
                     " operations involving multiple keys such as tmux &
                     " screen

set mouse=a          " Allow mouse operations. Currently not working. 
set tabstop=8        " tab is 4 spaces long 
set expandtab        " replace tabs with 4 spaces 

set autowrite        " Very useful in following context: Modify file,
                     " don't save yet, switch to another window and
                     " compile code. File is saved with this setting. 

"autocmd vimenter * NERDTree    " Load NERDTree whenever Vim starts 

set runtimepath^=~/.vim/bundle/ctrlp.vim " load CTRL-P plugin when Vim starts 
