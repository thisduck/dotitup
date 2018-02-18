" ### FZF Helpers
" The FZF commands are prefixed with `Fzf`
" So if you don't find the commands from the FZF docs
" by running them, that is why.
"
" Shortcuts:
" | `<C-p>`      | fuzzy file search, substitute for CTRL-P. `:FzfFiles`          |
" | `<leader>bs` | fuzzy buffer and most recently used file search, `:FzfHistory` |
" | `<leader>.`  | fuzzy tags search, `:FzfTags`                                  |
" | `<leader>l`  | fuzzy search for the lines in current buffer, `:FzfBLines`     |
" | `<leader>he` | fuzzy search for vim help, `:FzfHelptags`                      |
" ###

let g:fzf_command_prefix = 'Fzf'

" ctrl-p functionality with fzf (file search)
nnoremap <C-p> :<C-u>FzfFiles<CR>

" buffer search (along with most recently used files)
nnoremap <leader>bs :<C-u>FzfHistory<CR>

" Tag search
nnoremap <leader>. :<C-u>FzfTags<CR>

" fzf search lines in current buffer
nnoremap <leader>l :<C-u>FzfBLines<CR>

" fzf search help
nnoremap <leader>he :<C-u>FzfHelptags<CR>
