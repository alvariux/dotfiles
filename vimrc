set nocompatible
set title
set number
set mouse=a
set nowrap
set cursorline
set colorcolumn=120
set hidden

set tabstop=2
set shiftwidth=2
set softtabstop=2
set shiftround
set expandtab
set smartindent

set encoding=utf-8 nobomb

" Set the status line to something useful
set statusline=%f\ %=L:%l/%L\ %c\ (%p%%)

set backspace=indent,eol,start  " more powerful backspacing

"--------------------------------------------------------------------------

" Show 'invisible' characters
set list
" Set characters used to indicate 'invisible' characters
set listchars=tab:▸\
set listchars+=trail:·
set listchars+=nbsp:_
"set listchars+=eol:¬

"--------------------------------------------------------------------------

" Centralize backups, swapfiles and undo history
if empty(glob('~/.vim/swaps'))
    silent !mkdir -p ~/.vim/swaps
endif

if empty(glob('~/.vim/backups'))
    silent !mkdir -p ~/.vim/backups
endif

if empty(glob('~/.vim/undo'))
    silent !mkdir -p ~/.vim/undo
endif

set backupdir=$HOME/.vim/backups
set directory=$HOME/.vim/swaps
if exists("&undodir")
    set undodir=$HOME/.vim/undo
endif
set viminfo+=n$HOME/.vim/.viminfo

"Remeber last edit position
au BufReadPost * if line("'\"") > 0 && line ("'\"") <= line("$") | exe "normal! g'\"" | endif

"Clipboard
if has('nvim')
    set clipboard=unnamedplus
else
    set clipboard=unnamed
endif

"--------------------------------------------------------------------------
" Initialize plugin system
call plug#begin('~/.vim/plugged')

"Color themes
Plug 'lifepillar/vim-solarized8'
Plug 'arcticicestudio/nord-vim'

"Language syntax higlighter
Plug 'sheerun/vim-polyglot'

"Tab autocomplete
Plug 'ajh17/vimcompletesme'

"File fomatter
"Plug 'chiel92/vim-autoformat',{ 'on': 'Autoformat' }

if has('nvim')
    Plug 'neovim/nvim-lspconfig'
else
    Plug 'prabirshrestha/async.vim'
    Plug 'prabirshrestha/vim-lsp'
endif

call plug#end()

"--------------------------------------------------------------------------

if has("syntax")
    " Enable syntax highlighting
    syntax enable
    " Set 256 color terminal support
    set t_Co=256
    " Set dark background
    set background=dark
    " Set colorscheme
    silent! colorscheme solarized8
    "silent! colorscheme nord
    set termguicolors
endif

"--------------------------------------------------------------------------

"Mappings
let g:mapleader = ' '
nnoremap <leader>s :w<CR>


