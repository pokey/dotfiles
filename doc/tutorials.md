Tutorials
=========

This file contains examples of workflows I use to illustrate how to combine the
various elements of my setup.

New python package
------------------
In this tutorial, we'll create a new python package called `spaghetti` and
start working on it.

1. Press `<fk> <shift-c> spaghetti <enter>` to create a new tmux session for
   the project.
1. `c src<enter>`
1. `ccp<enter>` and answer the questions to create a new cookiecutter project.  Make
   sure to answer `1` to the Click question so we have a cli.  Not always
   necessary, but we'll do it here.  Read about
   [Click](http://click.pocoo.org/5/); it's great.
1. `pyn spaghetti<enter>` to create a pyenv for this project
1. `pys lf<space><enter>` to activate the pyenv
1. `c spa<tab><enter>` to switch to the spaghetti directory
1. `l<enter>` to see a list of files
1. `git init .<enter>` to initialize a git repo
1. `gn develop<enter>` to create a `develop` branch
1. `fi<space><enter>` and press enter a bunch of times to initialize git flow
1. `ga .<enter>` to add everything to the git repo
1. `gc<space> Initial commit<enter>` to commit the repo with the message "Initial
   commit".
1. Link this repo with github by either following instructions on github or
   creating new repo using `git create -d "Spaghetti"<enter>`.
1. `gp -u origin develop<enter>` to push and set up tracking
1. `pie<enter>` to install current repo into pyenv.
1. `pi <package><enter>` to install a dep
1. `ppv <package><enter>` to see what version was installed.  Select `Keras==1.2.0` or
   whatever it is with mouse and press `<cmd-c>` to copy to clipboard.  This is
   basically the only time I use the mouse.  Probably could eliminate it but
   hasn't been pressing enough
1. `vim se<ctrl-j><enter><enter>` to open `setup.py`
1. `/req<enter>` to find the requirements section
1. `jjdd<v-j>` to delete the `TODO` line and save
1. `<shift-o>` to create a new line above the current
1. `<ctrl-[>` to escape from insert mode
1. `<g-j> p` to paste from system clipboard
1. `==` to fix indentation
1. `ysi<shift-w>'` to surround with quotes.  Try to understand this by looking
   up [vim-surround](https://github.com/tpope/vim-surround) and thinking about
   motions to understand what this is doing.  In particular, why `<shift-w>`
   instead of `w`?
1. `f=r><v-j>` to replace `==` with `>=` and save
1. `<shift-a> , <v-j>` to add comma at the end then exit insert mode and save
1. `gsi]` to sort dependencies
1. `<v-j>` to save
1. `<f-k> '` to create a new pane above the current.  We'll use this one for
   git sort of stuff and managing the directory.
1. `<f-k> z` to zoom the pane
1. `j sp<enter><enter>` to change to the `spaghetti` directory
1. `pys spa<tab><enter>` to activate the `spaghetti` pyenv
1. `gca<space> Add deps<enter>` to add changed files and commit
1. `gp<enter>` to push changes to server
1. `<f-k> c` to create a new window.  We'll use this one for running the cli.
1. `j sp<enter><enter>` to change to the `spaghetti` directory 
1. `pys spa<tab><enter>` to activate the `spaghetti` pyenv
1. `spa<tab><enter>` to run the `spaghetti` program
1. `<f-k> ;` to select the other window
1. `ffs improve-cli<enter>` to start a new feature branch called `improve-cli`.
   At first, always read the output from git flow commands.  These start with
   `ff` and expand to `git flow ...`.
1. `<f-k> d` to zoom the vim pane
1. `<g-j> k cli` to search for `spaghetti/cli.py`.
1. `<ctrl-v>` to open it in a vertical split
1. `}}}k<shift-v>kk` to select the three lines of `main`.
1. `<shift-c>pass<v-j>` to set the contents to `pass` and save
1. `<f-k> ;` to switch to the other window
1. `<ctrl-p><enter>` to run `spaghetti` again and see that there is no longer
   any output.
1. `<f-k> ;<f-k> d` to switch to git terminal
1. `gs<enter>` to see the status of the branch
1. `gd<enter>` to see what exactly has changed.  When this is long, it will let
   you navigate using vim-like shortcuts eg `j` and `k`
1. `gca Remove output.<enter>` to commit change.
1. `ffp<enter>` to publish branch
1. `pr<enter>` to create a pull request
1. `<shift-q>` to accept message and finish creating pull request.  You could
   also edit it.  It's vim.  You should follow the same guidelines here as for
   [commit messages](https://github.com/erlang/otp/wiki/Writing-good-commit-messages).
   I don't often change this, but sometimes it's useful.
1. Hold down `cmd` and click on the link.  You can see your pull request.  You
   can send this link to others so that they can see what you've done and
   comment on it.
