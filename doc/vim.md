Vim
===
I use vim as my editor and have customized it a bunch.  Note that `<g-j>` means
to press `g` and `j` simultaneously.  I generally run vim from the root of a
project directory.

Shortcuts
---------
### General
#### Normal and insert mode
- `<VJ>` simultaneously saves the file.  If in insert mode, it exits insert mode
  first.  This is basically always how I exit insert mode.

#### Normal mode
- `}` moves forward to the next blank line.  I use this all the time
- `{` moves backward to the prev blank line.  I use this all the time
- `<g-j> k` opens a file from the current directory, allowing you to search
  using `fzf`.  With a file selected, press
  - `<enter>` to open the file in the current window
  - `<ctrl-v>` to open the file in a new vertical split
  - `<ctrl-x>` to open the file in a new horizontal split
- `<g-j> j` allows you to select an already open buffer using `fzf`.  The
  same shortcuts as above will work.
- `ga` searches all files in the currenty directory and displays the results
  using `fzf`.  You can select a result to open that in a buffer.
- `<shift-q>` quits vim
- `gr` reloads the current file
- `<ctrl-n>` selects the word under the cursor.  Pressing it again also selects
  the next instance of that word.  You can keep pressing to select more
  instances of that word.  Then you can press keys (eg `s`) to work on all
  these instances at the same time.  See
  [vim-multiple-cursors](https://github.com/terryma/vim-multiple-cursors) for
  more info.
- `gw <motion>` breaks lines automatically.  It's built-in, but I use it all
  the time.
- `= <motion>` automatically fixes indentation.  Also built-in, but really
  useful.
- `gs <motion>` sorts lines or words across `<motion>`
- `<g-j> n` lets you create a new file in the same directory as the current
  buffer.
- `<shift-q>` closes the current window, quitting vim if it's the only window
  open.
- `gn` clears the current highlighting
- `<shift-8>` searches forwards for instances of the word under the cursor
- `<shift-3>` searches backwards for instances of the word under the cursor
- `.` repeats the last action.  I use this all the time
- `q<key>` records a macro.  This is great.  Look up "vim macros" and learn to
  use them.

#### Insert mode
- `<ctrl-x> <ctrl-f>` when your cursor is at the end of a word will allow you
  to select a file using `fzf` to insert at current position in buffer.

##### Window management
- `<g-j> <space>` switches windows

### ctags
ctags is a really useful tool for navigating files.  It tracks all the function
and class declarations in all your files, and lets you search for them and jump
to them.
#### Normal mode
- `gt` opens a list of tags in `fzf`.
- `<g-j> f` finds the tag corresponding to the word under your cursor
- `<g-j> ;` jumps back to where you were after finding the tag under the cursor
- `<g-j> o` opens a sidebar which shows you all the tags in the current file.
  See [tagbar](https://github.com/majutsushi/tagbar) for more info.

### Python
#### Normal mode
- `<g-j> i` sorts imports
- `<g-j> a` puts function arguments on multiple lines, or back on a single
  line.  This is fantastic.  Use it.
- `gb` swaps a function argument with the next one
- `gB` swaps a function argument with the previous one
- The `ii` motion applies to the current indent level.  See
  [doc](http://www.vim.org/scripts/script.php?script_id=2484)

### Other
Take a look in `dotConfig/nvim/config/maps.vim` to find more shortcuts.  There
are definitely others I use.
