
### tpope/vim-dispatch

| Instruction           | Description                                      |
| ---                   | ---                                              |
| `:Dispatch [command]` | will run the command and put results in quickfix |
|                       | e.g. `:Dispatch bundle install`                  |

```vim
Plug 'tpope/vim-dispatch'
```

```vim
" finds project root (usually a .git folder)
Plug 'airblade/vim-rooter'

Plug 'xolox/vim-misc'

" Commenting out because it asks a question on install
" Plug 'xolox/vim-notes'

Plug 'fweep/vim-zsh-path-completion'
```



```vim

" adding csv functionality
Plug 'chrisbra/csv.vim'

```

### majutsushi/tagbar

| Instruction             | Description              |
| ---                     | ---                      |
| `:Tagbar` / `<leader>t` | toggle the Tagbar window |

```vim
Plug 'majutsushi/tagbar'
map <Leader>t :Tagbar<CR>
let g:airline#extensions#tagbar#enabled = 0
```
