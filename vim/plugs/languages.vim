" syntax highlighting for multiple languages
Plug 'sheerun/vim-polyglot'

" ### w0rp/ale
" syntax checking for multiple languages
" currently configured so that syntax 
" suggestions will be made on save
"
" | `:ALEFix`     | Fix things in buffer that can be fixed |
" | `:ALEDisable` | disbles ale                            |
" | `:ALEEnable`  | enables ale                            |
" ###
Plug 'w0rp/ale'

Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'honza/vim-snippets'
Plug 'mattn/emmet-vim'

" ### kannokanno/previm
" Allows realtime preview of markdown (and some other) files
" | `:PrevimOpen` or `<leader>po` | opens current markdown buffer in browser |
" ###
Plug 'kannokanno/previm'
Plug 'tyru/open-browser.vim'
nnoremap <silent> <leader>po :PrevimOpen<CR>
