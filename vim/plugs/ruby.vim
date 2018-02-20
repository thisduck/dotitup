Plug 'ecomba/vim-ruby-refactoring'
Plug 'tpope/vim-rvm'
Plug 'vim-ruby/vim-ruby'

" ### tpope/vim-rails
" | `gf` | will take you to the model/template/etc over the cursor |
" | `:R` and `:A` | will switch between model to schema, template to helper, and controller to functional test, etc |
" ###
Plug 'tpope/vim-rails'

" ### tpope/vim-rake
" | `:Rake` | wraps the `rake` command |
" ###
Plug 'tpope/vim-rake'

" ### tpope/cucumber
" | `[d` / `]d` | opens cucumber step definition in new buffer |
" ###
Plug 'tpope/vim-cucumber'

" Plug 'Keithbsmiley/rspec.vim'

" ### tpope/vim-bundler
" | `:Bundle` | wraps the `bundle` command |
" | `:Bopen` / `:Bsplit` | opens gems |
" ###
Plug 'tpope/vim-bundler'

" ### rainerborene/vim-reek
" | `:RunReek` | will run reek and show results in quickfix |
" ###
Plug 'rainerborene/vim-reek'
let g:reek_always_show = 0
let g:reek_on_loading = 0
