NeoBundle 'Shougo/vimproc.vim', {
      \ 'build' : {
      \     'windows' : 'tools\\update-dll-mingw',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }

" -- Tim for Pope.
NeoBundle 'tpope/vim-sensible'
NeoBundle 'tpope/vim-dispatch'
NeoBundle 'tpope/vim-scriptease'
NeoBundle 'tpope/vim-eunuch'
NeoBundle 'pope/vim-rsi'

NeoBundle 'scrooloose/nerdtree.git'
NeoBundle 'airblade/vim-rooter'

NeoBundle 'xolox/vim-misc'
NeoBundle 'xolox/vim-notes'

NeoBundle 'edkolev/tmuxline.vim'
NeoBundle 'regedarek/ZoomWin'

NeoBundle 'fweep/vim-zsh-path-completion'

" --- United we stand.
NeoBundle 'Shougo/vimshell.vim'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'tsukkee/unite-tag'
NeoBundle 'ujihisa/unite-colorscheme'
NeoBundle 'basyura/unite-rails'
NeoBundle 'tsukkee/unite-help'
NeoBundle 'thinca/vim-unite-history'
NeoBundle 'Shougo/neomru.vim'