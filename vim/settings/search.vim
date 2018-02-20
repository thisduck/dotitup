" ### Search

" | Instruction        | Description                                                          |
" | ---                | ---                                                                  |
" | *Primary Search*   |                                                                      |
" | `<leader>/`        | search for word(s) in project, results in quickfix                   |
" | `K`                | search for work under cursor in project, results in quickfix         |
" | `<leader>./`       | takes you back to the point where to executed the two above searches |
" | *Secondary Search* |                                                                      |
" | `<leader>\`        | search for word(s) in project, using FZF                             |
" | `L`                | search for work under cursor in project, using FZF                   |
" ###

" use ag as the grepping program if is exists
if executable('ag')
  set grepprg=ag\ --nogroup\ --column\ --smart-case\ --nocolor\ --follow
  set grepformat=%f:%l:%c:%m
endif
" command -nargs=+ -complete=file -bar Ag silent grep! <args>|cwindow|redraw!

" Search shortcuts

" Fzf search <leader>\ (note the backslack)
nnoremap <leader>\ :<C-u>FzfAg<SPACE>

" Fzf Search for word under cursor
nnoremap L :<C-u>FzfAg \b<C-R><C-W>\b<CR>

function! DotGrep(...)
  " set a mark
  silent! execute  'normal! mS'

  let l:query = join(a:000, ' ')
  try
    AsyncStop!
  finally
    copen
    cexpr system("echo loading...")
    while g:asyncrun_status == "running"
      sleep 100m
    endwhile
    let l:eformat = &errorformat
    let &errorformat = '%f:%l:%c:%m'
    let l:search_query = 'ag --vimgrep ' . l:query
    exec 'AsyncRun! ag --vimgrep ' . l:query
    " cexpr system('echo ' . l:search_query)
    let &errorformat = l:eformat
  endtry
endfunction
command! -nargs=+ -complete=file -bar DotGrep silent call DotGrep(<q-args>)

" DotGrep search <leader>/
nnoremap <leader>/ :<C-u>DotGrep<SPACE>''<LEFT>

" takes you back to the point where you started your search
nnoremap <leader>./ :normal! 'S<CR>

" Search for word under cursor
nnoremap K :<C-u>let cmd = 'DotGrep -w ''<C-R><C-W>''' <bar> call histadd("cmd", cmd) <bar> execute cmd<CR>
