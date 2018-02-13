nnoremap <leader>/ :<C-u>cex system('echo searching...') <bar> GrepperAg<SPACE>
nnoremap K :<C-u>cex system('echo searching...') <bar> let cmd = 'GrepperAg "\b<C-R><C-W>\b"' <bar> call histadd("cmd", cmd) <bar> execute cmd<CR>
