Vim
===
I use vim as my editor and have customized it a bunch.  I use `G+J`
simultaneously as `<leader>`.  I generally run vim from the root of a project
directory.

Shortcuts
---------
### General
#### Normal and insert mode
- `V+J` simultaneously saves the file.  If in insert mode, it exits insert mode
  first.  This is basically always how I exit insert mode.

#### Normal mode
- `<leader> k` opens a file from the current directory, allowing you to search
  using `fzf`.  With a file selected, press
  - `<enter>` to open the file in the current window
  - `<ctrl-v>` to open the file in a new vertical split
  - `<ctrl-x>` to open the file in a new horizontal split
- `<leader> j` allows you to select an already open buffer using `fzf`.  The
  same shortcuts as above will work.
- `gs` searches all files in the currenty directory and displays the results
  using `fzf`.  You can select a result to open that in a buffer.
- `<shift-q>` quits vim

#### Insert mode
- `<ctrl-x> <ctrl-f>` when your cursor is at the end of a word will allow you
  to select a file using `fzf` to insert at current position in buffer.

##### Window management
- `<leader> <space>` switches windows

### Python
#### Normal mode
- `<leader> i` sorts imports
- `<leader> a` puts arguments to a function on multiple lines, or back on a
  single line
- `gb` swaps a function argument with the next one
- `gB` swaps a function argument with the previous one
