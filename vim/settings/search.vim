" use ag as the grepping program if is exists
if executable('ag')
  set grepprg=ag\ --nogroup\ --column\ --smart-case\ --nocolor\ --follow
  set grepformat=%f:%l:%c:%m
endif
  " command -nargs=+ -complete=file -bar Ag silent grep! <args>|cwindow|redraw!

" Search shortcuts

" Ag search <leader>/
nnoremap <leader>/ :<C-u>cex system('echo searching...') <bar> GrepperAg<SPACE>

" Search for word under cursor
nnoremap K :<C-u>cex system('echo searching...') <bar> let cmd = 'GrepperAg "\b<C-R><C-W>\b"' <bar> call histadd("cmd", cmd) <bar> execute cmd<CR>


" Fzf search <leader>\ (note the backslack)
nnoremap <leader>\ :<C-u>FzfAg<SPACE>

" Fzf Search for word under cursor
nnoremap L :<C-u>FzfAg <C-R><C-W><CR>
