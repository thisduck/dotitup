let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden
      \ -p ./.gitignore 
      \ -p ./.agignore 
      \ -p ~/.agignore
      \ --ignore .git
      \ --ignore .svn
      \ --ignore .hg
      \ --ignore .DS_Store
      \ --ignore "**/*.pyc"
      \ -g ""'

let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
let g:ctrlp_use_caching = 0

