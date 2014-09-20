---

| `:q`  | - quits vim.                               |
| `:q!` | - force quits vim (will not save changes). |
| `:wq` | - saves and quits.                         |
| `ZZ`  | - equivalent to `:wq`                      |
| `ZQ`  | - equivalent to `:q!`                      |

---

| `zt` | - will "zoom" the current line to the top.    |
| `zb` | - will "zoom" the current line to the bottom. |
| `zz` | - will "zoom" the current line to the middle. |

---

| `G`         | - moves cursor to the last line in the file.       |
| `gg`        | - moves cursor to the first line in the file.      |
| `:1`        | - also moves cursor to the first line in the file. |
| `:[number]` | - moves cursor to the [number] line in the file.   |
| `h`         | - move right.                                      |
| `j`         | - move down.                                       |
| `k`         | - move up.                                         |
| `l`         | - move left.                                       |

| `w` | - go to next word.     |
| `b` | - go to previous word. |
| `e` | - go to end of word.   |

| `W` | - while `w` would treat "www.google.com" as 5 words ("www", ".", "google", ".", "com"), `W` will treat "www.google.com" all as one WORD. |
| `B` | - same as above, but goes back a WORD.                                                                                                   |
| `E` | - same as above, but goes to the end of a WORD.                                                                                          |

| `<C-u>` | - page up half a screen.                  |
| `<C-d>` | - page down half a screen.                |
| `<C-b>` | - page up full screen.                    |
| `<C-f>` | - page down full screen.                  |
| `^`     | - move to first non-whitespace character. |
| `$`     | - move to end of line.                    |
| `0`     | - move to beginning of line.              |

---

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

| `D` | - delete from cursor position to the end of the line. |
| `C` | - change from cursor position to the end of the line. |

|  | - change will delete and change the mode to insert. |
|  | - delete will delete and remain in normal mode.     |

`i` - enters insert mode at cursor position.
`I` - enters insert mode at the start of the line.
`a` - moves cursor forward one character and enters insert mode.
`A` - moves cursor to the end of the line and enters insert mode.

`u` - undo.
`<C-r>` - redo.

`yy` - yank entire line.
`dd` - delete entire line.
`cc` - change entire line.

`o` - add an empty line below and enter insert mode.
`O` - add an empty line above and enter insert mode.

---

- you can combine actions and motions.

`dw` - will delete a word.
`db` - will delete to the start of the word.
`de` - will delete to the end of the word.
`d$` - will delete to the end of the line.
`d^` - will delete to the start of the line.

`cw` - will delete the word and put you in insert mode.

 - you can tell vim how many times to do a certain action.

`5dw` - will delete the next 5 words.
`5dd` - will delete the next 5 lines.
`5<C-d>` - will page down 5 times.

- this can work in a different order as well.

`d5w` - will delete 5 words.
`d5j` - will delete 5 lines downward (since j moves down).
`d5k` - will delete 5 lines upward (since k moves up).
`d5l` - will delete 5 characters to the right (since l moves right).

`42G` - behaves a bit differently, doesn't go to end of file 42 times. instead, goes to line number 42.

---

`.` - repeats the last action that you did.
- if you did `dd`, then `.` will `dd` again.
- if you did `cw[word]`, then `.` on another word will change it to the [word]
- `5dd` will delete 5 lines, `.` will delete the next 5 lines, and so on.

---

- you can go in and around objects/words.

`diw` - will delete in the word. with the cursor anywhere inside a word, `diw` will delete the word.
`daw` - will delete the word and around the word. it will also delete the surround whitespace around the word.

- it gets cooler.

`di"` - when done inside a double quoted string, will delete everything inside the double quotes.
`di(` - will delete everything inside round brackets.

`ci"` - will delete everything in the double quotes and put you in insert mode.

```ruby
def something
end
```
