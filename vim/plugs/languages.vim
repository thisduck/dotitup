" syntax highlighting for multiple languages
Plug 'sheerun/vim-polyglot'

" ### w0rp/ale
" syntax checking for multiple languages
" currently configured so that syntax 
" suggestions will be made when you run `:ALELint`
"
" | Instruction   | Description                            |
" | ---           | ---                                    |
" | `:ALELint`    | Fix things in buffer that can be fixed |
" | `:ALEFix`     | Fix things in buffer that can be fixed |
" | `:ALEDisable` | disbles ale                            |
" | `:ALEEnable`  | enables ale                            |
" ###
Plug 'w0rp/ale'
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0
let g:ale_lint_on_save = 0

let g:ale_fixers = {
\   'ruby': ['rubocop'],
\   'json': ['prettier'],
\   'sass': ['stylelint'],
\   'scss': ['stylelint'],
\}

" ### Shougo/neosnippet.vim
" You can create your own snippets that can be inserted into the 
" code via the autocomplete functionality.
"
" Some default snippets are provided by honza/vim-snippets
" ###
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
" originally 'honza/vim-snippets', but cloned to remove some duplicates.
Plug 'thisduck/vim-snippets'
let g:neosnippet#snippets_directory='~/.dotvim/plugged/vim-snippets/snippets,~/.dotvim/custom/dotitup_snippets'

" ### mattn/emmet-vim
" The emmet plugin allows quick insertion of html into the code.
" Follow the tutorial here: https://raw.githubusercontent.com/mattn/emmet-vim/master/TUTORIAL
" ###
Plug 'mattn/emmet-vim'

" ### kannokanno/previm
" Allows realtime preview of markdown (and some other) files
"
" | Instruction                   | Description                              |
" | ---                           | ---                                      |
" | `:PrevimOpen` or `<leader>po` | opens current markdown buffer in browser |
" ###
Plug 'kannokanno/previm'
Plug 'tyru/open-browser.vim'
nnoremap <silent> <leader>po :PrevimOpen<CR>
