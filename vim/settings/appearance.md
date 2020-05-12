```vim
set encoding=utf-8

colorscheme onedark
set background=dark


" set autoindent
" set smartindent
" set smarttab
" set shiftwidth=2
" set softtabstop=2
" set tabstop=2
" set expandtab

" set foldmethod=indent
" set foldlevelstart=20

" set showbreak=⇇
" set wrap

"" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

set number " displays line numbers.
set cursorline
set textwidth=80
set colorcolumn=+1



" Display tabs and trailing spaces visually
set list listchars=tab:▸\ ,trail:·
```

This sets the appearance of fzf's window.

```vim
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }
```
