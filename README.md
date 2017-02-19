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
1. Setup ssh
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
1. Setup iTerm2 colors
   1. Open iTerm2
   1. Go to the menu iTerm2 > Preferences... > Profiles > Colors > Color
      Presets... > Import...
   1. Select `my.itermcolors` from this directory
1. Run

   ```
   ./init/init.sh
   ```

   from this directory
