## Editor Settings

Settings that get vim to behave like the editor I'd like it to be.

```vim
set nocompatible " turns vi compatibility off.
```

There's no sense in pretending that 'mouse off' mode is some power move. Sometimes I just want to resize the windows just the way I like and the mouse is a way quicker way of doing that.

```vim
set mouse=a
```

Persistent Undo! I love this feature. You modify a file then save and quit.
When you reopen that file, undo persists! This will save your ass more than once.

```vim
if has('persistent_undo')
  silent !mkdir ~/.dotvim/backups > /dev/null 2>&1
  set undodir=~/.dotvim/backups
  set undofile
endif
```

Sessions in vim store the layout of the windows in vim. If you had 3 horizonal
splits and 2 vertical splits of 4 different files, a session can save that
information. The below configuration saves the layout every time you exit vim,
giving you the option to restore that layout.

This integrates well with the startify plugin, since it displays session.

```vim
fu! SaveSess()
    execute 'NERDTreeClose'
    execute 'mksession! ' . getcwd() . '/session.vim'
endfunction

autocmd VimLeave * call SaveSess()
```

These settings controls how scrolling works.

```vim
set scrolloff=5
set sidescrolloff=15
set sidescroll=1
```

```vim
set visualbell                  " No sounds

" this allows you to open new files in a window without having to save/undo changes in the current file.
set hidden
set autoread                    " Reload files changed outside vim
```

Indenting

```vim
set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab
```

Additional escapes.

```vim
inoremap jk <ESC>
noremap <C-C> <ESC>
xnoremap <C-C> <ESC>

set updatetime=250
set timeoutlen=500
```

We don't want those `.swp` files while we're editing.

```vim
set noswapfile
set nobackup
set nowb
```

Copy to clipboard

```vim
"" copy to clipboard
map <Leader>y "*y
```
