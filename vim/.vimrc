if exists("*pathogen#infect")
    execute pathogen#infect()
endif
syntax on
filetype plugin indent on

set nocompatible

set t_Co=256
colorscheme desert
set guifont=Consolas:h11:cDEFAULT

set relativenumber

set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent
set smartindent
set smarttab

set encoding=utf-8
set scrolloff=8
set showmode
set showcmd
set hidden
set autoread
set cursorline
set wildmenu
set wildmode=list:longest
set visualbell
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set undodir=~/vimfiles/undodir
set undofile

let mapleader = ","

nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
nnoremap <leader><space> :noh<cr>
nnoremap <tab> %
vnoremap <tab> %

nnoremap <leader>ww gwip

nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
nnoremap j gj
nnoremap k gk

nnoremap ; :

map <C-n> :NERDTreeToggle<CR>

autocmd VimEnter * Helptags
autocmd FocusLost * :wa

function! Set_markdown_settings()
  setlocal filetype=markdown
  setlocal textwidth=79
  setlocal colorcolumn=+1
endfunction
function! Unset_markdown_settings()
  setlocal textwidth=0
  setlocal colorcolumn=""
endfunction
autocmd BufNewFile,BufEnter *.{md} call Set_markdown_settings()
autocmd BufLeave *.{md} call Unset_markdown_settings()

