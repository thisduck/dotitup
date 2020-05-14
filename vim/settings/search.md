### Search

| Instruction        | Description                                                                               |
| ---                | ---                                                                                       |
| *Primary Search*   |                                                                                           |
| `<leader>/`        | search for word(s) in project                                                             |
| `K`                | search for work under cursor in project                                                   |
|                    | use `<C-j>` and `<C-k>` to navigate the results `j`/`k` work also. `<CR>` to go to result |
|                    | `]/` and `[/` will take you to prev and next results                                      |
| `<leader>./`       | takes you back to the search listing                                                      |
| *Secondary Search* |                                                                                           |
| `<leader>\`        | search for word(s) in project, using FZF                                                  |
| `L`                | search for work under cursor in project, using FZF                                        |

```vim
" use ag as the grepping program if is exists
if executable('ag')
  set grepprg=ag\ --nogroup\ --column\ --smart-case\ --nocolor\ --follow
  set grepformat=%f:%l:%c:%m
endif
" command -nargs=+ -complete=file -bar Ag silent grep! <args>|cwindow|redraw!

" Search shortcuts

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

```

```vim
" Change file/rec command.
call denite#custom#var('file/rec', 'command',
\ ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])

" Ripgrep command on grep source
call denite#custom#var('grep', {
\ 'command': ['rg'],
\ 'default_opts': ['-i', '--vimgrep', '--no-heading'],
\ 'recursive_opts': [],
\ 'pattern_opt': ['--regexp'],
\ 'separator': ['--'],
\ 'final_opts': [],
\ })

autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
  nnoremap <silent><buffer><expr> <CR>
  \ denite#do_map('do_action')
  nnoremap <silent><buffer><expr> d
  \ denite#do_map('do_action', 'delete')
  nnoremap <silent><buffer><expr> p
  \ denite#do_map('do_action', 'preview')
  nnoremap <silent><buffer><expr> q
  \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> i
  \ denite#do_map('open_filter_buffer')
  nnoremap <silent><buffer><expr> <Space>
  \ denite#do_map('toggle_select').'j'
  nnoremap <silent><buffer><expr> <C-c>
  \ denite#do_map('quit')
  nnoremap <silent><buffer> <C-j> j
  nnoremap <silent><buffer> <C-k> k
endfunction

	autocmd FileType denite-filter call s:denite_filter_my_settings()
	function! s:denite_filter_my_settings() abort
	  inoremap <silent><buffer> <C-j> <Esc>
	        \:call denite#move_to_parent()<CR>
	        \:call cursor(line('.')+1,0)<CR>
	        \:call denite#move_to_filter()<CR>A
	  inoremap <silent><buffer> <C-k> <Esc>
	        \:call denite#move_to_parent()<CR>
	        \:call cursor(line('.')-1,0)<CR>
	        \:call denite#move_to_filter()<CR>A
    imap <silent><buffer> <CR> <Esc>
      \:call denite#move_to_parent()<CR><CR>

    inoremap <silent><buffer><expr> <C-p>
    \ denite#do_map('do_action', 'preview')
    imap <silent><buffer> <C-c> <Plug>(denite_filter_quit)q
    imap <silent><buffer> <C-o> <Plug>(denite_filter_quit)
	endfunction

	autocmd User denite-preview call s:denite_preview()
	function! s:denite_preview() abort
    doautocmd BufReadPost " so we can get syntax highlighting
	endfunction


call denite#custom#option('_', {
      \ 'winminheight': '10',
      \ 'vertical_preview': '10',
      \ 'preview_width': '75',
      \ 'preview_height': '50',
      \ 'filter_updatetime': '200',
      \ 'filter_split_direction': 'floating',
      \ 'prompt': '>',
      \ })

nnoremap <C-p> :<C-u>Denite file/rec -start-filter -filter-updatetime=100 -match-highlight<CR>

nnoremap K :<C-u>DeniteCursorWord grep:. -auto-action=preview<CR>
nnoremap <Leader>/ :<C-u>Denite grep:.  -auto-action=preview<CR>
nnoremap <Leader>bs :<C-u>Denite buffer file_mru  -auto-action=preview<CR>
nnoremap <Leader>he :<C-u>Denite help -start-filter -auto-action=preview<CR>

nnoremap <Leader>./ :<C-u>Denite -resume<CR>
nnoremap [/ :<C-u>Denite -resume -cursor-pos=-1 -immediately -empty<CR>
nnoremap ]/ :<C-u>Denite -resume -cursor-pos=+1 -immediately -empty<CR>
```
