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
set laststatus=2

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
"Plug 'ajh17/vimcompletesme'
Plug 'mattn/emmet-vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'francoiscabrol/ranger.vim'
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

"File fomatter
"Plug 'chiel92/vim-autoformat',{ 'on': 'Autoformat' }

if has('nvim')
    Plug 'neovim/nvim-lspconfig'
    Plug 'rbgrouleff/bclose.vim'
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


let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'✹',
                \ 'Staged'    :'✚',
                \ 'Untracked' :'✭',
                \ 'Renamed'   :'➜',
                \ 'Unmerged'  :'═',
                \ 'Deleted'   :'✖',
                \ 'Dirty'     :'✗',
                \ 'Ignored'   :'☒',
                \ 'Clean'     :'✔︎',
                \ 'Unknown'   :'?',
                \ }

"--------------------------------------------------------------------------

"Mappings
let g:mapleader = ' '
nnoremap <leader>s :w<CR>

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif


nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>


