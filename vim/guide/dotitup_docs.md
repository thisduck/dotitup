### Search

| Instruction        | Description                                                                               |
| ---                | ---                                                                                       |
| *Primary Search*   |                                                                                           |
| `<leader>/`        | search for word(s) in project                                                             |
| `K`                | search for work under cursor in project                                                   |
|                    | use `<C-j>` and `<C-k>` to navigate the results `j`/`k` work also. `<CR>` to go to result |
|                    | `]/` and `[/` will take you to prev and next results                                      |
| `<leader>./`       | takes you back to the search listing                                                      |
| *Secondary Search* |                                                                                           |
| `<leader>\`        | search for word(s) in project, using FZF                                                  |
| `L`                | search for work under cursor in project, using FZF                                        |
###

### Async Command Execution
Additional helper for the asyncrun.vim plugin
`:AsyncOpenRun ls -l` for example will open
the quickfix window and then asyncronously run
`ls -l` and put the results in the quickfix window.
###

### Custom Shortcuts

| Instruction                 | Description                                                                        |
| ---                         | ---                                                                                |
| `<C-c>`                     | For most purposes a remap to <ESC>                                                 |
| `<leader>y`                 | copy visual selection to clipboard                                                 |
| `<leader>ct`                | will run ctags on the project recursively, using the options in the ~/.ctags file. |
| `<leader><leader>p`         | toggle `:set paste/nopaste` for when you want to paste text from the clipboard     |
| `<leader>>`                 | replace old style ruby hashes with new style                                       |
| `<leader>s,`                | break up a ruby line somewhat sensibly                                             |
| `<leader>gf`                | `gf` in a vertical split                                                           |
| *Window Movement Shortcuts* |                                                                                    |
| `<C-j>`                     | `<C-w>j`                                                                           |
| `<C-k>`                     | `<C-w>k`                                                                           |
| `<C-h>`                     | `<C-w>h`                                                                           |
| `<C-l>`                     | `<C-w>l`                                                                           |
| `<C-w>o`                    | Focus on current window                                                            |
| `<C-w>u`                    | Return to window layout after `<C-w>o`                                             |
###

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
###

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
###

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
###

### kana/vim-textobj-entire
Use `vae` to select the entire buffer.
`vie` to ignore the black spaces at the ends.
###

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
###

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
###

### nathanaelkane/vim-indent-guides
Adds ability to visually display intent guides
For example:

| Instruction  | Description               |
| ---          | ---                       |
| `<leader>ig` | will toggle indent guides |
###

### skwp/greplace.vim
From the docs:
1. Use `:Gsearch` to get a buffer window of your search results
2. then you can make the replacements inside the buffer window using traditional tools (%s/foo/bar/)
3. Invoke `:Greplace` to make your changes across all files. It will ask you interatively y/n/a - you can hit 'a' to do all.
4. Save changes to all files with `:wall` (write all)
###

### Lokaltog/vim-easymotion
issuing an easymotion shortcut will highlight words/lines with keys
from the keyboard. when you press those keys, it will take you 
to that word or line. you have to try it.

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
###

### Shougo/denite.nvim
Shortcuts:

| Instruction  | Description                                      |
| ---          | ---                                              |
| `<C-p>`      | fuzzy file search, substitute for CTRL-P.        |
| `<leader>bs` | fuzzy buffer and most recently used file search. |
| `<leader>dl` | fuzzy search for the lines in current buffer.    |
| `<leader>he` | fuzzy search for vim help.                       |

###

### w0rp/ale
syntax checking for multiple languages
currently configured so that syntax 
suggestions will be made when you run `:ALELint`

| Instruction   | Description                            |
| ---           | ---                                    |
| `:ALELint`    | Fix things in buffer that can be fixed |
| `:ALEFix`     | Fix things in buffer that can be fixed |
| `:ALEDisable` | disbles ale                            |
| `:ALEEnable`  | enables ale                            |
###

### Shougo/neosnippet.vim
You can create your own snippets that can be inserted into the 
code via the autocomplete functionality.

Some default snippets are provided by honza/vim-snippets
###

### mattn/emmet-vim
The emmet plugin allows quick insertion of html into the code.
Follow the tutorial here: https://raw.githubusercontent.com/mattn/emmet-vim/master/TUTORIAL
###

### kannokanno/previm
Allows realtime preview of markdown (and some other) files

| Instruction                   | Description                              |
| ---                           | ---                                      |
| `:PrevimOpen` or `<leader>po` | opens current markdown buffer in browser |
###

### tpope/vim-rails

| Instruction   | Description                                                                                     |
| ---           | ---                                                                                             |
| `gf`          | will take you to the model/template/etc over the cursor                                         |
| `:R` and `:A` | will switch between model to schema, template to helper, and controller to functional test, etc |
###

### tpope/vim-rake

| Instruction | Description              |
| ---         | ---                      |
| `:Rake`     | wraps the `rake` command |
###

### tpope/cucumber

| Instruction | Description                                  |
| ---         | ---                                          |
| `[d` / `]d` | opens cucumber step definition in new buffer |
###

### tpope/vim-bundler

| Instruction          | Description                |
| ---                  | ---                        |
| `:Bundle`            | wraps the `bundle` command |
| `:Bopen` / `:Bsplit` | opens gems                 |
###

### rainerborene/vim-reek

| Instruction | Description                                |
| ---         | ---                                        |
| `:RunReek`  | will run reek and show results in quickfix |
###

### tpope/vim-fugitive

| Instruction                 | Description                                                           |
| ---                         | ---                                                                   |
| `:Gedit [thing]`            | [thing] can be a commit,                                              |
|                             | blob, tree or tag (to view the commit etc)                            |
| `:Gstatus` / `<leader>gs`   | displays a buffer with git status.                                    |
|                             | use `-` on filename to add / reset from staging                       |
|                             | use `D` on filename to see the diff                                   |
|                             | use `C` to commit                                                     |
| `:Gcommit` / `<leader>gc`   | will commit staged changes (with buffer for                           |
|                             | commit message)                                                       |
| `:Gblame` / `<leader>gb`    | vertical buffer to show git blame results                             |
| `:Gvdiff` / `<leader>gd`    | vertical split buffer to show diff                                    |
| `:Gdelete!` / `<leader>grm` | runs git rm on file and deletes the buffer                            |
| `:Glog`                     | displays git log for current buffer in the quickfix                   |
|                             | can be used with visual mode, highlight a function and `:Glog` to see |
|                             | how it changes over time!                                             |
| `:Gmove`                    | runs git mv on file and renames the buffer                            |
| `:Gread`                    | a variant of `git checkout -- filename` but on the buffer             |
| `:Gbrowse`                  | view current file in github                                           |
|                             | - also works with visual mode                                         |
| `:Git`                      | for any git command e.g. `:Git status`                                |
###

### airblade/vim-gitgutter 
displays git diffs in the gutter (near line numbers)

short cuts:

| Instruction   | Description                |
| ---           | ---                        |
| `<leader>hp`  | preview hunk               |
| `<leader>hs`  | stage hunk                 |
| `<leader>hu`  | undo hunk                  |
| `[c` and `]c` | navigate to prev/next hunk |
###

### gregsexton/gitv

| Instruction | Description             |
| ---         | ---                     |
| `:Gitv`     | to see a visual git log |
###

### AndrewRadev/splitjoin.vim
Useful to join/split arrays, html blocks, if statements, ruby blocks, etc.

| Instruction | Description                                           |
| ---         | ---                                                   |
| `gS`        | splits line smartly                                   |
| `gJ`        | joins lines smartly, when done on first line of block |
###

### tpope/vim-commentary

| Instruction  | Description                            |
| ---          | ---                                    |
| `gcc`        | comments in/out a line                 |
| `gc[object]` | comments in/out an object, e.g. `gcap` |
| `gc`         | comments in/out in visual mode         |
###

### tpope/vim-abolish
Just read the docs for this one:
https://github.com/tpope/vim-abolish
###

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
###

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
###

### terryma/vim-multiple-cursors
Adds multiple cursor editing support
Use `<C-n>` to highlight the word under the cursor
Repeat `<C-n>` to select the next instances of the word
Then you can use normal editing comments, like `c` to change
all the selected words together.

There are ways to use with visual selections as well, see docs.
###

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
###

### vim-scripts/camelcasemotion
Adds motion helpers to move through camelcase words.

| Instruction | Description                             |
| ---         | ---                                     |
| `,w`        | equivalent of `w` for camel case motion |
| `,b`        | equivalent of `b` for camel case motion |
| `,e`        | equivalent of `e` for camel case motion |
###

### Keithbsmiley/investigate.vim
Plugin for looking up documentation.

| Instruction | Description                                                              |
| ---         | ---                                                                      |
| `gK`        | over a word or in visual mode, will search for the selected text on Dash |
###

### tpope/vim-dispatch

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
###

### tpope/vim-dispatch

| Instruction           | Description                                      |
| ---                   | ---                                              |
| `:Dispatch [command]` | will run the command and put results in quickfix |
|                       | e.g. `:Dispatch bundle install`                  |
###

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
###

### junegunn/vim-easy-align
Allows for easy alignment of text

From:
```ruby
{
  hello: "there",
  foo: "bar",
  name: "Jameel"
}
```

To:
```ruby
{
  hello: "there",
  foo:   "bar",
  name:  "Jameel"
}
```

In this case, highlight the related lines and press `ga:`
`ga` activates the easy-align plugin, and 
then `:` tells it to align on the `:` character.

Probably best to visit https://github.com/junegunn/vim-easy-align for full usage.
###

### FZF Helpers
The FZF commands are prefixed with `Fzf`
So if you don't find the commands from the FZF docs
by running them, that is why.

Look at the FZF docs for usage.

###

### majutsushi/tagbar

| Instruction | Description              |
| ---         | ---                      |
| `:Tagbar`   | toggle the Tagbar window |
###

