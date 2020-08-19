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

command! -bang -nargs=* FzfRg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, {'options': '--delimiter : --nth 4..'}, <bang>0) 
nnoremap <leader>/ :<C-u>FzfRg<Space>

nnoremap <C-p> :<C-u>FzfFiles<CR>
nnoremap <leader>bs :<C-u>FzfBuffers<CR>
nnoremap <leader>he :<C-u>FzfHelptags<CR>
nnoremap <silent><Leader>' :FzfMarks<CR>

" Fzf Search for word under cursor
nnoremap <silent>K :<C-u>FzfRg \b<C-R><C-W>\b<CR>

imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-l> <plug>(fzf-complete-buffer-line)

nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

function! s:build_quickfix_list(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  copen
  cc
endfunction

let g:fzf_action = {
  \ 'ctrl-q': function('s:build_quickfix_list'),
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

let $FZF_DEFAULT_OPTS = '--bind ctrl-a:select-all'
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
nnoremap // :<C-u>nohlsearch<CR>
```
