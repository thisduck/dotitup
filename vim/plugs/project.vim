" -- Tim for Pope.
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-scriptease'
" ### tpope/vim-dispatch
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
" | `:Dispatch [command]` | will run the command and put results in quickfix |
" |                       | e.g. `:Dispatch bundle install`                  |
" ###
Plug 'tpope/vim-dispatch'

" ### scrooloose/nerdtree
" | `:NERDTreeToggle` / `<leader>nt` | toggle the NERDTree drawer                           |
" |                                  | e.g. `:Dispatch bundle install`                      |
" | `:NERDTreeFind` / `<leader>nf`   | find current file in NERDTree                        |
" | while in NERDTree                |                                                      |
" | `m` while on file                | to see a menu (allows you to add/remove/rename dirs) |
" | `R`                              | refresh the file listing to show any changes         |
" ###
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-rooter'

Plug 'xolox/vim-misc'
Plug 'xolox/vim-notes'

Plug 'edkolev/tmuxline.vim'

Plug 'fweep/vim-zsh-path-completion'

Plug 'junegunn/vim-easy-align'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'mhinz/vim-startify'
let g:startify_change_to_vcs_root = 1

" adding csv functionality
Plug 'chrisbra/csv.vim'
