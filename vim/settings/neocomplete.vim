" " ---
" " Making ultisnip, ycm and supertab play nice together. 

" let g:UltiSnipsExpandTrigger        = '<tab>'
" let g:UltiSnipsJumpForwardTrigger   = '<tab>'
" let g:UltiSnipsJumpBackwardTrigger  = '<s-tab>'
" let g:UltiSnipsListSnippets         = '<C-h>'

" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 0
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Use camel case completion.
let g:neocomplete#enable_camel_case_completion = 1
" Use underbar completion.
let g:neocomplete#enable_underbar_completion = 1
" Set minimum syntax keyword length.
let g:neocomplete#min_syntax_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
