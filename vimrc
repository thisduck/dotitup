" ---

set nocompatible " turns vi compatibility off.
filetype off " for now, while vundle loads anyway

" ---

let mapleader=" "

if filereadable(expand("~/.vim/vundles.vim"))
  source ~/.vim/vundles.vim
endif

" ---

colorscheme Tomorrow-Night
set cursorline
set title

" ---

syntax on
set number " displays line numbers.
filetype plugin on
filetype indent on

" ---

set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab
