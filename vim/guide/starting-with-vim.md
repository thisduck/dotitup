# Vim Things with Dotitup

Vim is a modal editor. Not like modals that pop up on websites. But that it has different modes.

| Mode         | Description                                                                                                      |
| ---------    | :-------------                                                                                                   |
| Normal       | Vim starts in this mode. It's for navigating and modifying text via commands.                                    |
|              | You can return to this mode by pressing `<ESC>` or `<C-c>` (notation for `CTRL-C`)                               |
|              | Note that the `<C-c>` shortcut is configured by Dotitup. Vim's own default is `<ESC>`.                           |
| Insert       | This mode is for inserting text. You can enter this mode from by pressing `i`                                    |
| Visual       | This mode is for selecting text. You can enter this mode from by pressing `v` or `V`. (covered later)            |
| Command-Line | This mode is for entering commands. You can enter this mode from by pressing `:` often followed by some command. |
| More Modes   | There are more modes, but I don't know much about this.                                                          |

## Saving and Quitting
| Command   | Description                                                                                      |
| --------- | :-------------                                                                                   |
| `:q`      | Quits vim. `:` will enter you into command line mode. and `q` is the command (short for `quit`). |
|           | It is implied in command-line mode that you will press `Enter` to execute the command.           |
|           | (Notation for `Enter` is `<CR>`)                                                                 |
| `:q!`     | Force quits vim (will not save changes).                                                         |
| `:w`      | Saves the current file. Short for `:write`.                                                      |
| `:wq`     | Saves and quits.                                                                                 |

For more on writing and quitting use the help commands:
  - `:help writing`
  - `:help write-quit`

## Basic Navigation

### Goto Line Navigation

| Command     | Description                                                                       |
| ---------   | :-------------                                                                    |
| `G`         | Moves cursor to the last line in the file.                                        |
|             | Note that this is not a command-line command. Since there is no `:` at the start. |
|             | This `G` is entered in normal mode.                                               |
| `gg`        | Moves cursor to the first line in the file.                                       |
| `:1`        | Also moves cursor to the first line in the file.                                  |
| `:[number]` | Moves cursor to the `[number]` line in the file.                                  |
|             | This is essentially the goto line feature in vim.                                 |

### Character/Word Navigation
| Command   | Description              |
| --------- | :-------------           |
| `j`       | Move one line down.      |
| `k`       | Move one line up.        |
| `h`       | Move one characer right. |
| `l`       | Move character left.     |
| `w`       | Go to next word.         |
| `b`       | Go to previous word.     |
| `e`       | Go to end of word.       |
| `W`       | While `w` would treat "www.google.com" as 5 words ("www", ".", "google", ".", "com"), `W` will treat "www.google.com" all as one WORD. |
| `B`       | Same as above, but goes back a WORD.                                                                                                   |
| `E`       | Same as above, but goes to the end of a WORD.                                                                                          |

All of the above can be combined with a number.  
So `2w` will move the cursor two words forward  
and `10b` would move the cursor 10 words back.

### Current Line Navigation
| Command   | Description                                                                                 |
| --------- | :-------------                                                                              |
| `^`       | Move to first non-whitespace character on the line.                                         |
| `$`       | Move to end of line.                                                                        |
|           | Note that the above two commands have similar meaning to their regular expression versions. |
| `0`       | Move to beginning of line.                                                                  |

### Page Navigation
| Command   | Description              |
| --------- | :-------------           |
| `<C-u>`   | Page up half a screen.   |
| `<C-d>`   | Page down half a screen. |
| `<C-b>`   | Page up full screen.     |
| `<C-f>`   | Page down full screen.   |

## Basic Editing

| Command        | Description                                                                   |
| ---------      | :-------------                                                                |
| `x`            | Delete/cut character on cursor.                                               |
| `X`            | Delete/cut character before cursor.                                           |
| `r[character]` | Replaces charcter under cursor with `[character]`, keeps cursor on character. |
| `R[character]` | Replaces charcter under cursor with `[character]`, and moves cursor forward.  |
| `~`            | Change case of character under cursor.                                        |


| Command        | Description                                                                   |
| ---------      | :-------------                                                                |
| `d`            | Delete/cut.                                                                 |
| `c`            | Change.                                                                     |
| `y`            | Yank/copy.                                                                  |
| `p`            | Put/paste (after cursor position).                                          |
| `P`            | Put/paste (before cursor position).                                         |

| Command   | Description                                                 |                                                     |
| --------- | :-------------                                              | ---                                                 |
| `D`       | - delete from cursor position to the end of the line.       | - delete will delete and remain in normal mode.     |
| `C`       | - change from cursor position to the end of the line.       | - change will delete and change the mode to insert. |

| Command   | Description                                                 |
| --------- | :-------------                                              |
| `i`       | enters insert mode at cursor position.                      |
| `I`       | enters insert mode at the start of the line.                |
| `a`       | moves cursor forward one character and enters insert mode.  |
| `A`       | moves cursor to the end of the line and enters insert mode. |

| Command   | Description                                                 |
| --------- | :-------------                                   |
| `yy`      | - yank entire line.                              |
| `dd`      | - delete entire line.                            |
| `cc`      | - change entire line (indents things properly).  |
| `u`       | - undo.                                          |
| `<C-r>`   | - redo.                                          |
|           |                                                  |
| `o`       | - add an empty line below and enter insert mode. |
| `O`       | - add an empty line above and enter insert mode. |

---

### you can combine actions and motions.

| Command   | Description                                                                    |
| --------- | :-------------                                                                 |
| `dw`      | will delete a word.                                                            |
| `db`      | will delete to the start of the word.                                          |
| `de`      | will delete to the end of the word.                                            |
| `d$`      | will delete to the end of the line.                                            |
| `d^`      | will delete to the start of the line.                                          |
| `cw`      | will delete from the cursor to the end of the word and put you in insert mode. |

### you can tell vim how many times to do a certain action.

| Command   | Description                   |
| --------- | :-------------                |
| `5dw`     | will delete the next 5 words. |
| `5dd`     | will delete the next 5 lines. |
| `5<C-d>`  | will page down 5 times.       |

this can work in a different order as well.

| Command   | Description                                                                                     |
| --------- | :-------------                                                                                  |
| `d5w`     | will delete 5 words.                                                                            |
| `d5j`     | will delete 5 lines downward (since j moves down).                                              |
| `d5k`     | will delete 5 lines upward (since k moves up).                                                  |
| `d5l`     | will delete 5 characters to the right (since l moves right).                                    |
| `42G`     | behaves a bit differently, doesn't go to end of file 42 times. instead, goes to line number 42. |

---

| Command   | Description                                                                  |
| --------- | :-------------                                                               |
| `.`       | repeats the last action that you did.                                        |
|           | if you did `dd`, then `.` will `dd` again.                                   |
|           | if you did `cw[word]`, then `.` on another word will change it to the [word] |
|           | `5dd` will delete 5 lines, `.` will delete the next 5 lines, and so on.      |

---

### you can go in and around objects/words.

| Command   | Description                                                                                            |
| --------- | :-------------                                                                                         |
| `diw`     | will delete in the word. with the cursor anywhere inside a word, `diw` will delete the word.           |
| `daw`     | will delete the word and around the word. it will also delete the surround whitespace around the word. |

### it gets cooler.

| Command   | Description                                                                               |
| --------- | :-------------                                                                            |
| `di"`     | when done inside a double quoted string, will delete everything inside the double quotes. |
| `di(`     | will delete everything inside round brackets.                                             |
| `ci"`     | will delete everything in the double quotes and put you in insert mode.                   |

| Command   | Description                                  |
| --------- | :------------------------------------------- |
| `<<`      | move back one tab                            |
| `>>`      | move forward one tab                         |

## Text objects
| Shortcut | Text Object                                  |
| -------  | :---------------------                       |
| w        | word as a series of letters                  |
| W        | WORD surrounded by whitespace                |
| s        | sentence                                     |
| l        | line                                         |
| i        | inner text object - leaves the borders alone |
| a        | all - includes the borders of the object     |

## Marks aka bookmarks
| Command   | Description                                                 |
| --------- | :-------------------------------------------                |
| `m[mark]` | set mark within file                                        |
| `m[MARK]` | set mark to jump from one file to another                   |
| \`[mark]  | go to the exact character on the line where mark was placed |
| \'[mark]  | go to the line                                              |

## Set the settings

! - toggle the value
? - tells the current status

| Command | Description |
|-------|:-------------------------------------------|
| :set cursorline/nocursorline | hightlight/un-hightlight the line with the cursor |

## Windows
| Command   | Description                                  |
| -------   | :------------------------------------------- |
| `:sp`     | horizontal split                             |
| `:vs`     | vertical split                               |
| `C-w +`   | make the window taller                       |
| `C-w -`   | make the window shorter                      |
| `C-w <`   | make the window narrower                     |
| `C-w >`   | make the window wider                        |
| `C-w J`   | move current window to the bottom            |
| `C-w K`   | move current window to the top               |
| `C-w r/R` | move current window to the top               |
| `C-w x`   | swap two windows                             |

## Tabs
| Command                                     | Description                                  |
| -------                                     | :------------------------------------------- |
| `:tabnew [filename]` OR :`:tabe [filename]` | new tab                                      |
| `:tabc`                                     | close current tab                            |
| `:tabo`                                     | close all other tabs                         |
| `:gt` OR `:tabn`                            | go to next tab                               |
| `:gT` OR `:tabl`                            | go to previous tab                           |
| `[tabNumber]gt`                             | go to tabNumber tab                          |
