### Search and Grep Files

Shortcuts:

| Instruction  | Description                                                |
| ------------ | ---------------------------------------------------------- |
| `<C-p>`      | fuzzy file search, substitute for CTRL-P.                  |
| `<leader>bs` | fuzzy buffer and most recently used file search.           |
| `<leader>dl` | fuzzy search for the lines in current buffer.              |
| `<leader>he` | fuzzy search for vim help.                                 |
| `<leader>/`  | greps the entire project.                                  |
| `K`          | greps for the word under the curson in the entire project. |

When in the results use:

`C-v` to open the result in a vertical split.  
`C-x` to open the result in a horizontal split.  
`C-t` to open the result in a tab split.

```vim
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
let g:fzf_command_prefix = 'Fzf'


nnoremap <C-t> :<C-u>FzfFiles<CR>
nnoremap <leader>\ :<C-u>FzfRg<Space>
" nnoremap <leader>bs :<C-u>FzfBuffers<CR>
" nnoremap <leader>he :<C-u>FzfHelptags<CR>

" Fzf Search for word under cursor
nnoremap ;; :<C-u>FzfRg \b<C-R><C-W>\b<CR>

imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-l> <plug>(fzf-complete-buffer-line)

nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)
```

### skwp/greplace.vim

From the docs:

1. Use `:Gsearch` to get a buffer window of your search results
2. then you can make the replacements inside the buffer window using traditional tools (%s/foo/bar/)
3. Invoke `:Greplace` to make your changes across all files. It will ask you interatively y/n/a - you can hit 'a' to do all.
4. Save changes to all files with `:wall` (write all)

```vim
Plug 'skwp/greplace.vim'
```

```vim
Plug 'skywind3000/asyncrun.vim'

" real time visualization for search and replace (substitution)
if has('nvim')
  set inccommand=nosplit
else
  Plug 'xtal8/traces.vim'
endif
```

```vim
Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/incsearch-fuzzy.vim'
let g:incsearch#auto_nohlsearch = 1

map z/ <Plug>(incsearch-fuzzy-/)

map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)
```

Visual star search allows you to select some text in visual mode and press `*`
and have vim search for the selected text in the buffer.

```vim
Plug 'nelstrom/vim-visual-star-search'
Plug 'rhysd/clever-f.vim'
```

### Keithbsmiley/investigate.vim

Plugin for looking up documentation.

| Instruction | Description                                                              |
| ----------- | ------------------------------------------------------------------------ |
| `gK`        | over a word or in visual mode, will search for the selected text on Dash |

```vim
Plug 'Keithbsmiley/investigate.vim'
let g:investigate_use_dash=1
let g:investigate_use_url_for_rails=1
```

```vim
set ignorecase
set smartcase
set hlsearch
set incsearch

set modelines=0
set nomodeline
```

I used to use denite for file search, buffer search and other things. I do miss
it from time to time.

```vim
Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'

Plug 'Shougo/neomru.vim'
Plug 'neoclide/denite-git'
```
