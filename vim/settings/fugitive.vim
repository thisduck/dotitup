nnoremap <silent> <Leader>dg :diffget<CR>
nnoremap <silent> <Leader>dp :diffput<CR>

nnoremap <silent> <leader>gs :Gstatus<CR>
nnoremap <silent> <leader>gd :Gvdiff<CR> " always split vertically
nnoremap <silent> <leader>gc :Gcommit<CR>
nnoremap <silent> <leader>gb :Gblame<CR>
nnoremap <silent> <leader>gl :Glog<CR>
nnoremap <silent> <leader>gp :Git push<CR>
nnoremap <silent> <leader>gw :Gwrite<CR> " adds the current file
nnoremap <silent> <leader>ga :Gwrite<CR> " to make it feel like git add
nnoremap <silent> <leader>gr :Gremove<CR>

" autocmd BufReadPost fugitive://* set bufhidden=delete
