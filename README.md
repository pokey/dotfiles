Dotfiles
========
These are my dot files. Your mileage may vary.

This setup is macOS only.

Setup
-----

1. Install deps
   1. Install [Hammerspoon](http://www.hammerspoon.org/)
   1. Install [Karabiner Elements](https://pqrs.org/osx/karabiner/)
   1. Install [Homebrew](https://brew.sh)
1. Setup github and clone this repo
   1. Generate ssh key

      ```
      ssh-keygen -t rsa -N "" -f ~/.ssh/id_rsa -C "<your email address>"
      ```

   1. Copy ssh key to clipboard

      ```
      cat ~/.ssh/id_rsa.pub | pbcopy
      ```

   1. Add ssh key to github
   1. Clone this repo
1. Run

   ```
   ./init/init.sh
   ```

   from this directory.

   Notes:
   - This will backup and disable all your customizations for vim, terminal,
     etc. You can add bash customizations to `~/.custom.rc`.
   - This will remap your keyboard kind of severely, but it's reversible if you
     find it too annoying. It's better for RSI and faster. In particular:
     - `W+J` => `<shift>`
     - `V+J` => `<ctrl>`
     - `F+J` simultaneously => `<enter>`
     - `;` => `<backspace>`
     - `D+;` => `;`
     - `F+;` => `:`
     - Key repeat rate is jacked up really high
     - The right `<command>` button is remapped to be a launcher, so for
       instance pressing `<right_command>-c` launches Google Chrome. See
       [`karabiner.yaml`](karabiner-gen/karabiner.yaml) for the exact
       shortcuts
1. Read the [docs](doc)

Updates
-------
Whenever you pull a new version, run `sz` in any open shells to update zsh
settings.
