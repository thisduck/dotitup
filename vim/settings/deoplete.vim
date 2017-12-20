" Use deoplete.
let g:deoplete#enable_at_startup = 1

inoremap <silent><expr> <C-k>
      \ pumvisible() ? "\<C-p>" : "\<C-k>"

inoremap <silent><expr> <C-j>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<C-j>" :
      \ deoplete#mappings#manual_complete()

" inoremap <silent><expr> <C-c>
"       \ pumvisible() ? "\<C-e>" : "\<C-c>"

function! s:check_back_space() abort "{{{
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction"}}}

let g:deoplete#sources = {}
let g:deoplete#sources._ = ['neosnippet', 'buffer', 'tag']
let deoplete#tag#cache_limit_size = 10000000

let g:neosnippet#snippets_directory='~/.vim/plugged/vim-snippets/snippets,~/.vim/custom/dotitup_snippets'

imap <expr><TAB>
 \ neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" :
 \ pumvisible() ? "\<C-n>" : "\<TAB>"

" imap <expr><TAB>
"   \ neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
