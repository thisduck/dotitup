" Use deoplete.
let g:deoplete#enable_at_startup = 1

let g:deoplete#sources = {}
let g:deoplete#sources._ = ['neosnippet', 'emoji', 'buffer', 'tag']
let deoplete#tag#cache_limit_size = 10000000

imap <expr><TAB>
 \ neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" :
 \ pumvisible() ? "\<C-n>" : "\<TAB>"
