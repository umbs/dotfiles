filetype plugin indent on

syntax on       " syntax highlighting ON (default is OFF)


"""""""""""""""""""""""""""""""""""""""""""""""""""""
" Basic 'set' configurations
"""""""""""""""""""""""""""""""""""""""""""""""""""""
set cursorline      " Highlight the cursor line

set nobackup
set noswapfile
set number

set incsearch   " incremental search
set hlsearch    " highlight search results
set ignorecase  " ignore case during search

set ruler       " (row, colum, % of document) are displayed at right bottom
set wildmenu    " when 'help patt' + tab, gives options in status line
set path+=**    " enables fuzzy file search using :find command
                " set wildignore+=**/directory/** should ignore files in a
                " certain directory

set expandtab   " tabs are expanded to spaces
" number of spaces used for autoindents
set shiftwidth=4
" enable autoindents
set smartcase   " if we enabled case insensitive search, this setting overrides 
                " that when searching with Upper case letters

set smartindent
set smarttab
set softtabstop=4
set tabstop=4   " tab is 4 spaces long

set tags=tags;/ " Vim will look for tags file from current directory up to the root

set signcolumn=number   " show signs in number column

" If available, enable termguicolors
if (has("termguicolors"))
    set termguicolors
endif

" Mapping current date to F5
:nnoremap <F5> "=strftime('%Y, %b %d (%a)')"<CR>P
:inoremap <F5> <C-R>=strftime('%Y, %b %d (%a)')<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""
"               Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.config/nvim/plugged')

" plugins will go here
Plug 'gruvbox-community/gruvbox'

" Telescope requires plenary to function
Plug 'nvim-lua/plenary.nvim'
" The main Telescope plugin
Plug 'nvim-telescope/telescope.nvim'
" An optional plugin recommended by Telescope docs
Plug 'nvim-telescope/telescope-fzf-native.nvim', {'do': 'make' }

Plug 'tpope/vim-fugitive'
Plug 'lewis6991/gitsigns.nvim'

" LSP
Plug 'neovim/nvim-lspconfig'

" Autocompletion
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'onsails/lspkind-nvim'

" Treesitter
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }

call plug#end()

" Load all plugins in ~/.config/nvim/lua/bhaskar/ workspace. Neovim looks for
" init.lua in that namespace
lua require('bhaskar')

" declare your color scheme
colorscheme gruvbox

" Use this for dark color schemes
set background=dark

" Reference
" [1] https://www.jakewiesler.com/blog/getting-started-with-vim
