Plug 'vim-scripts/IndexedSearch'

" ### skwp/greplace.vim
" From the docs:
" 1. Use `:Gsearch` to get a buffer window of your search results
" 2. then you can make the replacements inside the buffer window using traditional tools (%s/foo/bar/)
" 3. Invoke `:Greplace` to make your changes across all files. It will ask you interatively y/n/a - you can hit 'a' to do all.
" 4. Save changes to all files with `:wall` (write all)
" ###
Plug 'skwp/greplace.vim'

" ### Lokaltog/vim-easymotion
" issuing an easymotion shortcut will highlight words/lines with keys
" from the keyboard. when you press those keys, it will take you 
" to that word or line. you have to try it.
"
" | Instruction  | Description                                   |
" | ---          | ---                                           |
" | `<leader>w`  | will highlight words after the cursor         |
" | `<leader>b`  | will highlight words before the cursor        |
" | `<leader>j`  | will highlight lines after the cursor         |
" | `<leader>k`  | will highlight lines before the cursor        |
" | `<leader>ge` | will highlight end of words before the cursor |
" | `<leader>e`  | will highlight end of words after the cursor  |
" ###
Plug 'Lokaltog/vim-easymotion'
map <Leader> <Plug>(easymotion-prefix)

Plug 'skywind3000/asyncrun.vim'

" real time visualization for search and replace (substitution)
Plug 'xtal8/traces.vim'
