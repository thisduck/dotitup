"" copy to clipboard
map <Leader>y "*y

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" ### CTags
" Should use https://github.com/universal-ctags/ctags for ctags.
"
" `<leader>ct` will run ctags on the project recursively, using the
" options in the ~/.ctags file.
" ###
map <Leader>ct :AsyncOpenRun ctags -R .<CR><CR>

"" toggle set paste
nnoremap <Leader>pp :set invpaste<CR>:set paste?<CR>
nnoremap <Leader><Leader>p :set invpaste<CR>:set paste?<CR>

" ---

vmap <leader>s :sort<cr>

"" ---

inoremap <c-c> <ESC>

"" --- Taken from vim-ruby to map <C-]> to g<C-]>

nnoremap <C-]> g<C-]>

"" ---

let g:notes_directories = ['~/Desktop/vim-notes']

set rtp+=~/.vim/custom/

"" --- Replace old style ruby hashes with new style
map <Leader>> :s<Home>silent! <End>@:\([^: =({})]\+\)\s*=>\s*@\1: @g<CR> :nohlsearch<CR>

"" --- Break up a long ruby line
map <Leader>bb :s<Home>silent! <End>@,\(?!$\)@,\r@g<CR> 
      \ :s<Home>silent! <End>@}@\r}@g<CR> 
      \ :s<Home>silent! <End>@{@{\r@g<CR> 
      \ :s<Home>silent! <End>@(@(\r@g<CR> 
      \ :s<Home>silent! <End>@)@\r)@g<CR> 
      \ =
      \ :set nohlsearch<CR>
      " \ :silent! s@&@&\r@g<CR> 
