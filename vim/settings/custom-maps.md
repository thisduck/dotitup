### Custom Shortcuts

| Instruction                 | Description                                                                        |
| ---                         | ---                                                                                |
| `<C-c>`                     | For most purposes a remap to <ESC>                                                 |
| `<leader>y`                 | copy visual selection to clipboard                                                 |
| `<leader>ct`                | will run ctags on the project recursively, using the options in the ~/.ctags file. |
| `<leader><leader>p`         | toggle `:set paste/nopaste` for when you want to paste text from the clipboard     |
| `<leader>>`                 | replace old style ruby hashes with new style                                       |
| `<leader>s,`                | break up a ruby line somewhat sensibly                                             |
| `<leader>gf`                | `gf` in a vertical split                                                           |
| *Window Movement Shortcuts* |                                                                                    |
| `<C-j>`                     | `<C-w>j`                                                                           |
| `<C-k>`                     | `<C-w>k`                                                                           |
| `<C-h>`                     | `<C-w>h`                                                                           |
| `<C-l>`                     | `<C-w>l`                                                                           |
| `<C-w>o`                    | Focus on current window                                                            |
| `<C-w>u`                    | Return to window layout after `<C-w>o`                                             |

```vim
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

"" ---

inoremap <c-c> <ESC>

"" --- Taken from vim-ruby to map <C-]> to g<C-]>

nnoremap <C-]> g<C-]>

"" ---

let g:notes_directories = ['~/Desktop/vim-notes']

set rtp+=~/.dotvim/custom/

"" --- Replace old style ruby hashes with new style
map <Leader>> :s<Home>silent! <End>@:\([^: =({})]\+\)\s*=>\s*@\1: @g<CR> :nohlsearch<CR>

"" --- Break up a long ruby line around commas

function! DotSplitComma()
  let l:first = a:firstline
  silent! execute  ':' . a:firstline
  silent! execute  'normal! O'
  silent! execute  'normal! ma'
  silent! execute  ':' . (a:lastline + 1)
  silent! execute  'normal! o'
  silent! execute  'normal! mb'
  let l:last = line('.')

  silent! execute l:first . "," . l:last . 's@\(.\),\s*\t*\(.\)@\1,\r\2@g'
  let l:last = line('.')
  silent! execute l:first . "," . (l:last + 1).  's@}@\r}@g'
  silent! execute l:first . "," . (l:last + 1). 's@{@{\r@g'
  silent! execute l:first . "," . (l:last + 1).  's@)@\r)@g'
  silent! execute l:first . "," . (l:last + 1). 's@(@(\r@g'
  silent! execute l:first . "," . (l:last + 1).  's@\]@\r]@g'
  silent! execute l:first . "," . (l:last + 1). 's@\[@[\r@g'
  silent! execute  'normal! ''ajvip='
  silent! execute  'normal! ''bdd'
  silent! execute  'normal! ''add'
  set nohlsearch
endfunction

vnoremap <leader>s, :call DotSplitComma()<cr>

" --- 
nnoremap <silent> <Leader>gf   :vertical botright wincmd F<CR>

" ---

nnoremap <C-w>o :mksession! ~/session.vim<CR>:wincmd o<CR>
nnoremap <C-w>u :source ~/session.vim<CR>
```

