# Appearance Settings

```vim
set encoding=utf-8

set termguicolors
let base16colorspace=256
set background=dark

let g:ruby_operators = 1
let g:onedark_color_overrides = {
\ 'comment_grey': { "gui": "#9e9e90", "cterm": "246", "cterm16": "16" }
\ }

" 1989
let g:preferred_colorschemes = [
  \ "deep-space",
  \ "neodark",
  \ "colorsbox-material",
  \ "colorsbox-steighties",
  \ "colorsbox-stnight",
  \ "anderson",
  \ "bubblegum-256-light",
  \ "bubblegum",
  \ "Tomorrow-Night-Eighties",
  \ "afterglow",
  \ "clearance",
  \ "antares",
  \ "boa",
  \ "candyman",
  \ "codedark",
  \ "codeschool",
  \ "crunchbang",
  \ "dracula",
  \ "OceanicNext",
\ ]

colorscheme bubblegum

let scheme_index = xolox#colorscheme_switcher#random_number(len(g:preferred_colorschemes))
call xolox#colorscheme_switcher#switch_to(g:preferred_colorschemes[scheme_index])

highlight CocHighlightText ctermbg=238  guibg=#444444
```


```vim
" set foldmethod=indent
" set foldlevelstart=20

set showbreak=⇇
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
