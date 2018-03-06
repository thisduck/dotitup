" ### AndrewRadev/splitjoin.vim
" Useful to join/split arrays, html blocks, if statements, ruby blocks, etc.
"
" | Instruction | Description                                           |
" | ---         | ---                                                   |
" | `gS`        | splits line smartly                                   |
" | `gJ`        | joins lines smartly, when done on first line of block |
" ###
Plug 'AndrewRadev/splitjoin.vim'

" Plug 'kana/vim-smartinput'

" provides autocomplete
Plug 'Shougo/deoplete.nvim'
if !has('nvim')
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

Plug 'Shougo/neoinclude.vim'
Plug 'fszymanski/deoplete-emoji'
let g:deoplete#enable_at_startup = 1

let g:deoplete#sources = {}
let g:deoplete#sources._ = ['neosnippet', 'emoji', 'file', 'buffer', 'tag']
let deoplete#tag#cache_limit_size = 10000000

imap <expr><TAB>
 \ neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" :
 \ pumvisible() ? "\<C-n>" : "\<TAB>"

Plug 'junegunn/vim-emoji'
nnoremap <leader>emo :<C-u>%s/:\([^:]\+\):/\=emoji#for(submatch(1), submatch(0))/g<CR>

" Plug 'briandoll/change-inside-surroundings.vim'

" ### tpope/vim-commentary
"
" | Instruction  | Description                            |
" | ---          | ---                                    |
" | `gcc`        | comments in/out a line                 |
" | `gc[object]` | comments in/out an object, e.g. `gcap` |
" | `gc`         | comments in/out in visual mode         |
" ###
Plug 'tpope/vim-commentary'

" ### tpope/vim-abolish
" Just read the docs for this one:
" https://github.com/tpope/vim-abolish
" ###
Plug 'tpope/vim-abolish'

" ### tpope/vim-surround
" Adds the ability to change surrounding quotes/tags.
"
" For example `'something'` and change to `"something"`
" with the cursor over the word: `cs'"`
" Which says: change surrounding single quotes to double quotes.
"
" It works for tags as well, so for `"something"`,
" `cs"<b>` will change it to `<b>something</b>`.
" And then to change that to `'something'`, do `cst'`
" Which says: change surrounding tag to single quotes.
"
" You can also add surrounding characters to text objects 
" that have none. So for `something`, `ysaw'`
" Which says: add surrounding around word to single quotes.
" That's not proper English but you get the gist.
"
" See vim-surround readme for more.
" ###
Plug 'tpope/vim-surround'

" ### tpope/vim-unimpaired
" Adds handy shortcuts for useful vim commands
" using `[` for previous and `]` for next
"
" | Instruction   | Description                                                   |
" | ---           | ---                                                           |
" | `[q` and `]q` | for `:cnext` and `:cprev` (navigating quickfix)               |
" | `[b` and `]b` | for `:bnext` and `:bprev` (navigating buffers)                |
" | `[f` and `]f` | for prev/next file in directory (navigating files)            |
" | `[f` and `]f` | for prev/next file in directory (navigating files)            |
" | `[n` and `]n` | for prev/next git conflict in the file (navigating conflicts) |
"
" There are many more helpful shortcuts, see `:help unimpaired`
" ###
Plug 'tpope/vim-unimpaired'

" ### terryma/vim-multiple-cursors
" Adds multiple cursor editing support
" Use `<C-n>` to highlight the word under the cursor
" Repeat `<C-n>` to select the next instances of the word
" Then you can use normal editing comments, like `c` to change
" all the selected words together.
"
" There are ways to use with visual selections as well, see docs.
" ###
Plug 'terryma/vim-multiple-cursors'

" ### bogado/file-line
" Allows the ability to enter a file exactly at it's line.
" e.g. on the command line if you started vim like:
" `vim part/to/file.rb:35`
" it will take you to line 35 of file.rb
" Can also be used with opening files normally in vim:
" `:e part/to/file.rb:35`
" Would also take you to like 35 of file.rb
"
" This is great for copy pasting file + line number from 
" error outputs and going directly to the source instead
" of additionally finding the line after opening the file.
" ###
Plug 'bogado/file-line'

" ### vim-scripts/camelcasemotion
" Adds motion helpers to move through camelcase words.
"
" | Instruction | Description                             |
" | ---         | ---                                     |
" | `,w`        | equivalent of `w` for camel case motion |
" | `,b`        | equivalent of `b` for camel case motion |
" | `,e`        | equivalent of `e` for camel case motion |
" ###
Plug 'vim-scripts/camelcasemotion'


" ### Keithbsmiley/investigate.vim
" Plugin for looking up documentation.
"
" | Instruction | Description                                                              |
" | ---         | ---                                                                      |
" | `gK`        | over a word or in visual mode, will search for the selected text on Dash |
" ###
Plug 'Keithbsmiley/investigate.vim'
let g:investigate_use_dash=1
let g:investigate_use_url_for_rails=1

" Misc/Utilities
Plug 'tpope/vim-endwise'
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

Plug 'Konfekt/FastFold'
Plug 'jiangmiao/auto-pairs'
