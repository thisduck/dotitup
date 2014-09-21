" ---

set nocompatible " turns vi compatibility off.

" ---

let mapleader=" "

if filereadable(expand("~/.vim/vundles.vim"))
  source ~/.vim/vundles.vim
endif

" ---

colorscheme Tomorrow-Night
set cursorline

" ---

syntax on
set number " displays line numbers.

" ---

set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

" ---

set noswapfile
set nobackup
set nowb

" ---

set backspace=indent,eol,start  " Allow backspace in insert mode
set history=1000                " Store lots of :cmdline history
set showcmd                     " Show incomplete cmds down the bottom
set noshowmode                  " Don't Show current mode down the bottom
set gcr=a:blinkon0              " Disable cursor blink
set visualbell                  " No sounds
set autoread                    " Reload files changed outside vim
set hidden

" ---

set wildmenu
set wildmode=longest,list,full

" ---

set ignorecase
set smartcase
set hlsearch
nmap // :silent :nohlsearch<CR>
set incsearch

" ---

set scrolloff=8
set sidescrolloff=15
set sidescroll=1

" ---

" Display tabs and trailing spaces visually
set list listchars=tab:▸\ ,trail:·

" ---

" ================ Persistent Undo ==================
" Keep undo history across sessions, by storing in file.
" Only works all the time.
if has('persistent_undo')
  silent !mkdir ~/.vim/backups > /dev/null 2>&1
  set undodir=~/.vim/backups
  set undofile
endif

" ---
source ~/.vim/settings.vim

" ---

if filereadable(expand("~/.vimrc.after"))
  source ~/.vimrc.after
endif
