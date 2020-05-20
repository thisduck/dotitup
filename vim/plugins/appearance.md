# Appearance Plugins

### 'vim-airline'

vim-airline displays the statusbar at the bottom on the windows with much useful
information, if one cares to observe.

vim-devicons adds the pretty icons.

```vim
Plug 'vim-airline/vim-airline'
let g:airline_powerline_fonts = 1
Plug 'vim-airline/vim-airline-themes'
```

### 'chrisbra/Colorizer'

This plugin makes textual colour representations appear in the colour they
represent. It works with the following formats:

- green
- #FF0000
- rgb(200,200,200)
- hsl(100, 100%, 30%)
- hsla(0, 100%, 50%, 0.3);

```vim
Plug 'chrisbra/Colorizer'
let g:colorizer_auto_filetype='css,html,sass,scss'
```

### 'sheerun/vim-polyglot'

Instead of running around including syntax coverage plugins for all sorts of
languages, this plugins does the job for us.

```vim
" syntax highlighting for multiple languages
" let g:polyglot_disabled = ['markdown']
Plug 'sheerun/vim-polyglot'

" let g:markdown_fenced_languages = ['html', 'python', 'ruby', 'vim', 'bash=sh']
"
" Plug 'tpope/vim-markdown'
```

### Themes

The following are an assortment of themes. I've come to realize that not all of
them cover enough tokens in the languages that I care about.
flazz/vim-colorschemes seems to have enough themes which good coverage.

```vim
" Themes
Plug 'altercation/vim-colors-solarized'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'flazz/vim-colorschemes'
Plug 'chriskempson/base16-vim'

" allows us to make a random theme switcher
Plug 'xolox/vim-colorscheme-switcher'
Plug 'xolox/vim-misc'
```

```vim
Plug 'Keithbsmiley/tmux.vim'
Plug 'edkolev/tmuxline.vim'
```
