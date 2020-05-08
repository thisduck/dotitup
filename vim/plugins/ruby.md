```vim
Plug 'ecomba/vim-ruby-refactoring'
Plug 'tpope/vim-rvm'
Plug 'vim-ruby/vim-ruby'

Plug 'tpope/vim-rails'
```

| Instruction   | Description                                                                                     |
| ---           | ---                                                                                             |
| `gf`          | will take you to the model/template/etc over the cursor                                         |
| `:R` and `:A` | will switch between model to schema, template to helper, and controller to functional test, etc |


```vim
Plug 'tpope/vim-rake'
```

| Instruction | Description              |
| ---         | ---                      |
| `:Rake`     | wraps the `rake` command |

```vim
Plug 'tpope/vim-cucumber'
```

| Instruction | Description                                  |
| ---         | ---                                          |
| `[d` / `]d` | opens cucumber step definition in new buffer |

```vim
Plug 'tpope/vim-bundler'
```

| Instruction          | Description                |
| ---                  | ---                        |
| `:Bundle`            | wraps the `bundle` command |
| `:Bopen` / `:Bsplit` | opens gems                 |

```vim
Plug 'rainerborene/vim-reek'
let g:reek_always_show = 0
let g:reek_on_loading = 0
```

| Instruction | Description                                |
| ---         | ---                                        |
| `:RunReek`  | will run reek and show results in quickfix |
