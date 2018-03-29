Setup
-----

1. Install deps
   1. Install [Hammerspoon](http://www.hammerspoon.org/)
   1. Install [Karabiner Elements](https://github.com/tekezo/Karabiner-Elements)
   1. Install [iTerm2](https://www.iterm2.com/downloads.html)
   1. Install command-line tools by running

      ```
      g++
      ```

      and following instructions.
   1. Install [Homebrew](brew.sh)
   1. Setup [wakatime](https://wakatime.com/) and make note of API key
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
1. Setup iTerm2 colors. NOTE: I actually use
   [alacritty](https://github.com/jwilm/alacritty) now.  File an issue if you'd
   like me to rewrite this section with instructions for how to set this up and
   configure your colors.
   1. Open iTerm2
   1. Go to the menu iTerm2 > Preferences... > Profiles > Colors > Color
      Presets... > Import...
   1. Select `my.itermcolors` from this directory
1. Run

   ```
   ./init/init.sh
   ```

   from this directory.
   Notes:
   - This will backup and disable all your customizations for vim, terminal,
     etc.  You can add bash customizations to `~/.custom.rc`.  If you need
     other customizations, file an issue, and I can add a way to source custom
     vim, tmux, etc.
   - This will remap your keyboard kind of severely, but it's reversible if you
     find it too annoying.  It's better for RSI and faster.  In particular:
     - `<enter>` => `<ctrl>`
     - `F+J` simultaneously => `<enter>`
     - `<caps lock>` => `<ctrl>`
     - Key repeat rate is jacked up really high.  Every millisecond counts :-)

     Try to use the right ctrl (ie `<enter>`) when hitting keys with the left
     hand, and vice versa (ie `<caps lock>`.  This helps with RSI.
1. Switch to better iTerm2 font
   1. Go to the menu iTerm2 > Preferences... > Profiles > Text > Change Font
   1. Select Inconsolata-g for Powerline.  I like 18pt
1. Read the [docs](doc)

Updates
-------
Whenever you pull a new version, run `sz` in any open shells to update zsh
settings, and `vu` to download new vim plugins.  Then you can type `gv` in any
running vim processes to reload vim settings.
