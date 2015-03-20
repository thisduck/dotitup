---
| Command | Description|
|---------|:-------------|
| `:q`  | - quits vim.                               |
| `:q!` | - force quits vim (will not save changes). |
| `:wq` | - saves and quits.                         |
| `ZZ`  | - equivalent to `:wq`                      |
| `ZQ`  | - equivalent to `:q!`                      |

---
| Command | Description|
|---------|:-------------|
| `zt` | - will "zoom" the current line to the top.    |
| `zb` | - will "zoom" the current line to the bottom. |
| `zz` | - will "zoom" the current line to the middle. |

---
| Command | Description|
|---------|:-------------|
| `G`         | - moves cursor to the last line in the file.       |
| `gg`        | - moves cursor to the first line in the file.      |
| `:1`        | - also moves cursor to the first line in the file. |
| `:[number]` | - moves cursor to the [number] line in the file.   |
| `h`         | - move right.                                      |
| `j`         | - move down.                                       |
| `k`         | - move up.                                         |
| `l`         | - move left.                                       |

| Command | Description|
|---------|:-------------|
| `w` | - go to next word.     |
| `b` | - go to previous word. |
| `e` | - go to end of word.   |

| Command | Description|
|---------|:-------------|
| `W` | - while `w` would treat "www.google.com" as 5 words ("www", ".", "google", ".", "com"), `W` will treat "www.google.com" all as one WORD. |
| `B` | - same as above, but goes back a WORD.                                                                                                   |
| `E` | - same as above, but goes to the end of a WORD.                                                                                          |

| Command | Description|
|---------|:-------------|
| `<C-u>` | - page up half a screen.                  |
| `<C-d>` | - page down half a screen.                |
| `<C-b>` | - page up full screen.                    |
| `<C-f>` | - page down full screen.                  |
| `^`     | - move to first non-whitespace character. |
| `$`     | - move to end of line.                    |
| `0`     | - move to beginning of line.              |

---

| Command | Description|
|---------|:-------------|
| `x`            | - delete/cut character on cursor.                                             |
| `X`            | - delete/cut character before cursor.                                         |
| `d`            | - delete/cut.                                                                 |
| `c`            | - change.                                                                     |
| `y`            | - yank/copy.                                                                  |
| `p`            | - put/paste (after cursor position).                                          |
| `P`            | - put/paste (before cursor position).                                         |
| `r[character]` | - replaces charcter under cursor with [character], keeps cursor on character. |
| `R[character]` | - replaces charcter under cursor with [character], and moves cursor forward.  |
| `~`            | - change case of character.                                                   |

| Command | Description|  |
|---------|:-------------|---|
| `D` | - delete from cursor position to the end of the line. | - delete will delete and remain in normal mode.     |
| `C` | - change from cursor position to the end of the line. | - change will delete and change the mode to insert. |

| Command | Description|
|---------|:-------------|
|`i` | enters insert mode at cursor position.|
|`I` | enters insert mode at the start of the line.|
|`a` | moves cursor forward one character and enters insert mode.|
|`A` | moves cursor to the end of the line and enters insert mode.|

| Command | Description|
|---------|:-------------|
|`yy` |- yank entire line.  |
|`dd` |- delete entire line.|
|`cc` |- change entire line (indents things properly).|
|`u`    | - undo.|
|`<C-r>`| - redo.|
|       |        |
|`o` | - add an empty line below and enter insert mode.|
|`O` | - add an empty line above and enter insert mode.|

---

### you can combine actions and motions.

- `dw` - will delete a word. 
- `db` - will delete to the start of the word.
- `de` - will delete to the end of the word.
- `d$` - will delete to the end of the line.
- `d^` - will delete to the start of the line.
- `cw` - will delete from the cursor to the end of the word and put you in insert mode.

### you can tell vim how many times to do a certain action.

- `5dw` - will delete the next 5 words.
- `5dd` - will delete the next 5 lines.
- `5<C-d>` - will page down 5 times.

this can work in a different order as well.

- `d5w` - will delete 5 words.
- `d5j` - will delete 5 lines downward (since j moves down).
- `d5k` - will delete 5 lines upward (since k moves up).
- `d5l` - will delete 5 characters to the right (since l moves right).

- `42G` - behaves a bit differently, doesn't go to end of file 42 times. instead, goes to line number 42.

---

`.` - repeats the last action that you did.
- if you did `dd`, then `.` will `dd` again.
- if you did `cw[word]`, then `.` on another word will change it to the [word]
- `5dd` will delete 5 lines, `.` will delete the next 5 lines, and so on.

---

### you can go in and around objects/words.

- `diw` - will delete in the word. with the cursor anywhere inside a word, `diw` will delete the word.
- `daw` - will delete the word and around the word. it will also delete the surround whitespace around the word.

### it gets cooler.

- `di"` - when done inside a double quoted string, will delete everything inside the double quotes.
- `di(` - will delete everything inside round brackets.

- `ci"` - will delete everything in the double quotes and put you in insert mode.

| Command | Description |
|---------|:-------------------------------------------|
| << | move back one tab |
| >> | move forward one tab |

## Text objects
| Shortcut | Text Object |
|-------|:---------------------|
| w | word as a series of letters |
| W | WORD surrounded by whitespace|
| s | sentence |
| l | line |
| i | inner text object - leaves the borders alone|
| a | all - includes the borders of the object|

## Marks aka bookmarks
| Command | Description |
|---------|:-------------------------------------------|
| `m[mark]` | set mark within file |
| `m[MARK]` | set mark to jump from one file to another |
| \`[mark]  | go to the exact character on the line where mark was placed |
| \'[mark]  | go to the line |

## Set the settings

! - toggle the value
? - tells the current status

| Command | Description |
|-------|:-------------------------------------------|
| :set cursorline/nocursorline | hightlight/un-hightlight the line with the cursor |

## Windows
| Command | Description |
|-------|:-------------------------------------------|
| `:sp` | horizontal split  |
| `:vs` | vertical split    |
| `C-w +` | make the window taller |
| `C-w -` | make the window shorter |
| `C-w <` | make the window narrower |
| `C-w >` | make the window wider |
| `C-w J` | move current window to the bottom |
| `C-w K` | move current window to the top |
| `C-w r/R` | move current window to the top |
| `C-w x` | swap two windows |

## Tabs
| Command | Description |
|-------|:-------------------------------------------|
| `:tabnew [filename]` OR :`:tabe [filename]` | new tab |
| `:tabc`                                     | close current tab |
| `:tabo`                                     | close all other tabs |
| `:gt` OR `:tabn`                            | go to next tab |
| `:gT` OR `:tabl`                            | go to previous tab |
| `[tabNumber]gt`                             | go to tabNumber tab |
