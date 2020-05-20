# Appearance Settings

```vim
set termguicolors

let g:preferred_colorschemes = [
  \ "deep-space",
  \ "colorsbox-stnight",
  \ "bubblegum",
\ ]

colorscheme bubblegum

let scheme_index = xolox#colorscheme_switcher#random_number(len(g:preferred_colorschemes))
call xolox#colorscheme_switcher#switch_to(g:preferred_colorschemes[scheme_index])

highlight CocHighlightText ctermbg=238  guibg=#444444
```


```vim
" set foldmethod=indent
" set foldlevelstart=20

set showbreak=↪
set wrap

"" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

set number " displays line numbers.
set cursorline
set textwidth=80
set colorcolumn=0

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
