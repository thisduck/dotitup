" ---
" Making ultisnip, ycm and supertab play nice together. 

let g:SuperTabDefaultCompletionType = '<C-l>'
let g:SuperTabCrMapping             = 0

let g:UltiSnipsExpandTrigger        = '<tab>'
let g:UltiSnipsJumpForwardTrigger   = '<tab>'
let g:UltiSnipsJumpBackwardTrigger  = '<s-tab>'
let g:UltiSnipsListSnippets         = "<C-e>"

let g:ycm_key_list_select_completion                    = ['<C-j>', '<C-n>', '<Down>']
let g:ycm_key_list_previous_completion                  = ['<C-k>', '<C-p>', '<Up>']
let g:ycm_register_as_syntastic_checker                 = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_collect_identifiers_from_tags_files           = 1
let g:ycm_seed_identifiers_with_syntax                  = 1
let g:ycm_semantic_triggers                             = {}


