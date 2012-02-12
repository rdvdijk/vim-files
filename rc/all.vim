" add to your own .vimrc:
"
"   source ~/.vim/rc/all.vim
"
set nocompatible
call pathogen#infect()
syntax on
filetype plugin indent on
set background=dark

" Mapleader comma is what the cool kids use
let mapleader = ","

" Don't redraw during macro execution
set lazyredraw

" tir_black looks most like ir_black in console
" colorscheme tir_black

" Syntax coloring lines that are too long just slows down the world
set synmaxcol=2048

" Normal line numbering
set number

" No wrapping by default
set nowrap

" I don't care what language I use, 2 spaces per tab!
set autoindent
set cindent
set expandtab
set shiftwidth=2
set smartindent
set smarttab
set softtabstop=2
set tabstop=2

" Rename :W to :w
command! W :w

" Turn off F1
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" in insert mode, jj goes to normal mode
" if you ever need to type jj for real, type it slowly, like on old school mobile phones
inoremap jj <ESC>

" Search
set smartcase
set incsearch
set showmatch
set hlsearch

" Keep a few lines above and below current line
set scrolloff=4

nnoremap <leader>] :noh<cr>

" Remap return to clear search
:nnoremap <CR> :nohlsearch<cr>

" enable matchit
runtime macros/matchit.vim

source ~/.vim/rc/arrow_keys.vim
source ~/.vim/rc/splits.vim
source ~/.vim/rc/history.vim
source ~/.vim/rc/statusbar.vim
source ~/.vim/rc/ruby.vim
source ~/.vim/rc/clojure.vim
source ~/.vim/rc/bufexplorer.vim
