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
nnoremap <leader>/ :<C-u>DeniteProjectDir grep -mode=normal<CR>

" takes you back to the point where you started your search
nnoremap <leader>./ :<C-u>Denite -resume<CR>

" Search for word under cursor
nnoremap K :<C-u>Denite grep::-w:<C-r><C-w> -mode=normal<CR>


" denite
call denite#custom#var('file_rec', 'command',
      \ ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])

" if has('nvim')
"   call denite#custom#source('file_rec,grep', 'matchers',
"         \ ['matcher_cpsm'])
" endif
call denite#custom#map('insert', '<C-r>',
      \ '<denite:toggle_matchers:matcher_substring>', 'noremap')
call denite#custom#map('insert', '<C-s>',
      \ '<denite:toggle_sorters:sorter_reverse>', 'noremap')

call denite#custom#map('insert', '<C-j>',
      \ '<denite:move_to_next_line>', 'noremap')
call denite#custom#map('normal', '/',
      \ 'i', 'noremap')
call denite#custom#map('insert', '<C-k>',
      \ '<denite:move_to_previous_line>', 'noremap')
call denite#custom#map('insert', "'",
      \ '<denite:move_to_next_line>', 'noremap')

call denite#custom#map('normal', 'r',
      \ '<denite:do_action:quickfix>', 'noremap')

call denite#custom#alias('source', 'file_rec/git', 'file_rec')
call denite#custom#var('file_rec/git', 'command',
      \ ['git', 'ls-files', '-co', '--exclude-standard'])

call denite#custom#var('grep', 'command', ['ag'])
call denite#custom#var('grep', 'default_opts',
      \ ['-i', '--vimgrep'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', [])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])

call denite#custom#var('outline', 'options', ['-u'])

call denite#custom#option('default', {
            \ 'auto_resize': 1,
            \ 'statusline': 0,
            \ 'winheight': 15,
            \ 'updatetime': 100,
            \ 'prompt': '❯',
            \ 'prompt_highlight': 'Function',
            \ 'highlight_matched_char': 'Function',
            \ 'highlight_matched_range': 'Normal',
            \ 'highlight_mode_insert': 'WildMenu'
            \ })

nnoremap ]/ :<C-u>:Denite -resume -select=+1 -immediately<CR>
nnoremap [/ :<C-u>:Denite -resume -select=-1 -immediately<CR>
