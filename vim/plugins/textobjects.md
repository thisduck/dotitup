### michaeljsmith/vim-indent-object
Adds ability to signify text objects by indent.
This is useful for languages like coffeescript and python.
The `v` below is used for example, the object itself is 
signified by what follow the `v`. Other actions like `c`
and `d` will work just as well.
For example:

| Instruction | Description                                                                     |
| ---         | ---                                                                             |
| `vii`       | will visual select everything aligned with indent                               |
| `vai`       | will visual select everything aligned with indent, and the line above           |
| `vaI`       | will visual select everything aligned with indent, and the line above and below |

```vim
Plug 'michaeljsmith/vim-indent-object'
Plug 'bootleq/vim-textobj-rubysymbol'
```

### coderifous/textobj-word-column.vim
Adds ability to signify text objects by 'column'.
This is useful for modifying anything columnar, like the same word on 
multiple lines. Or changing '=>' to ':' over multiple lines.
The `v` below is used for example, the object itself is 
signified by what follow the `v`. Other actions like `c`
and `d` will work just as well.
For example:

| Instruction | Description                                             |
| ---         | ---                                                     |
| `vic`       | will visual select everything aligned in the column     |
| `vac`       | will visual select everything aligned around the column |

After the selection, press `I` to insert (`A` to append, `c` to change)
, and then `<esc>` or `<c-c>` to see the change apply to the rest of the rows.

```vim
Plug 'coderifous/textobj-word-column.vim'
```

### kana/vim-textobj-datetime
Adds ability to signify text objects by date.
The `v` below is used for example, the object itself is 
signified by what follow the `v`. Other actions like `c`
and `d` will work just as well.
For example:

| Instruction | Description                    |
| ---         | ---                            |
| `vida`      | will visual select inside date |
| `vada`      | will visual select around date |

```vim
Plug 'kana/vim-textobj-datetime'
```

### kana/vim-textobj-entire
Use `vae` to select the entire buffer.
`vie` to ignore the blank spaces at the ends.

```vim
Plug 'kana/vim-textobj-entire'
```

```vim
Plug 'kana/vim-textobj-function'
Plug 'kana/vim-textobj-user'
```

### lucapette/vim-textobj-underscore
Adds ability to signify text objects by underscore.
The `v` below is used for example, the object itself is 
signified by what follow the `v`. Other actions like `c`
and `d` will work just as well.
For example:

| Instruction | Description                           |
| ---         | ---                                   |
| `vi_`       | will visual select inside underscores |
| `va_`       | will visual select around underscores |

```vim
Plug 'lucapette/vim-textobj-underscore'
```

### nelstrom/vim-textobj-rubyblock
Adds ability to signify ruby blocks.
The `v` below is used for example, the object itself is 
signified by what follow the `v`. Other actions like `c`
and `d` will work just as well.
For example:

| Instruction | Description                              |
| ---         | ---                                      |
| `vir`       | will visual select inside the ruby block |
| `var`       | will visual select around the ruby block |

```vim
Plug 'nelstrom/vim-textobj-rubyblock'
```

```vim
Plug 'vim-scripts/argtextobj.vim'
```

### nathanaelkane/vim-indent-guides
Adds ability to visually display intent guides
For example:

| Instruction  | Description               |
| ---          | ---                       |
| `<leader>ig` | will toggle indent guides |

```vim
Plug 'nathanaelkane/vim-indent-guides'
let g:indent_guides_auto_colors = 1
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
```
