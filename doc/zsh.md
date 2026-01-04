# Zsh customizations

I use VS Code's integrated terminal with `zsh` as my shell. Always run `tmux`
the first time you startup your computer and open a terminal. If you open
another terminal and you haven't restarted your computer, you can use
`tmux attach` to attach to an existing tmux session.

## Shortcuts

There are a bunch of aliases and commands to make it faster to work in the
terminal.

### General

- `<ctrl-r>` uses `fzf` to search through previous commands (via atuin)
- `<g-j e>` opens the current command in vim so you can edit it
- `<g-j j>` looks for files beginning with prefix using `fzf`. Press it right
  at the end of a word. For example

  ```
  vim map<g-j j>
  ```

  in this directory will quickly let you edit `dotConfig/nvim/config/maps.vim`

- `c` => `cd`
- `k` => `cd ..`
- `l` => `eza`, which is a souped-up `ls`
- `la` is `l` including hidden files
- `ll` is `l` with lots of info about files
- `lal` is `l` including hidden files with lots of info about files
- `j <name>` will use `fzf` to find recently used directories matching name and
  change to that directory
- `mc` is shorthand for making a directory and then changing to it
- `<cmd1> ix <cmd2>` is shorthand for `<cmd1> | xargs <cmd2>`. It allows you
  to run `cmd2` for every output of `cmd1`. Google around for `xargs`. It's
  amazing.

- `ir` is shorthand for `| rg` (ripgrep). For example, to filter output:

  ```
  git branch ir feature
  ```

- `ev` is shorthand for `$()`. It allows you to use the output of a command
  as an argument to another command. For example, to open all files containing
  the term "foo" in vim:

  ```
  vim ev rg -l foo
  ```

  which expands to

  ```
  vim $(rg -l foo)
  ```

- `evl` is shorthand for `$(!!)`, which lets you use the output of the last
  command.
- `lc` expands to last command
- `lf` expands to the final argument of the previous command
- `l<number>` refers to arg `<number>` of previous command
- `k9` uses `fzf` to find a list of processes to kill forcefully
- `<ctrl-z>` when in the middle of typing a line lets you run a different
  command and then puts the current command back on the buffer

### Git

There are a bunch of aliases to make git faster and easier to use

#### General

- `~~` expands to the root directory of the current git repo
- `cg` changes directory to the root of the current git repo

#### Branches

- `g <branch>` will use `fzf` to find branches by name and change to that
  branch. Press `<ctrl-d>` to delete a branch.
- `gn <name>` creates a new branch and checks it out
- `gom` checkout main branch
- `g-` checkout previous branch

#### Status and history

- `gl` shows git-branchless smartlog
- `gs` shows git status
- `gd` shows what changes you have in your current repo
- `gdl` shows commit log graph

#### Adding files

- `ga <file>` => `git add <file>`
- `gA` adds all files (including untracked) to git

#### Commiting changes

- `gc <message>` commits with given message
- `gca <message>` adds changed files and commits with given message
- `gcm` amends previous commit
- `gcam` adds changed files and amends previous commit

#### Dealing with server

- `gp` => `git push`
- `gpl` => `git pull`
- `gpf` force pushes to server (use after amending)

#### Rebase

- `grim` interactive rebase on main
- `grc` continue rebase
- `gra` abort rebase

### LLM tools

- `claude` => run Claude Code
- `s` / `sketch` => run Sketch
- `lm` => run llm CLI

### Other

Take a look in `dotFiles/sh/aliases.sh` and `dotFiles/zsh/abbreviations.sh` to
see if other aliases strike your fancy.
