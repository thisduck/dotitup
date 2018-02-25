Plug 'vim-scripts/IndexedSearch'
Plug 'junegunn/vim-slash'

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
" | Instruction            | Description                                   |
" | ---                    | ---                                           |
" | `<leader>w`            | will highlight words after the cursor         |
" | `<leader><leader>w`    | will highlight all words even across windows  |
" | `<leader>b`            | will highlight words before the cursor        |
" | `<leader>j`            | will highlight lines after the cursor         |
" | `<leader><leader>j`    | will highlight all lines even across windows  |
" | `<leader>k`            | will highlight lines before the cursor        |
" | `<leader>ge`           | will highlight end of words before the cursor |
" | `<leader>e`            | will highlight end of words after the cursor  |
" | `<leader>s[character]` | will highlight `[character]` across windows   |
" ###
Plug 'Lokaltog/vim-easymotion'
map <Leader> <Plug>(easymotion-prefix)
nmap <Leader><Leader>w <Plug>(easymotion-overwin-w)
nmap <Leader><Leader>j <Plug>(easymotion-overwin-line)

map <Leader>s <Plug>(easymotion-bd-f)
nmap <Leader>s <Plug>(easymotion-overwin-f)

Plug 'skywind3000/asyncrun.vim'

" real time visualization for search and replace (substitution)
if has('nvim')
  set inccommand=nosplit
else
  Plug 'xtal8/traces.vim'
endif

" ### Shougo/denite.nvim
" Shortcuts:
"
" | Instruction  | Description                                      |
" | ---          | ---                                              |
" | `<C-p>`      | fuzzy file search, substitute for CTRL-P.        |
" | `<leader>bs` | fuzzy buffer and most recently used file search. |
" | `<leader>dl` | fuzzy search for the lines in current buffer.    |
" | `<leader>he` | fuzzy search for vim help.                       |
"
" ###
Plug 'Shougo/denite.nvim'
nnoremap <leader>dl :<C-u>Denite line<CR>
nnoremap <C-p> :<C-u>DeniteProjectDir file_rec -reversed<CR>
nnoremap <leader>he :<C-u>Denite help<CR>
nnoremap <leader>bs :<C-u>Denite buffer file_mru<CR>

" Plug 'nixprime/cpsm', { 'do': 'PY3=ON ./install.sh' }
Plug 'Shougo/neomru.vim'
