" Use deoplete.
let g:deoplete#enable_at_startup = 1

inoremap <silent><expr> <S-TAB>
      \ pumvisible() ? "\<C-p>" : "\<S-TAB>"
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ deoplete#mappings#manual_complete()
function! s:check_back_space() abort "{{{
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction"}}}

let g:deoplete#sources = {}
let g:deoplete#sources._ = ['neosnippet', 'buffer', 'tag']
let deoplete#tag#cache_limit_size = 10000000

let g:neosnippet#snippets_directory='~/.vim/plugged/vim-snippets/snippets,~/.vim/custom/dotitup_snippets'
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
imap <expr><SPACE> neosnippet#expandable_or_jumpable() ?
      \ "\<Plug>(neosnippet_expand_or_jump)" : "\<SPACE>"
