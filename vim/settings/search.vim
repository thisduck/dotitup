" ### Search

" | Instruction        | Description                                                                               |
" | ---                | ---                                                                                       |
" | *Primary Search*   |                                                                                           |
" | `<leader>/`        | search for word(s) in project                                                             |
" | `K`                | search for work under cursor in project                                                   |
" |                    | use `<C-j>` and `<C-k>` to navigate the results `j`/`k` work also. `<CR>` to go to result |
" |                    | `]/` and `[/` will take you to prev and next results                                      |
" | `<leader>./`       | takes you back to the search listing                                                      |
" | *Secondary Search* |                                                                                           |
" | `<leader>\`        | search for word(s) in project, using FZF                                                  |
" | `L`                | search for work under cursor in project, using FZF                                        |
" ###

" use ag as the grepping program if is exists
if executable('ag')
  set grepprg=ag\ --nogroup\ --column\ --smart-case\ --nocolor\ --follow
  set grepformat=%f:%l:%c:%m
endif
" command -nargs=+ -complete=file -bar Ag silent grep! <args>|cwindow|redraw!

" Search shortcuts

" Fzf search <leader>\ (note the backslash)
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
nnoremap <leader>/ :<C-u>Leaderf! rg -e 

" takes you back to the point where you started your search
nnoremap <leader>./ :<C-U>Leaderf! rg --recall<CR>

" Search for word under cursor
nnoremap K :<C-U><C-R>=printf("Leaderf! rg -e %s ", expand("<cword>"))<CR><CR>

" nnoremap ]/ :<C-u>Leaderf --next<CR>
" nnoremap [/ :<C-u>Leaderf --previous<CR>
