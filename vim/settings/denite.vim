" " ---
" " Unite

" Setup j/k navigation.
call denite#custom#map('insert', '<C-j>', '<denite:move_to_next_line>', 'noremap')
call denite#custom#map('insert', '<C-n>', '<denite:move_to_next_line>', 'noremap')
call denite#custom#map('insert', '<C-k>', '<denite:move_to_previous_line>', 'noremap')
call denite#custom#map('insert', '<C-p>', '<denite:move_to_previous_line>', 'noremap')

" Use ag for greppin'
call denite#custom#var('grep', 'command', ['ag'])
call denite#custom#var('grep', 'default_opts',
      \ ['-i', '--vimgrep'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', [])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])

call denite#custom#var('file_rec', 'command',
      \ ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])

nnoremap <C-p> :<C-u>Denite file_rec<CR>

nnoremap <leader>bs :<C-u>Denite buffer file_old <CR>

nnoremap K :<C-u>DeniteCursorWord grep:. -mode=normal<CR>
nnoremap <leader>o :<C-u>Denite outline -mode=normal<CR>
nnoremap <leader>/ :<C-u>Denite grep:. -mode=normal<CR>
nnoremap <leader>./ :<C-u>Denite -resume<CR>
nnoremap <leader>. :<C-u>Denite tag<CR>



" nnoremap <leader>. :<C-u>Unite -no-split -buffer-name=tags -start-insert tag<cr>

" nnoremap <leader>be :Unite -no-split -start-insert -buffer-name=buffers buffer file_mru directory_mru<cr>

" nnoremap <leader>yr :Unite -no-split -buffer-name=yanks history/yank<cr>
" nnoremap <silent> <leader>us :<C-u>Unite -no-split -buffer-name=snippets ultisnips<CR>

" nnoremap <silent> <leader>uh :<C-u>Unite -buffer-name=help help<CR>
" nnoremap <silent> <leader>ul :<C-u>Unite -no-split -start-insert -buffer-name=search_file line<CR>

" nnoremap <leader>/ :<C-u>Unite -no-split -buffer-name=grep grep:.<cr>
" nnoremap K :<C-u>Unite -buffer-name=grep grep:.::<C-r><C-w><CR>
" nnoremap KK :<C-u>Unite -buffer-name=grep grep:.::"\b<C-r><C-w>\b"<CR>
" nnoremap <leader>./ :<C-u>UniteResume grep<CR>

" " Custom mappings for the unite buffer
" autocmd FileType unite call s:unite_settings()
" function! s:unite_settings()
"   let b:SuperTabDisabled=1
"   imap <buffer> <C-j>   <Plug>(unite_select_next_line)
"   imap <buffer> <C-k>   <Plug>(unite_select_previous_line)
"   nmap <buffer> <TAB>   <Plug>(unite_loop_cursor_down)
"   nmap <buffer> <S-TAB> <Plug>(unite_loop_cursor_up)
"   imap <buffer> <Tab>   <Plug>(unite_insert_leave)

"   imap <buffer> <C-c> <Plug>(unite_exit)
"   nmap <buffer> <C-c> <Plug>(unite_exit)

"   imap <buffer> <C-w> <Plug>(unite_delete_backward_word)

"   nmap <buffer> <C-r> <Plug>(unite_redraw)
"   imap <buffer> <C-r> <Plug>(unite_redraw)

"   imap <buffer> <C-p>     <Plug>(unite_toggle_auto_preview)
"   nmap <buffer> <C-p>     <Plug>(unite_toggle_auto_preview)

"   inoremap <silent><buffer><expr> <C-v> unite#do_action('vsplit')
"   nnoremap <silent><buffer><expr> <C-v> unite#do_action('vsplit')
"   inoremap <silent><buffer> <C-s> unite#do_action('split')
"   nnoremap <silent><buffer> <C-s> unite#do_action('split')
" endfunction

" " " Set up some custom ignores
" " call unite#custom_source('file_rec,file_rec/async,file_mru,file,buffer,grep',
" "       \ 'ignore_pattern', join([
" "       \ '\.git/',
" "       \ 'files/',
" "       \ 'log/',
" "       \ 'vendor/cache',
" "       \ 'vendor/gems',
" "       \ 'vendor/rails',
" "       \ 'vim/bundle/',
" "       \ 'vim/sessions/',
" "       \ 'vim/backups/',
" "       \ 'tmp/',
" "       \ '.sass-cache',
" "       \ 'node_modules/',
" "       \ 'bower_components/',
" "       \ 'dist/',
" "       \ '.pyc',
" "       \ '.jpg',
" "       \ '.png',
" "       \ '.gif',
" "       \ '.pdf',
" "       \ '.zip',
" "       \ '.swf',
" "       \ ], '\|'))


