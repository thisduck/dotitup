```vim
Plug 'dense-analysis/ale'
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0
let g:ale_lint_on_save = 1

let g:ale_linters = {
\   'ruby': ['rubocop', 'ruby'],
\}

let g:ale_fixers = {
\   'ruby': ['rubocop'],
\   'json': ['prettier'],
\   'sass': ['stylelint'],
\   'scss': ['stylelint'],
\   'javascript': ['eslint'],
\   'coffeescript': ['coffeelint'],
\}
nnoremap <silent> <leader>af :ALEFix<CR>
nnoremap <silent> <leader>al :ALELint<CR>
```

### w0rp/ale
syntax checking for multiple languages
currently configured so that syntax 
suggestions will be made when you run `:ALELint`

| Instruction   | Description                            |
| ---           | ---                                    |
| `:ALELint`    | Fix things in buffer that can be fixed |
| `:ALEFix`     | Fix things in buffer that can be fixed |
| `:ALEDisable` | disbles ale                            |
| `:ALEEnable`  | enables ale                            |


```vim
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
" originally 'honza/vim-snippets', but cloned to remove some duplicates.
Plug 'thisduck/vim-snippets'
let g:neosnippet#snippets_directory='~/.dotvim/plugged/vim-snippets/snippets,~/.dotvim/custom/dotitup_snippets'
```

### Shougo/neosnippet.vim
You can create your own snippets that can be inserted into the 
code via the autocomplete functionality.

Some default snippets are provided by honza/vim-snippets

```vim
Plug 'mattn/emmet-vim'
```

### mattn/emmet-vim
The emmet plugin allows quick insertion of html into the code.
Follow the tutorial here: https://raw.githubusercontent.com/mattn/emmet-vim/master/TUTORIAL


