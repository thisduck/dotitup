" let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden
"       \ -p ./.gitignore 
"       \ -p ./.agignore 
"       \ -p ~/.agignore
"       \ --ignore .git
"       \ --ignore .svn
"       \ --ignore .hg
"       \ --ignore .DS_Store
"       \ --ignore "**/*.pyc"
"       \ -g ""'

" let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
" let g:ctrlp_use_caching = 0

nnoremap <silent> <Leader>C :call fzf#run({
\   'source':
\     map(split(globpath(&rtp, "colors/*.vim"), "\n"),
\         "substitute(fnamemodify(v:val, ':t'), '\\..\\{-}$', '', '')"),
\   'sink':    'colo',
\   'options': '+m',
\   'left':    30
\ })<CR>

function! s:buflist()
  redir => ls
  silent ls
  redir END
  return split(ls, '\n')
endfunction

function! s:bufopen(e)
  execute 'buffer' matchstr(a:e, '^[ 0-9]*')
endfunction

nnoremap <silent> <Leader><Enter> :call fzf#run({
\   'source':  reverse(<sid>buflist()),
\   'sink':    function('<sid>bufopen'),
\   'options': '+m',
\   'down':    len(<sid>buflist()) + 2
\ })<CR>

command! -bar FZFTags if !empty(tagfiles()) | call fzf#run({
\   'source': "sed '/^\\!/d;s/\t.*//' " . join(tagfiles()) . ' | uniq',
\   'sink':   'tag',
\ }) | else | echo 'Preparing tags' | call system('ctags -R') | FZFTag | endif

nnoremap <silent> <Leader>ts :silent FZFTags<CR>
nnoremap <silent> <C-p> :silent FZF!<CR>

function! s:ag_handler(lines)
  if len(a:lines) < 2 | return | endif

  let [key, line] = a:lines[0:1]
  let [file, line, col] = split(line, ':')[0:2]
  let cmd = get({'ctrl-x': 'split', 'ctrl-v': 'vertical split', 'ctrl-t': 'tabe'}, key, 'e')
  execute cmd escape(file, ' %#\')
  execute line
  execute 'normal!' col.'|zz'
endfunction

command! -nargs=1 Agf call fzf#run({
\ 'source':  'ag --nogroup --column --color "'.escape(<q-args>, '"\').'"',
\ 'sink*':    function('<sid>ag_handler'),
\ 'options': '--ansi --expect=ctrl-t,ctrl-v,ctrl-x --no-multi --color hl:68,hl+:110',
\ 'down':    '50%'
\ })

