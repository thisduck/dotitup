### easymotion/vim-easymotion

Issuing an easymotion shortcut will highlight words/lines with keys
from the keyboard. when you press those keys, it will take you 
to that word or line. you have to try it.

If you're thinking in vim motions (such as `fe`, which would go to next 
occurence of the letter `e`), then the motion can be combined with an action.
Like `dte` will delete everything till the letter `e`. Similarly `d<leader>w`
combined with the motion will delete till the word you choose.

| Instruction            | Description                                   |
| ---                    | ---                                           |
| `<leader>w`            | will highlight words after the cursor         |
| `<leader><leader>w`    | will highlight all words even across windows  |
| `<leader>b`            | will highlight words before the cursor        |
| `<leader>j`            | will highlight lines after the cursor         |
| `<leader><leader>j`    | will highlight all lines even across windows  |
| `<leader>k`            | will highlight lines before the cursor        |
| `<leader>ge`           | will highlight end of words before the cursor |
| `<leader>e`            | will highlight end of words after the cursor  |
| `<leader>s[character]` | will highlight `[character]` across windows   |

```vim
Plug 'easymotion/vim-easymotion'
map <Leader> <Plug>(easymotion-prefix)
nmap <Leader><Leader>w <Plug>(easymotion-overwin-w)
nmap <Leader><Leader>j <Plug>(easymotion-overwin-line)

map <Leader>s <Plug>(easymotion-bd-f)
nmap <Leader>s <Plug>(easymotion-overwin-f)
```
