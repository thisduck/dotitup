```vim
" -- Tim for Pope.
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-scriptease'
```

### tpope/vim-dispatch

| Instruction  | Description                                                            |
| ---          | ---                                                                    |
| `:Delete`    | Delete a buffer and the file on disk simultaneously.                   |
| `:Unlink`    | Like `:Delete`, but keeps the now empty buffer.                        |
| `:Move`      | Rename a buffer and the file on disk simultaneously.                   |
| `:Rename`    | Like `:Move`, but relative to the current file's containing directory. |
| `:Chmod`     | Change the permissions of the current file.                            |
| `:Mkdir`     | Create a directory, defaulting to the parent of the current file.      |
| `:Find`      | Run `find` and load the results into the quickfix list.                |
| `:Locate`    | Run `locate` and load the results into the quickfix list.              |
| `:Wall`      | Write every open window.  Handy for kicking off tools like [guard][].  |
| `:SudoWrite` | Write a privileged file with `sudo`.                                   |
| `:SudoEdit`  | Edit a privileged file with `sudo`.                                    |

```vim
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-rsi'
```

### tpope/vim-dispatch

| Instruction           | Description                                      |
| ---                   | ---                                              |
| `:Dispatch [command]` | will run the command and put results in quickfix |
|                       | e.g. `:Dispatch bundle install`                  |

```vim
Plug 'tpope/vim-dispatch'
```

### scrooloose/nerdtree

| Instruction                      | Description                                            |
| ---                              | ---                                                    |
| `:NERDTreeToggle` / `<leader>nt` | toggle the NERDTree drawer                             |
| `:NERDTreeFind` / `<leader>nf`   | find current file in NERDTree                          |
| while in NERDTree                |                                                        |
| `m` while on file                | to see a menu (allows you to add/remove/rename dirs)   |
| `i` while on file                | opens file in a split                                  |
| `gi` while on file               | opens file in a split keep cursor in nerdtree          |
| `s` while on file                | opens file in a vertical split                         |
| `gs` while on file               | opens file in a vertical split keep cursor in nerdtree |
| `R`                              | refresh the file listing to show any changes           |
| `?`                              | for help                                               |

```vim
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeShowHidden=1
let g:NERDTreeWinSize = 30
map <Leader>nt :NERDTreeToggle<CR>
map <Leader>nf :NERDTreeFind<CR>
```

```vim
" finds project root (usually a .git folder)
Plug 'airblade/vim-rooter'

Plug 'ludovicchabant/vim-gutentags'

Plug 'xolox/vim-misc'

" Commenting out because it asks a question on install
" Plug 'xolox/vim-notes'

Plug 'fweep/vim-zsh-path-completion'
```

### junegunn/vim-easy-align
Allows for easy alignment of text

In this case, highlight the related lines and press `ga:`
`ga` activates the easy-align plugin, and 
then `:` tells it to align on the `:` character.

Probably best to visit https://github.com/junegunn/vim-easy-align for full usage.

```vim
Plug 'junegunn/vim-easy-align'
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
```

### FZF Helpers
The FZF commands are prefixed with `Fzf`
So if you don't find the commands from the FZF docs
by running them, that is why.

Look at the FZF docs for usage.

```vim
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
let g:fzf_command_prefix = 'Fzf'
```


```vim
Plug 'mhinz/vim-startify'
let g:startify_change_to_vcs_root = 1
let g:startify_list_order = [
  \ ['   Most Recent Project Files'],
  \ 'dir',
  \ ['   Most Recent Files'],
  \ 'files',
  \ ['   Sessions:'],
  \ 'sessions',
  \ ['   Bookmarks:'],
  \ 'bookmarks',
  \ ['   Commands:'],
  \ 'commands',
  \ ]

" adding csv functionality
Plug 'chrisbra/csv.vim'

Plug 'machakann/vim-highlightedyank'
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
