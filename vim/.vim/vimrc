filetype plugin indent on
filetype indent on

syntax on       " syntax highlighting ON (default is OFF)
syntax enable

set backspace=indent,eol,start  " treat backspace like it behaves in all other
                                " programs:http://vi.stackexchange.com/a/2163/2796

set completeopt=menuone,noinsert,noselect
set diffopt+=vertical   " diff options are shown in vertical split
set expandtab	" tabs are expanded to spaces
set hlsearch  	" highlight search results
set ignorecase  " ignore case during search
set incsearch	" incremental search
" set mouse=a     " enable mouse
set nobackup
set noswapfile  " Whenever a file is open, VIM creates a .swp or similar files,
                " which prevents/warns other's from opening/modifying same file
                " at same time. This is good and bad. Good, for obvious reasons.
                " Bad because, if the file is inside Dropbox, the .filename.swp
                " is *somehow* always current or in modified state. So, Dropbox
                " continuously tries to sync that file which hogs up CPU (from
                " one experience). Alternately, the location of swap file can be
                " changed to outside Dropbox directory.

set nowritebackup   " Where 'nowritebackup' changes the default "save" behavior
                    " of Vim, which is:
                    "   write buffer to new file delete the original file rename
                    "   the new file and makes Vim write the buffer to the
                    "   original file (resulting in the risk of destroying it in
                    "   case of an I/O error). But you prevent "jumping files"
                    "   on the Windows desktop with it, which is the primary
                    "   reason for me to have nowritebackup in place. Reference:
                    "   https://stackoverflow.com/a/607475/630866

set number 	    " set line numbers
set path+=**    " enables fuzzy file search using :find command set wildignore+=**/directory/** should ignore files in a certain directory

set ruler 	    " (row, colum, % of document) are displayed at right bottom
set smartcase   " if we enabled case insensitive search, this setting overrides
                " that when searching with Upper case letters

set shiftwidth=4
set smarttab	"
set tabstop=4 	" tab is 4 spaces long

set tags=tags;/ " Vim will look for tags file from current directory up to the root

set textwidth=80 	" 80 column width
set timeoutlen=2000 	" 2 seconds instead of 1, for operations involving multiple keys such as tmux and screen.
set wildmenu	" when 'help patt' + tab, gives options in status line
set cursorline      " Highlight the cursor line
set cscopetag	"If 'cscopetag' is set, the commands ":tag" and CTRL-] as well as "vim -t"
				"will always use :cstag instead of the default :tag behavior.  Effectively,
				"by setting 'cst', you will always search your cscope databases as well as
				"your tag files.  The default is off.  Examples:
				"        :set cst
				"        :set nocst

"  For more:
"  http://vim.wikia.com/wiki/Insert_current_date_or_time
" nnoremap <F5> "=strftime("[%a %d, %H:%M]")<CR>P
" inoremap <F5> <C-R>=strftime("[%a %d, %H:%M]")<CR>
nnoremap <F5> "=strftime("%Y, %b %d (%a)")<CR>P
inoremap <F5> <C-R>=strftime("%Y, %b %d (%a)")<CR>

" If available, enable termguicolors
if (has("termguicolors"))
    set termguicolors
endif

" Everything below is copied from VundleVim website
" https://github.com/VundleVim/Vundle.vim
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

call vundle#end()
