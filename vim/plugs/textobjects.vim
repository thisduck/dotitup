
" ### michaeljsmith/vim-indent-object
" Adds ability to signify text objects by indent.
" This is useful for languages like coffeescript and python.
" The `v` below is used for example, the object itself is 
" signified by what follow the `v`.
" For example:
" | `vii` | with will visual select everything aligned with indent |
" | `vai` | will visual select everything aligned with indent, and the line above |
" | `vaI` | will visual select everything aligned with indent, and the line above and below|
" ###
Plug 'michaeljsmith/vim-indent-object'
Plug 'bootleq/vim-textobj-rubysymbol'

" ### coderifous/textobj-word-column.vim
" Adds ability to signify text objects by 'column'.
" This is useful for modifying anything columnar, like the same word on 
" multiple lines. Or changing '=>' to ':' over multiple lines.
" The `v` below is used for example, the object itself is 
" signified by what follow the `v`.
" For example:
" | `vic` | with will visual select everything aligned in the column |
" | `vac` | will visual select everything aligned around the column |
" After the selection, press `I` to insert (`A` to append, `c` to change)
" , and then `<esc>` or `<c-c>` " to see the change 
" apply to the rest of the rows.
" ###
Plug 'coderifous/textobj-word-column.vim'

Plug 'kana/vim-textobj-datetime'
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-function'
Plug 'kana/vim-textobj-user'
Plug 'lucapette/vim-textobj-underscore'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'thinca/vim-textobj-function-javascript'
Plug 'vim-scripts/argtextobj.vim'
