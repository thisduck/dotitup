# A Minimal and Hurried Guide to Starting Vim (with Dotitup)

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

| Command      | Description                                                                                             |
| ---------    | :-------------                                                                                          |
| `G`          | Moves cursor to the last line in the file.                                                              |
|              | Note that this is not a command-line command. Since there is no `:` at the start.                       |
|              | This `G` is entered in normal mode.                                                                     |
| `gg`         | Moves cursor to the first line in the file.                                                             |
| `:1`         | Also moves cursor to the first line in the file.                                                        |
| `:[number]`  | Moves cursor to the `[number]` line in the file.                                                        |
| `[number]G`  | Moves cursor to the `[number]` line in the file.                                                        |
| `[number]gg` | Moves cursor to the `[number]` line in the file.                                                        |
|              | This is essentially the goto line feature in vim.                                                       |
|              | There is a reason why there are so many ways to go to a line in Vim. We may or may not learn about why. |

### Character/Word Navigation

| Command        | Description                                                                                                                            |
| ---------      | :-------------                                                                                                                         |
| `j`            | Move one line down.                                                                                                                    |
| `k`            | Move one line up.                                                                                                                      |
| `h`            | Move one character left.                                                                                                                |
| `l`            | Move character right.                                                                                                                  |
| `w`            | Go to next word.                                                                                                                       |
| `b`            | Go to previous word.                                                                                                                   |
| `e`            | Go to end of word.                                                                                                                     |
| `W`            | While `w` would treat "www.google.com" as 5 words ("www", ".", "google", ".", "com"), `W` will treat "www.google.com" all as one WORD. |
| `B`            | Same as above, but goes back a WORD.                                                                                                   |
| `E`            | Same as above, but goes to the end of a WORD.                                                                                          |
| --- |                                                                                                                                        |
| `t[character]` | Will place the cursor right before the next occurance of '[character]' on the line.                                                    |
|                | e.g. `tm` will go before the next occurance of 'm' on the line.                                                                        |
| `T[character]`           | Will place the cursor right after the previous occurance of '[character]' on the line.                                                           |
| `f[character]`           | Will place the cursor on the next occurance of '[character]' on the line.                                                                        |
| `F[character]`           | Will place the cursor on the previous occurance of '[character]' on the line.                                                                    |
|                | This works for any character. `f.` will take you to the next occurance of the '.'                                                      |

All of the above can be combined with a number.  
So `2w` will move the cursor two words forward  
and `10b` would move the cursor 10 words back.  
Movement and action in Vim is a language.  
This is the beginning of that language.

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

### Other Navigation

| Command   | Description                 |
| --------- | :-------------              |
| `(`       | Move to previous sentence.  |
| `)`       | Move to next sentence.      |
| `{`       | Move to previous paragraph. |
| `}`       | Move to next paragraph.     |

## Basic Search

| Command       | Description                                                                                           |
| ---------     | :-------------                                                                                        |
| `/[text]<CR>` | Searches forward for occurances of `[text]` in the current file. (this can use regular expressions)   |
| `?[text]<CR>` | Searches backwards for occurances of `[text]` in the current file. (this can use regular expressions) |
| `n`           | Repeat the last `/` or `?` search.                                                                    |
| `N`           | Repeat the last `/` or `?` search but in the opposite direction.                                      |
| `*`           | Search forward for occurances of the word under the cursor.                                           |
| `#`           | Search backwards for occurances of the word under the cursor.                                         |
|               | `n` and `N` can be used for navigation after `*` and `#` based searches.                              |

## Basic Editing

### Insert Mode

| Command   | Description                                                 |
| --------- | :-------------                                              |
| `i`       | Enters insert mode at cursor position.                      |
| `I`       | Enters insert mode at the start of the line.                |
| `a`       | Moves cursor forward one character and enters insert mode.  |
| `A`       | Moves cursor to the end of the line and enters insert mode. |
| `o`       | Add an empty line below and enter insert mode.              |
| `O`       | Add an empty line above and enter insert mode.              |

Once in insert mode, you can type in text as you normally would in any text editor (for the most part, anyway).  
Remember that `<ESC>` or `<C-c>` will get you out of insert mode and back into normal mode.

### Character Editing

| Command        | Description                                                                   |
| ---------      | :-------------                                                                |
| `x`            | Delete/cut character under cursor.                                            |
| `X`            | Delete/cut character before cursor.                                           |
| `r[character]` | Replaces charcter under cursor with `[character]`, keeps cursor on character. |
| `R[character]` | Replaces charcter under cursor with `[character]`, and moves cursor forward.  |
| `~`            | Change case of character under cursor.                                        |
| `p`            | Put/paste (after cursor position).                                            |
| `P`            | Put/paste (before cursor position).                                           |

The above commands also combine with numbers.  
`6x` will delete six characters and  
`4~` will change the case of 4 characters.

The paste command is only useful once you're deleted or changed text.  
Try deleting 5 characters and then moving elsewhere in the file to paste them.

### Actions

| Command   | Description    |
| --------- | :------------- |
| `d`       | Delete/cut.    |
| `c`       | Change.        |

Note that unlike `x` and `r`, the `d` and `c` commands don't do anything on their own.  
And paste is only useful when you're deleted or changed some text.

### Action and Motion

Combining actions and motions makes vim so versatile.

| Command        | Description                                                            |
| ---------      | :-------------                                                         |
| `dw`           | Delete a word.                                                         |
| `d5w`          | Delete 5 words.                                                        |
| `5dw`          | Delete 5 words. (Same as above.)                                       |
| `2d4w`         | Delete 6 words. (2 * 4 words.)                                         |
| `db`           | Delete to the start of the word.                                       |
| `de`           | Delete to the end of the word.                                         |
| `d$`           | Delete to the end of the line.                                         |
| `d^`           | Delete to the start of the line.                                       |
| `dk`           | Delete the current line and the line above.                            |
| `cw`           | Change a word. (Deletes the word enters insert mode.)                  |
|                | All of the actions done with `d` are possible with `c` in the same way |
|                | `d` will delete and keep you in normal mode.                           |
|                | `c` will delete and change into insert mode.                           |
| `c5l`          | Change 5 characters to the right.                                      |
| `c10j`         | Change current line and 10 lines below.                                |
| `ct'`          | Change to the next occurance of `'` on the current line.               |
| `cf\|`         | Delete to and including next occurance of '\|' on the current line.    |
| *Line Actions* |                                                                        |
| `dd`           | Delete entire line.                                                    |
| `5dd`          | Delete 5 lines.                                                        |
| `cc`           | Change entire line.                                                    |
| `D`            | Delete from cursor position to the end of the line.                    |
| `C`            | Change from cursor position to the end of the line.                    |

Don't try and memorize any of these.  
Instead try to combine action and motion as needed.

### Undo/Redo/Repeat

This is a good time to learn undo and redo.

| Command   | Description                                                                  |
| --------- | :-------------                                                               |
| `u`       | Undo.                                                                        |
| `<C-r>`   | Redo.                                                                        |
| `4u`      | These also work with numbers.                                                |
| `.`       | Repeat actions. `dw` followed by `.` will delete another word.               |
|           | if you did `dd`, then `.` will `dd` again.                                   |
|           | if you did `cw[word]`, then `.` on another word will change it to the [word] |
|           | `5dd` will delete 5 lines, `.` will delete the next 5 lines, and so on.      |

### In and Around (Text Objects)

Along with motions, Vim also has text objects. A `dw` with the cursor in the middle of the word will delete from the cursor to the end of the word. Since `w` alone is a motion. A `diw` with the cursor in the middle of the word will delete the word. Since `iw` signifies the word object.

| Text Object | Description                                                                                                       |
| ---------   | :-------------                                                                                                    |
| `aw`        | a word. includes the word and any trailing space.                                                                 |
|             | I generally like think about the `a` in `aw` as around word. Going to use 'around' for the rest of this document. |
| `iw`        | inner word. just the word without any trailing space.                                                             |
| `aW`        | around WORD.                                                                                                      |
| `iW`        | inner WORD.                                                                                                       |
|             | While `w` and `W` can act as both motions and text objects, the rest are just objects.                            |
| `as`        | around sentence.                                                                                                  |
| `is`        | inner sentence.                                                                                                   |
| `ap`        | around paragraph.                                                                                                 |
| `ip`        | inner paragraph.                                                                                                  |
| `a]` / `a[` | around [] block.                                                                                                  |


| Command   | Description                                                                                               |
| --------- | :-------------                                                                                            |
| `diw`     | will delete in the word. with the cursor anywhere inside a word, `diw` will delete the word.              |
| `daw`     | will delete the word and any trailing whitespace. |

It gets cooler.

| Command   | Description                                                                                          |
| --------- | :-------------                                                                                       |
| `di"`     | when done inside a double quoted string, will delete everything inside the double quotes.            |
| `di(`     | will delete everything inside round brackets. This works across multiple lines.                      |
| `ci"`     | will delete everything in the double quotes and put you in insert mode.                              |
|           | This will work for all types of brackets (`[`, `]`, `{`, `}`, `(`, `<`) and quotes. This is another. |

## Visual Mode

So far we've dealt with the normal and insert modes.

Visual mode is Vim's way of selecting a block of text.

There are 3 ways of starting visual mode in Vim:

| Command | Description                |
| ----    | :-------                   |
| `v`     | Character-wise visual mode |
| `V`     | Line-wise visual mode      |
| `<C-v>` | Block-wise visual mode     |

Once you enter visual mode, you can use any of the motions or text-objects  
we've learned above to select the block of text you want.

| Command | Description                |
| ----    | :-------                   |
| `vip`   | Visual select inner paragraph. |
| `vaw`   | Visual select a word. |
| `vi"`   | Visual select inside double quotes. |

## Other things *TODO*

| Command   | Description          |
| --------- | :--------            |
| `<<`      | move back one tab    |
| `>>`      | move forward one tab |

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
| -------                      | :-------------------------------------------      |
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

#### TODO: 
- Yank/Yank Register.
- Pasting in different modes.
- undo plugin?
- 
