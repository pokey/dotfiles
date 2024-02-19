# Zsh customizations

I use [iTerm2](https://www.iterm2.com/) as my terminal emulator and `zsh` as my
shell. Always run `tmux` the first time you startup your computer and run
iTerm2. If you open iTerm2 again and you haven't restarted your computer, you
can use `tmux attach` to attach to an existing tmux session.

## Shortcuts

There are a bunch of aliases and commands to make it faster to work in the
terminal.

### General

- `<g-j k>` wipes out the current line. I use this whenever I start typing
  something and change my mind.
- `<ctrl-r>` uses `fzf` to search through previous commands
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
- `lt` displays a tree view of the current directory
- `j <name>` will use `fzf` to find recently used directories matching name and
  change to that directory
- `mc` is shorthand for making a directory and then changing to it
- `man <cmd>` displays information about a given command in full screen window
- `<cmd1> ix <cmd2>` is shorthand for `<cmd1> | xargs <cmd2>`. It allows you
  to run `cmd2` for every output of `cmd1`. Google around for `xargs`. It's
  amazing. Remember that you can always replace `cmd2` with `echo "cmd2"` to
  run it "dry," ie see what's going to happen without actually running the
  command. The two options to `xargs` that are definitely worth understanding
  are `-n` and `-I`. For example, understand every part of the following
  command:

  ```
  echo "foo bar baz" | xargs -n1 -I{} cp {} {}.bak
  ```

  Try running it "dry", as described above, as follows:

  ```
  echo "foo bar baz" | xargs -n1 -I{} echo "cp {} {}.bak"
  ```

  That won't do anything, but will tell you what it would have done.
  Understand the relationship between that command and the previous one.

- `ag` is amazing. It's
  [the-silver-searcher](https://github.com/ggreer/the_silver_searcher). It
  searches for things in files. There are lots of ways to use it. Here are
  some examples:

  - Search for the term "foo" in all files in current dir:
    ```
    ag foo
    ```
  - Search for the term "foo" in all python files in current dir:
    ```
    ag --py foo
    ```
  - List files containing the term "foo":
    ```
    ag -l foo
    ```
  - Search for files containing the term "foo" as its own word:
    ```
    ag "\bfoo\b"
    ```
  - Search for files with "foo" in their name
    ```
    ag -g foo
    ```
  - Any of the above can be combined. Eg to list all python files containing
    the text "foo" as a its own word

    ```
    ag -l --py "\bfoo\b"
    ```

- `ia` is shorthand for `| ag`. For example, to see which version of a python
  package you have, you can type

  ```
  pip freeze -l ia <name>
  ```

  Note that that particular command is already abbreviated to `ppv`, but `ia`
  can be used to search through the output of anything

- `ev` is shorthand for `$()`. It allows you to use the output of a command
  as an argument to another command. For example, to open all files containing
  the term "foo" in vim:

  ```
  vim ev ag -l foo
  ```

  which expands to

  ```
  vim $(ag -l foo)
  ```

- `evl` is shorthand for `$(!!)`, which lets you use the output of the last
  command. For example

  ```
  ag -l foo
  vim evl
  ```

  Make sure to put a space after that last `evl` so abbrevation can expand.

- `lc` expands to last command
- `lf` expands to the final argument of the previous command. Need to press
  space to expand
- `l<number>` refers to arg `<number>` of previous command. `0` is the
  previous command itself.
- `glances` brings up a display with a bunch of information about system,
  running processes, etc. I usually always have this running in a tmux
  session.
- `k9` uses `fzf` to find a list of processes to kill forcefully
- `<ctrl-z>` when in the middle of typing a line lets you run a different
  command and then puts the current command back on the buffer

### Python

- `ccp` will create a brand new python project from a cookiecutter template in
  the current directory. I usually run it from `~/src`, as that's where I put
  all my projects.
- `pyn <name>` creates a new [pyenv](https://github.com/yyuu/pyenv-virtualenv)
  environment for a project
- `pys <name>` activates a pyenv environment. Note that you can use tab
  completion with `<name>` here
- `pie` installs package and dependencies from current directory
- `pi <package>` => `pip install <package>`
- `pysu` deactivates a pyenv environment

### Git

There are a bunch of aliases to make git faster and easier to use

#### General

- `~~` expands to the root directory of the current git repo
- `cg` changes directory to the root of the current git repo

#### Branches

- `go <branch>` will use `fzf` to find branches by name and change to that
  branch
- `gb <branch>` is similar, but you can press `<ctrl-d>` to delete a branch.
- `gn <name>` creates a new branch and checks it out. Generally prefer to use
  the git flow commands below, though

#### Status and history

- `gl` will use `fzf` to show the commit history and allow you to search
- `gs` shows git status. I use this all the time to see what state the repo is
  in
- `gd` shows what changes you have in your current repo
- `gd <file>` shows changes for a particular file

#### Adding files

- `ga <file>` => `git add <file>`
- `gA` adds all files (including untracked) to git

#### Commiting changes

- `gc <message>` commits with given message. Note that if you accidentally use
  this command when you meant to use `gca`, you can press `<g-j> a` with the
  command visible to correct it.
- `gca <message>` adds changed files and commits with given message
- `gcm` amends previous commit
- `gcam` adds changed files and amends previous commit

#### Dealing with server

- `gp` => `git push`
- `gpl` => `git pull`
- `gpf` force pushes to server. Use this after you've amended a previous
  commit

#### Git flow

- `fi` inits git flow in the current directory. Make sure to press space after
  `fi`.
- `ffs <name>` starts a new feature branch
- `ffp` publishes the current feature branch
- `pr` creates a pull request for current feature branch
- `fff` merges the current feature branch into develop

### Other

Take a look in `dotFiles/sh/aliases.sh` and `dotFiles/zsh/abbreviations.sh` to
see if other aliases strike your fancy. The above are the ones I primarily
use.
