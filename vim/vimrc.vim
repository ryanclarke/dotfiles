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
nnoremap <left> ,
nnoremap <right> ;
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
nnoremap j gj
nnoremap k gk

nnoremap ; :

map <leader>n :e.<CR>P

map <leader>x "+x
map <leader>c "+y
map <leader>v "+gP

map <leader><up> <C-w><up>
map <leader><down> <C-w><down>
map <leader><left> <C-w><left>
map <leader><right> <C-w><right>

map <leader>b :ls<CR>:b<space>
map <leader>p <Esc><Esc>Orequire 'pry'; binding.pry<Esc>
map <leader>f <Esc><Esc>gg=G<Esc>

autocmd BufNewFile,BufReadPost *.md set filetype=markdown

autocmd VimEnter * Helptags
autocmd FocusLost * :wa


