| Instruction                 | Description                                                                        |
| ---                         | ---                                                                                |
| *Window Movement Shortcuts* |                                                                                    |
| `<C-j>`                     | `<C-w>j`                                                                           |
| `<C-k>`                     | `<C-w>k`                                                                           |
| `<C-h>`                     | `<C-w>h`                                                                           |
| `<C-l>`                     | `<C-w>l`                                                                           |
| `<C-w>o`                    | Focus on current window                                                            |
| `<C-w>u`                    | Return to window layout after `<C-w>o`                                             |

```vim
" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" ---

nnoremap <C-w>o :mksession! ~/session.vim<CR>:wincmd o<CR>
nnoremap <C-w>u :source ~/session.vim<CR>
```
