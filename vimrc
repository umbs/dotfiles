syntax on       " syntax highlighting ON (default is OFF)
syntax enable

" Vundle recommendation
set nocompatible " be iMproved, required for Vundle
filetype plugin indent on " required for Vundle

" Vim settings
set incsearch	" incremental search
set hlsearch  	" highlight search results
set number 	" set line numbers
set ruler 	" (row, colum, % of document) are displayed at right bottom
set timeoutlen=2000 	" 2 seconds instead of 1, for operations involving
			" multiple keys such as tmux and screen.
set textwidth=80 	" 80 column width
set wildmenu	" when 'help patt' + tab, gives options in status line
set shiftwidth=4
set tabstop=4 	" tab is 4 spaces long
set expandtab	" tabs are expanded to spaces
set smarttab	"
set ignorecase  " ignore case during search

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

" TODO: cscope settings. Supposed to open cscope results in quickfix window, but
" I am having difficulty.
" set cscopequickfix=s-,c-,d-,i-,t-,e-

"If 'cscopetag' is set, the commands ":tag" and CTRL-] as well as "vim -t"
"will always use :cstag instead of the default :tag behavior.  Effectively,
"by setting 'cst', you will always search your cscope databases as well as
"your tag files.  The default is off.  Examples:
"        :set cst
"        :set nocst
set cscopetag

" ctrlp plugin
" set runtimepath^=~/.vim/bundle/ctrlp.vim

" insert date and time stamp
" strftime() is the key function. Do man 3 strftime for details on print format.
"
" Format String              Example output
" -------------              --------------
"  %c                         Thu 27 Sep 2007 07:37:42 AM EDT (depends on
"                             locale)
"  %a %d %b %Y                Thu 27 Sep 2007
"  %b %d, %Y                  Sep 27, 2007
"  %d/%m/%y %H:%M:%S          27/09/07 07:36:32
"  %H:%M:%S                   07:36:44
"  %T                         07:38:09
"  %m/%d/%y                   09/27/07
"  %y%m%d                     070927
"  %x %X (%Z)                 09/27/2007 08:00:59 AM (EDT)
"
"  RFC822 format:
"  %a, %d %b %Y %H:%M:%S %z   Wed, 29 Aug 2007 02:37:15 -0400
"
"  ISO8601/W3C format (http://www.w3.org/TR/NOTE-datetime):
"  %FT%T%z                    2007-08-29T02:37:13-0400
"
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
Plugin 'JCLiang/vim-cscope-utils'
Plugin 'scrooloose/nerdtree'
Plugin 'majutsushi/tagbar'
Plugin 'kien/ctrlp.vim'
Plugin 'chazy/cscope_maps'
Plugin 'vim-scripts/autoload_cscope.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
