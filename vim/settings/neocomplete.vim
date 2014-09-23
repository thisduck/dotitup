" neocomplete
" Next generation completion framework.

let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_camel_case = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#enable_underbar_case = 1
let g:neocomplete#enable_auto_delimiter = 1
let g:neocomplete#max_list = 20
let g:neocomplete#force_overwrite_completefunc = 1
let g:neocomplete#enable_refresh_always = 1


" Set minimum syntax keyword length.
let g:neocomplete#auto_completion_start_length = 2

" Map standard Ctrl-N completion to TAB after expression
" we'll just default to supertab after this.
inoremap <expr><TAB>  pumvisible() ? "\<C-p>" : "\<TAB>"


inoremap <expr><C-g> neocomplete#undo_completion()
inoremap <expr><C-l> neocomplete#complete_common_string()
inoremap <expr><CR> neocomplete#complete_common_string()

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
  let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

if !exists('g:neocomplete#sources')
    let g:neocomplete#sources = {}
endif
let g:neocomplete#sources._ = ['buffer', 'dictionary', 'tag']


let g:neocomplete#sources#tags#cache_limit_size = 500000000

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete

if !exists('g:neocomplete#same_filetypes')
  let g:neocomplete#same_filetypes = {}
endif
let g:neocomplete#same_filetypes._ = '_'

" supertab compatibility?
let g:SuperTabDefaultCompletionType = "<c-n>"

call neocomplete#initialize()
