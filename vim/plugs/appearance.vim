Plug 'chrisbra/color_highlight'
let g:colorizer_auto_filetype='css,html,sass,scss'

Plug 'bling/vim-airline'
let g:airline_mode_map = {
  \ '__' : '-',
  \ 'n'  : 'N',
  \ 'i'  : 'I',
  \ 'R'  : 'R',
  \ 'c'  : 'C',
  \ 'v'  : 'V',
  \ 'V'  : 'V',
  \ '' : 'V',
  \ 's'  : 'S',
  \ 'S'  : 'S',
  \ '' : 'S',
  \ 'h'  : 'H'
  \ }
let g:airline_powerline_fonts = 1

Plug 'Keithbsmiley/tmux.vim'
Plug 'edkolev/tmuxline.vim'

" Themes
Plug 'nanotech/jellybeans.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'tomasr/molokai'
Plug 'sickill/vim-monokai'
Plug 'tpope/vim-vividchalk'
Plug 'thisduck/tomorrow-theme', {'rtp': 'vim/'}
Plug 'rafi/awesome-vim-colorschemes'
