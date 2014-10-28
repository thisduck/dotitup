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
NeoBundle 'tpope/vim-rsi'

NeoBundle 'scrooloose/nerdtree.git'
NeoBundle 'airblade/vim-rooter'

NeoBundle 'xolox/vim-misc'
NeoBundle 'xolox/vim-notes'

NeoBundle 'edkolev/tmuxline.vim'
NeoBundle 'regedarek/ZoomWin'

NeoBundle 'fweep/vim-zsh-path-completion'

" NeoBundle 'majutsushi/tagbar'

" --- United we stand.
NeoBundle 'Shougo/vimshell.vim'
NeoBundle 'thisduck/unite.vim' " using modified version
NeoBundle 'tsukkee/unite-tag'
NeoBundle 'ujihisa/unite-colorscheme'
NeoBundle 'basyura/unite-rails'
NeoBundle 'tsukkee/unite-help'
NeoBundle 'thinca/vim-unite-history'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'kmnk/vim-unite-giti'
NeoBundle 'ujihisa/unite-locate'
NeoBundle 'moznion/unite-git-conflict.vim'
NeoBundle 'Shougo/vimfiler.vim'
NeoBundle 'Shougo/neossh.vim'
