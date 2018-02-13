let g:fzf_command_prefix = 'Fzf'

" ctrl-p functionality with fzf (file search)
nnoremap <C-p> :<C-u>FzfFiles<CR>

" buffer search (along with most recently used files)
nnoremap <leader>bs :<C-u>FzfHistory<CR>

" Tag search
nnoremap <leader>. :<C-u>FzfTags<CR>

" fzf search lines in current buffer
nnoremap <leader>l :<C-u>FzfBLines<CR>
