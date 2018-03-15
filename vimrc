" Vundle recommendation
set nocompatible " be iMproved, required for Vundle
filetype plugin indent off " required for Vundle


" ===================================================================
"                   Vanila Vim settings
" ===================================================================

syntax on       " syntax highlighting ON (default is OFF)
syntax enable

set incsearch	" incremental search
set hlsearch  	" highlight search results
set ignorecase  " ignore case during search

set number 	    " set line numbers
set ruler 	    " (row, colum, % of document) are displayed at right bottom
set timeoutlen=2000 	" 2 seconds instead of 1, for operations involving
			    " multiple keys such as tmux and screen.
set textwidth=80 	" 80 column width
set wildmenu	" when 'help patt' + tab, gives options in status line
set path+=**    " enables fuzzy file search
                " set wildignore+=**/directory/** should ignore files in a
                " certain directory

set shiftwidth=4
set tabstop=4 	" tab is 4 spaces long
set expandtab	" tabs are expanded to spaces
set smarttab	"

set nobackup
set nowritebackup
" Where 'nowritebackup' changes the default "save" behavior of Vim, which is:
"   write buffer to new file
"   delete the original file
"   rename the new file
" and makes Vim write the buffer to the original file (resulting in the risk of
" destroying it in case of an I/O error). But you prevent "jumping files" on the
" Windows desktop with it, which is the primary reason for me to have
" nowritebackup in place.
" Reference: https://stackoverflow.com/a/607475/630866

set noswapfile  " Whenever a file is open, VIM creates a .swp or similar files,
                " which prevents/warns other's from opening/modifying same file
                " at same time. This is good and bad. Good, for obvious reasons.
                " Bad because, if the file is inside Dropbox, the .filename.swp
                " is *somehow* always current or in modified state. So, Dropbox
                " continuously tries to sync that file which hogs up CPU (from
                " one experience). Alternately, the location of swap file can
                " be changed to outside Dropbox directory.

set backspace=indent,eol,start  " treat backspace like it behaves in all other
                                " programs:http://vi.stackexchange.com/a/2163/2796

highlight Comment ctermfg=yellow " On a terminal supporting 16 colors, comments are shown in green

"If 'cscopetag' is set, the commands ":tag" and CTRL-] as well as "vim -t"
"will always use :cstag instead of the default :tag behavior.  Effectively,
"by setting 'cst', you will always search your cscope databases as well as
"your tag files.  The default is off.  Examples:
"        :set cst
"        :set nocst
set cscopetag

"  For more:
"  http://vim.wikia.com/wiki/Insert_current_date_or_time
nnoremap <F5> "=strftime("[%a %d, %H:%M]")<CR>P
inoremap <F5> <C-R>=strftime("[%a %d, %H:%M]")<CR>

" Specific to Tagbar plugin.
" This setting opens Tagbar window in bottom of page. Default is to the right.
" The number (15) indicates number of lines to display. Increase/decrease as
" needed.
" let g:tagbar_vertical=15
nnoremap <silent> <F9> :TagbarToggle<CR>

" 'Esc' switches to normal mode.
" ':TagbarToggle' toggles current Tagbar state.
" 'A' switches to insert mode and cursor at end of current line.
inoremap <silent> <F9> <Esc>:TagbarToggle<CR>A

" NERDTree plugin key maps
nnoremap <F8> :NERDTreeToggle<CR>
inoremap <F8> <Esc>:NERDTreeToggle<CR>A

" show 'buffers' to list recently opened files.
nnoremap <F10> :buffers<CR>
inoremap <F10> <Esc>:buffers<CR>A


" ===================================================================
"               Vundle Vim recommended settings
" ===================================================================

" Everything below is copied from VundleVim website
" https://github.com/VundleVim/Vundle.vim
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" Some problem with this plugin, python and cscope
" Plugin 'JCLiang/vim-cscope-utils'
Plugin 'scrooloose/nerdtree'
Plugin 'majutsushi/tagbar'
Plugin 'kien/ctrlp.vim'
Plugin 'chazy/cscope_maps'
Plugin 'vim-scripts/autoload_cscope.vim'
" Lint plugin. Make it work, later.
" Plugin 'w0rp/ale'
Plugin 'davidhalter/jedi-vim'
Plugin 'Shougo/neocomplete.vim'
" YCMD is shutting down. Need to figure this out.
" Plugin 'Valloric/YouCompleteMe'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
