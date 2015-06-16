" ---
" Making ultisnip, ycm and supertab play nice together.

let g:SuperTabDefaultCompletionType = '<C-w>'
" let g:SuperTabCrMapping             = 0

" let g:UltiSnipsExpandTrigger        = '<C-space>'
let g:UltiSnipsJumpForwardTrigger   = '<tab>'
let g:UltiSnipsJumpBackwardTrigger  = '<s-tab>'
let g:UltiSnipsListSnippets         = "<C-h>"

let g:ycm_key_list_select_completion                    = ['<C-n>', '<Down>', '<TAB>']
let g:ycm_key_list_previous_completion                  = ['<C-p>', '<Up>', '<s-tab>']
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_collect_identifiers_from_tags_files           = 1
let g:ycm_seed_identifiers_with_syntax                  = 1
let g:ycm_auto_trigger                                  = 1
let g:ycm_key_invoke_completion = ''
let g:UltiSnipsExpandTrigger="<c-j>"
