" ### tpope/vim-fugitive
"
" | `:Gedit [thing]`          | [thing] can be a commit,                                              |
" |                           | blob, tree or tag (to view the commit etc)                            |
" | `:Gstatus` / `<leader>gs` | displays a buffer with git status.                                    |
" |                           | use `-` on filename to add / reset from staging                       |
" | `:Gcommit` / `<leader>gc` | will commit staged changes (with buffer for                           |
" |                           | commit message)                                                       |
" | `:Gblame` / `<leader>gb`  | vertical buffer to show git blame results                             |
" | `:Glog`                   | displays git log for current buffer in the quickfix                   |
" |                           | can be used with visual mode, highlight a function and `:Glog` to see |
" |                           | how it changes over time!                                             |
" | `:Gmove`                  | runs git mv on file and renames the buffer                            |
" | `:Gdelete`                | runs git rm on file and deletes the buffer                            |
" | `:Gread`                  | a variant of `git checkout -- filename` but on the buffer             |
" | `:Gbrowse`                | view current file in github                                           |
" |                           | - also works with visual mode                                         |
" | `:Git`                    | for any git command e.g. `:Git status`                                |
" ###
Plug 'tpope/vim-fugitive'

Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-git'

" ### airblade/vim-gitgutter 
" displays git diffs in the gutter (near line numbers)
"
" short cuts:
" | `<leader>hp`  | preview hunk               |
" | `<leader>hs`  | stage hunk                 |
" | `<leader>hu`  | undo hunk                  |
" | `[c` and `]c` | navigate to prev/next hunk |
" ###
Plug 'airblade/vim-gitgutter'

" ### gregsexton/gitv
" | `:Gitv` | to see a visual git log |
" ###
Plug 'gregsexton/gitv', {'on': ['Gitv']}

Plug 'mattn/gist-vim'
Plug 'mattn/webapi-vim'

