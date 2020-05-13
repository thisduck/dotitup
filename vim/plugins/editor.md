## Editor Plugins

### mhinz/vim-startify

Let's start with startify. It shows most recently used files and sessions in the
project and overall.

```vim
Plug 'mhinz/vim-startify'
let g:startify_change_to_vcs_root = 1
let g:startify_list_order = [
  \ ['   Most Recent Project Files'],
  \ 'dir',
  \ ['   Most Recent Files'],
  \ 'files',
  \ ['   Sessions:'],
  \ 'sessions',
  \ ['   Bookmarks:'],
  \ 'bookmarks',
  \ ['   Commands:'],
  \ 'commands',
  \ ]
```

### simnalamburt/vim-mundo

Magic undo functionality. This plugin will open an undo window that will display
the changes you've made to the file in a git commit style. It will show all the
diffs. Amazingly, it stores an undo tree. So even if you did and undo, and typed
something by mistake, you don't lose your undo chain. You can revert to any
state of the file.

```vim
Plug 'simnalamburt/vim-mundo'
nnoremap <leader>u :MundoToggle<CR>
```

File tree navigation

### scrooloose/nerdtree

| Instruction                      | Description                                            |
| ---                              | ---                                                    |
| `:NERDTreeToggle` / `<leader>nt` | toggle the NERDTree drawer                             |
| `:NERDTreeFind` / `<leader>nf`   | find current file in NERDTree                          |
| while in NERDTree                |                                                        |
| `m` while on file                | to see a menu (allows you to add/remove/rename dirs)   |
| `i` while on file                | opens file in a split                                  |
| `gi` while on file               | opens file in a split keep cursor in nerdtree          |
| `s` while on file                | opens file in a vertical split                         |
| `gs` while on file               | opens file in a vertical split keep cursor in nerdtree |
| `R`                              | refresh the file listing to show any changes           |
| `?`                              | for help                                               |

```vim
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin' " shows git changes
Plug 'tiagofumo/vim-nerdtree-syntax-highlight' " shows nice icons
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeShowHidden=1
let g:NERDTreeWinSize = 30
map <Leader>nt :NERDTreeToggle<CR>
map <Leader>nf :NERDTreeFind<CR>
```

### tpope/vim-commentary

| Instruction  | Description                            |
| ---          | ---                                    |
| `gcc`        | comments in/out a line                 |
| `gc[object]` | comments in/out an object, e.g. `gcap` |
| `gc`         | comments in/out in visual mode         |
###

```vim
Plug 'tpope/vim-commentary'
```

### tpope/vim-surround
Adds the ability to change surrounding quotes/tags.

For example `'something'` and change to `"something"`
with the cursor over the word: `cs'"`
Which says: change surrounding single quotes to double quotes.

It works for tags as well, so for `"something"`,
`cs"<b>` will change it to `<b>something</b>`.
And then to change that to `'something'`, do `cst'`
Which says: change surrounding tag to single quotes.

You can also add surrounding characters to text objects 
that have none. So for `something`, `ysaw'`
Which says: add surrounding around word to single quotes.
That's not proper English but you get the gist.

See vim-surround readme for more.

```vim
Plug 'tpope/vim-surround'
```

### tpope/vim-unimpaired
Adds handy shortcuts for useful vim commands
using `[` for previous and `]` for next

| Instruction   | Description                                                   |
| ---           | ---                                                           |
| `[q` and `]q` | for `:cnext` and `:cprev` (navigating quickfix)               |
| `[b` and `]b` | for `:bnext` and `:bprev` (navigating buffers)                |
| `[f` and `]f` | for prev/next file in directory (navigating files)            |
| `[f` and `]f` | for prev/next file in directory (navigating files)            |
| `[n` and `]n` | for prev/next git conflict in the file (navigating conflicts) |

There are many more helpful shortcuts, see `:help unimpaired`

```vim
Plug 'tpope/vim-unimpaired'
```


### tpope/vim-sensible

Some sensible settings from Tim.

```vim
" -- Tim for Pope.
Plug 'tpope/vim-sensible'
```

### tpope/vim-eunuch

| Instruction  | Description                                                            |
| ---          | ---                                                                    |
| `:Delete`    | Delete a buffer and the file on disk simultaneously.                   |
| `:Unlink`    | Like `:Delete`, but keeps the now empty buffer.                        |
| `:Move`      | Rename a buffer and the file on disk simultaneously.                   |
| `:Rename`    | Like `:Move`, but relative to the current file's containing directory. |
| `:Chmod`     | Change the permissions of the current file.                            |
| `:Mkdir`     | Create a directory, defaulting to the parent of the current file.      |
| `:Find`      | Run `find` and load the results into the quickfix list.                |
| `:Locate`    | Run `locate` and load the results into the quickfix list.              |
| `:Wall`      | Write every open window.  Handy for kicking off tools like [guard][].  |
| `:SudoWrite` | Write a privileged file with `sudo`.                                   |
| `:SudoEdit`  | Edit a privileged file with `sudo`.                                    |

```vim
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-rsi'
```

### junegunn/vim-easy-align
Allows for easy alignment of text

In this case, highlight the related lines and press `ga:`
`ga` activates the easy-align plugin, and 
then `:` tells it to align on the `:` character.

Probably best to visit https://github.com/junegunn/vim-easy-align for full usage.

```vim
Plug 'junegunn/vim-easy-align'
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
```

### terryma/vim-multiple-cursors
Adds multiple cursor editing support
Use `<C-n>` to highlight the word under the cursor
Repeat `<C-n>` to select the next instances of the word
Then you can use normal editing comments, like `c` to change
all the selected words together.

There are ways to use with visual selections as well, see docs.

```vim
Plug 'terryma/vim-multiple-cursors'
let g:multi_cursor_quit_key            = '<C-c>'
```

### bogado/file-line
Allows the ability to enter a file exactly at it's line.
e.g. on the command line if you started vim like:
`vim part/to/file.rb:35`
it will take you to line 35 of file.rb
Can also be used with opening files normally in vim:
`:e part/to/file.rb:35`
Would also take you to like 35 of file.rb

This is great for copy pasting file + line number from 
error outputs and going directly to the source instead
of additionally finding the line after opening the file.

```vim
Plug 'bogado/file-line'
```

### simeji/winresizer
Plugin for resizing/moving windows.

| Instruction | Description                                                                            |
| ---         | ---                                                                                    |
| `<C-w>e`    | Enters resizing mode                                                                   |
|             | Once in resizing mode you can resize the current window by `h` `j` `k` `l`             |
|             | `q` to exit resize mode, and cancel any changes                                        |
|             | `<CR>` to exit resize mode, and keep any changes                                       |
|             | `e` will change the mode to move window mode, and `h` `j` `k` `l` will move the window |

```vim
Plug 'simeji/winresizer'
```

### AndrewRadev/splitjoin.vim
Useful to join/split arrays, html blocks, if statements, ruby blocks, etc.

| Instruction | Description                                           |
| ---         | ---                                                   |
| `gS`        | splits line smartly                                   |
| `gJ`        | joins lines smartly, when done on first line of block |

```vim
Plug 'AndrewRadev/splitjoin.vim'
```

### suan/vim-instant-markdown
Allows realtime preview of markdown (and some other) files

| Instruction                   | Description                              |
| ---                           | ---                                      |
| `:InstantMarkdownPreview` or `<leader>md` | opens current markdown buffer in browser |

```vim
Plug 'suan/vim-instant-markdown', {'for': 'markdown'}
let g:instant_markdown_autostart = 0
nnoremap <silent> <leader>md :InstantMarkdownPreview<CR>
```

Automatically run ctags on projects.

```vim
Plug 'ludovicchabant/vim-gutentags'

" finds project root (usually a .git folder)
Plug 'airblade/vim-rooter'
```

Highlight yanked text. Try it. You'll never again be confused about what you
yanked.

```vim
Plug 'machakann/vim-highlightedyank'

Plug 'junegunn/vim-peekaboo'
```

Snippets

```vim
" Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
```

```vim
Plug 'alvan/vim-closetag'
let g:closetag_filenames = '*.htm,*.html,*.xhtml,*.phtml,*.hbs,*.jsx'
let g:closetag_filetypes = 'html,xhtml,phtml'
```

```vim
" Misc/Utilities
" Plug 'tpope/vim-endwise'
Plug 'tpope/vim-ragtag'
Plug 'tpope/vim-repeat'
Plug 'vim-scripts/matchit.zip'
Plug 'chrisbra/NrrwRgn'
Plug 'vim-scripts/AutoTag'
Plug 'vim-scripts/lastpos.vim'

" Plug 'vim-scripts/sudo.vim'
" Plug 'goldfeld/ctrlr.vim'
" Plug 'sjl/gundo.vim'
" Plug 'vim-scripts/AnsiEsc.vim'

Plug 'jiangmiao/auto-pairs'
```
