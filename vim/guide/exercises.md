# Exercises

## Exercise 1

- Open a file `nvim test.md`
- Enter insert mode
- Exit insert mode (return to normal mode)
- Write to file
- Save file
- Exit vim

## Exercise 2

- Open same file `nvim test.md` 
- Enter insert mode
- Exit insert mode (return to normal mode)
- Change file contents
- Exit without saving

## Exercise 3

- Open same file `nvim test.md` 
- Enter insert mode
- Exit insert mode (return to normal mode)
- Save and exit in one go


## Exercise 4

- Open README.md file `nvim README.md`
- go to the last line
- go to the first line
- go to line 100

- navigate the file using `j` `k` `h` and `l`
- navigate the file using `w` `b` `e`
- navigate the file using `t[character]` `f[character]`

- navigate using counts, `[number]w`, etc

- navigate using counts, `[number]w`, etc

- navigate line using `$` `0` and `^`

- scroll through using `<c-f>` and `<c-b>`

DO EASY MOTION

## Exercise 5

- search in file using `/[text]`, search for next/prev with `n` and `N`
- search in file using `?[text]`, search for next/prev with `n` and `N`

- search word under cursor with `*`


## Exercise 6

- Insert with different styles, i a o
- Character Editing
- number + character editing

## Action based editing

- Work with `d` and `c` along with other motions.

- Let's do some undo
- Let's do some repeats

## Excercise 7

Action + Text Objects

### Exercise 8

Search and Replace in file

### Some other movements

`%` moving between brackets/brackes/quotes/methods
`]m`
`[m`

### Yanking exercise

`y` will yank. Can be used with any motions that we learned.
Then `p` to paste at cursor, and `P` to paste before cursor.
You can copy a line with `yy`.

### Visual Mode Exercise

```
Press `v` and try any movement keys.
Perform actions on selected text. `d` `c`
Other operations:
~	switch case					|v_~|
d	delete						|v_d|
c	change (4)					|v_c|
y	yank						|v_y|
>	shift right (4)					|v_>|
<	shift left (4)					|v_<|
!	filter through external command (1)		|v_!|
=	filter through 'equalprg' option command (1)	|v_=|
gq	format lines to 'textwidth' length (1)		|v_gq|


`A` and `I` for block insert/append.
```

### Windows Exercise

You can split windows:
  `<C-w>s` will horizontally split the window, with the current buffer
  `<C-w>v` will vertically split the window, with the current buffer


`<C-w>h` 
`<C-w>j` 
`<C-w>k` 
`<C-w>l` 
Will move between windows in that direction.


`<C-w>o` Will 'zoom in' on a window. 
`<C-w>u` Will 'zoom out' of the window.


`<C-w>=` Will equally size windows.
