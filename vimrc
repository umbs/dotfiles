execute pathogen#infect()
syntax on
filetype plugin indent on

" Vim settings
set incsearch   " incremental search
set hlsearch    " highlight search results
set number      " set line numbers
set ruler       " (row, colum, % of document) are displayed at right bottom
set timeoutlen=2000     " 2 seconds instead of 1, for operations involving
                        " multiple keys such as tmux and screen.

set textwidth=76        " 76 column width
set wildmenu    " when 'help patt' + tab, gives options in status line
set shiftwidth=4
set tabstop=4   " tab is 4 spaces long
set expandtab   " tabs are expanded to spaces
set smarttab    "
set ignorecase  " ignore case during search

set noswapfile  " Whenever a file is open, VIM creates a .swp or similar files,
                " which prevents/warns other's from opening/modifying same file
                " at same time. This is good and bad. Good, for obvious reasons.
                " Bad because, if the file is inside Dropbox, the .filename.swp
                " is *somehow* always current or in modified state. So, Dropbox
                " continuously tries to sync that file which hogs up CPU (from
                " one experience). Alternately, the location of swap files can
                " be changed to outside Dropbox directory.

syntax on       " syntax highlighting ON (default is OFF)

set backspace=indent,eol,start  " treat backspace like it behaves in all other
                                " programs:http://vi.stackexchange.com/a/2163/2796

set showmatch   " show  matching [] {} ()

" let python_highlight_all = 1    " enable all python syntax highlighting features

" TODO: cscope settings, search results are displayed in quickfix window instead of a
" new window that *could* occupy full window. I am having difficulty getting
" this to work.
" set cscopequickfix=s-,c-,d-,i-,t-,e-

"If 'cscopetag' is set, the commands ":tag" and CTRL-] as well as "vim -t"
"will always use :cstag instead of the default :tag behavior.  Effectively,
"by setting 'cst', you will always search your cscope databases as well as
"your tag files.  The default is off.  Examples:
"        :set cst
"        :set nocst
set cscopetag

" Specific to Tagbar plugin.
" This setting opens Tagbar window in bottom of page. Default is to the right.
" The number (15) indicates number of lines to display. Increase/decrease as
" needed.
" let g:tagbar_vertical=15

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

" NERDTree key maps
nnoremap <F8> :NERDTreeToggle<CR>
inoremap <F8> <Esc>:NERDTreeToggle<CR>A

" Specific to Tagbar plugin.
" This setting opens Tagbar window in bottom of page. Default is to the right.
" The number (15) indicates number of lines to display. Increase/decrease as
" needed.
" let g:tagbar_vertical=15
nnoremap <silent> <F9> :TagbarToggle<CR>
"
" 'Esc' switches to normal mode.
" ':TagbarToggle' toggles current Tagbar state.
" 'A' switches back to insert mode and cursor at end of current line.
inoremap <silent> <F9> <Esc>:TagbarToggle<CR>A

" show 'buffers' to list recently opened files.
nnoremap <F10> :buffers<CR>
inoremap <F10> <Esc>:buffers<CR>A
