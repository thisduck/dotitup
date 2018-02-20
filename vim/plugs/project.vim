" -- Tim for Pope.
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-scriptease'

" ### tpope/vim-dispatch
" | Instruction  | Description                                                            |
" | ---          | ---                                                                    |
" | `:Delete`    | Delete a buffer and the file on disk simultaneously.                   |
" | `:Unlink`    | Like `:Delete`, but keeps the now empty buffer.                        |
" | `:Move`      | Rename a buffer and the file on disk simultaneously.                   |
" | `:Rename`    | Like `:Move`, but relative to the current file's containing directory. |
" | `:Chmod`     | Change the permissions of the current file.                            |
" | `:Mkdir`     | Create a directory, defaulting to the parent of the current file.      |
" | `:Find`      | Run `find` and load the results into the quickfix list.                |
" | `:Locate`    | Run `locate` and load the results into the quickfix list.              |
" | `:Wall`      | Write every open window.  Handy for kicking off tools like [guard][].  |
" | `:SudoWrite` | Write a privileged file with `sudo`.                                   |
" | `:SudoEdit`  | Edit a privileged file with `sudo`.                                    |
" ###
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-rsi'

" ### tpope/vim-dispatch
" | Instruction           | Description                                      |
" | ---                   | ---                                              |
" | `:Dispatch [command]` | will run the command and put results in quickfix |
" |                       | e.g. `:Dispatch bundle install`                  |
" ###
Plug 'tpope/vim-dispatch'

" ### scrooloose/nerdtree
" | Instruction                      | Description                                            |
" | ---                              | ---                                                    |
" | `:NERDTreeToggle` / `<leader>nt` | toggle the NERDTree drawer                             |
" |                                  | e.g. `:Dispatch bundle install`                        |
" | `:NERDTreeFind` / `<leader>nf`   | find current file in NERDTree                          |
" | while in NERDTree                |                                                        |
" | `m` while on file                | to see a menu (allows you to add/remove/rename dirs)   |
" | `i` while on file                | opens file in a split                                  |
" | `gi` while on file               | opens file in a split keep cursor in nerdtree          |
" | `s` while on file                | opens file in a vertical split                         |
" | `gs` while on file               | opens file in a vertical split keep cursor in nerdtree |
" | `R`                              | refresh the file listing to show any changes           |
" | `?`                              | for help                                               |
" ###
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let g:NERDTreeWinSize = 30
map <Leader>nt :NERDTreeToggle<CR>
map <Leader>nf :NERDTreeFind<CR>

" finds project root (usually a .git folder)
Plug 'airblade/vim-rooter'

Plug 'ludovicchabant/vim-gutentags'

Plug 'xolox/vim-misc'
Plug 'xolox/vim-notes'

Plug 'fweep/vim-zsh-path-completion'

" ### junegunn/vim-easy-align
" Allows for easy alignment of text
"
" From:
" ```ruby
" {
"   hello: "there",
"   foo: "bar",
"   name: "Jameel"
" }
" ```
"
" To:
" ```ruby
" {
"   hello: "there",
"   foo:   "bar",
"   name:  "Jameel"
" }
" ```
"
" In this case, highlight the related lines and press `ga:`
" `ga` activates the easy-align plugin, and 
" then `:` tells it to align on the :
"
" Probably best to visit https://github.com/junegunn/vim-easy-align for full usage.
" ###
Plug 'junegunn/vim-easy-align'
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" ### FZF Helpers
" The FZF commands are prefixed with `Fzf`
" So if you don't find the commands from the FZF docs
  " by running them, that is why.
"
" Shortcuts:
" | Instruction  | Description                                                    |
" | ---          | ---                                                            |
" | `<C-p>`      | fuzzy file search, substitute for CTRL-P. `:FzfFiles`          |
" | `<leader>bs` | fuzzy buffer and most recently used file search, `:FzfHistory` |
" | `<leader>.`  | fuzzy tags search, `:FzfTags`                                  |
" | `<leader>l`  | fuzzy search for the lines in current buffer, `:FzfBLines`     |
" | `<leader>he` | fuzzy search for vim help, `:FzfHelptags`                      |
" ###
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
let g:fzf_command_prefix = 'Fzf'
nnoremap <C-p> :<C-u>FzfFiles<CR>
nnoremap <leader>bs :<C-u>FzfHistory<CR>
nnoremap <leader>. :<C-u>FzfTags<CR>
nnoremap <leader>l :<C-u>FzfBLines<CR>
nnoremap <leader>he :<C-u>FzfHelptags<CR>

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
