" ### Custom Shortcuts
"
" | `<C-c>`                     | For most purposes a remap to <ESC>                                                 |
" | `<leader>y`                 | copy visual selection to clipboard                                                 |
" | `<leader>ct`                | will run ctags on the project recursively, using the options in the ~/.ctags file. |
" | `<leader><leader>p`         | toggle `:set paste/nopaste` for when you want to paste text from the clipboard     |
" | `<leader>s`                 | sort the visual selection                                                          |
" | `<leader>>`                 | replace old style ruby hashes with new style                                       |
" | `<leader>bb`                | break up a ruby line somewhat sensibly                                             |
" | `<leader>gf`                | `gf` in a vertical split                                                           |
" | *Window Movement Shortcuts* |                                                                                    |
" | `<C-j>`                     | `<C-w>j`                                                                           |
" | `<C-k>`                     | `<C-w>k`                                                                           |
" | `<C-h>`                     | `<C-w>h`                                                                           |
" | `<C-l>`                     | `<C-w>l`                                                                           |
" ###

"" copy to clipboard
map <Leader>y "*y

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

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

"" --- Break up a long ruby line around commas

function! DotSplitComma()
  silent! execute a:firstline . "," . a:lastline . 's@\(.\),\s*\t*\(.\)@\1,\r\2@g'
  let l:current_line = line('.')
  silent! execute  a:firstline . "," . l:current_line . 's@}@\r}@g'
  silent! execute  a:firstline . "," . l:current_line . 's@{@{\r@g'
  silent! execute  a:firstline . "," . l:current_line . 's@)@\r)@g'
  silent! execute  a:firstline . "," . l:current_line . 's@(@(\r@g'
  silent! execute 'normal!' . a:firstline . 'GV%='
  silent! execute  ':' . a:firstline
  set nohlsearch
endfunction

vnoremap <leader>s, :call DotSplitComma()<cr>

" --- 
nnoremap <silent> <Leader>gf   :vertical botright wincmd F<CR>
