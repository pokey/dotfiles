Tmux
====
I use tmux all over the place and have customized it a bunch.  The first time
you start up your computer, run `tmux` in your terminal window to start a new
tmux session.  If you close your window, you can attach to tmux again by
running `tmux attach`.  I never use the terminal without being in a tmux
session.  Note that `<f-k>` means to press `f` and `k` simultaneously.

Setup
-----
Make sure to press `<f-k> <shift-i>` the first time to install the plugins.

Shortcuts
---------
### Session management
- `<f-k> <shift-c>` starts a new session.
- `<f-k> i` searches for open sessions using `fzf`
- `<f-k> s` switches to last focused session
- `<f-k> $` renames the current session

### Window management
- `<f-k> c` starts a new window in the current session
- `<f-k> ;` switches to last focused window
- `<f-k> <number>` switches to a window by number
- `<f-k> n` switches to next window
- `<f-k> p` switches to previous window
- `<f-k> f` searches for open windows in curring session using `fzf`
- The `nw <name>` command in a terminal window can be used to name a window for
  use when searching
- `<f-k> <number>` selects a window by number

### Pane management
- `<f-k> '` creates a new pane at the top
- `<f-k> }` swaps the panes in the current window

#### Pane selection
I use these three commands constantly.  Just split a window (`<f-k> '`) and
play with them until you get the hang of it.
- `<f-k> d` hides the current pane and maximizes the other pane
- `<f-k> z` maximizes / minimizes the current pane
- `<f-k> o` focuses the other pane

### Other
Take a look in `dotFiles/tmux.conf` to see if other shortcuts strike your
fancy.  The above are the ones I primarily use.
