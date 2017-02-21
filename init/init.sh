#!/usr/bin/env bash

# Select package manager based on OS
case "$(uname)" in
   Darwin) INSTALL='brew install' ;;
        *) INSTALL='sudo apt-get install' ;;
esac

# Get paths
pushd `dirname $0` > /dev/null
SCRIPTPATH=`pwd`
BASEPATH=$(git rev-parse --show-toplevel)
popd > /dev/null

DOTFILES="$BASEPATH/dotFiles"
DOTCONFIG="$BASEPATH/dotConfig"

# Work in the home directory
cd $HOME

# Back up a file before overwriting it
function backup {
   dst="$1"
   bak="$dst.bak"

   if [ -e $dst ]; then
      if [ -e $bak ]; then
         echo "$bak exists; unable to backup $dst"
         exit 1
      fi
      mv $dst $bak
   fi
}

# Set up symlinks to dotFiles
for file in $DOTFILES/*; do
   src="$file"
   dst="$HOME/.$(basename $src)"

   # Backup old dot file
   backup "$dst"

   # Add symlink
   ln -s "$src" "$dst"
done

# Set up symlinks to dotConfig
mkdir -p $HOME/.config
for file in $DOTCONFIG/*; do
   src="$file"
   dst="$HOME/.config/$(basename $src)"

   if [ -e $dst ]; then
      echo "$dst exists; unable to link $src"
      exit 1
   fi

   ln -s "$src" "$dst"
done

$INSTALL pyenv-virtualenv
$INSTALL tmux
$INSTALL fasd

# Setup neovim python
$SCRIPTPATH/neovim_python.sh

# Install neovim
case "$(uname)" in
   Darwin) brew install neovim/neovim/neovim ;;
   *) sudo apt-get install neovim ;;
esac

# Make old vim still work (ish)
backup "$HOME/.vim"
backup "$HOME/.vimrc"
ln -s $HOME/.config/nvim $HOME/.vim 
ln -s $HOME/.config/nvim/init.vim $HOME/.vimrc 

# Install vim plugins
# Note that this will ask for the wakatime api key
vim +PluginInstall +qall

# setup zsh
git clone https://github.com/olivierverdier/zsh-git-prompt.git
$INSTALL zsh
command -v zsh | sudo tee -a /etc/shells
sudo chsh -s "$(command -v zsh)" "${USER}"

# Install ag
case "$(uname)" in
   Darwin) brew install the_silver_searcher ;;
   *) sudo apt-get install silversearcher-ag ;;
esac

mkdir -p $HOME/sources
mkdir -p $HOME/bin

# Install ls++
if test "$(uname)" = "Darwin"; then
   cpan Term::ExtendedColor
   cd ~/sources
   git clone git://github.com/trapd00r/ls--.git
   cd ls--
   perl Makefile.PL
   make && sudo make install

   cp ls++.conf $HOME/.ls++.conf
   cd
fi

# Install fzf
git clone --depth 1 https://github.com/junegunn/fzf.git "$HOMe/.fzf"
$HOME/.fzf/install

# Install tpm
git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"

# Install useful MacOS stuff
if test "$(uname)" = "Darwin"; then
  brew tap tldr-pages/tldr && brew install tldr
  brew install reattach-to-user-namespace
  brew install thefuck
  brew install diff-so-fancy
fi

$INSTALL hub

# Install git-flow
case "$(uname)" in
   Darwin) brew install git-flow-avh ;;
   *) sudo apt-get install git-flow ;;
esac

# Install git-flow completions
cd sources
git clone git@github.com:petervanderdoes/git-flow-completion.git
cd $HOME

# Download Inconsolata-g for Powerline font
curl -so "$HOME/Library/Fonts/Inconsolata-g for Powerline.otf" \
   https://raw.githubusercontent.com/powerline/fonts/master/Inconsolata-g/Inconsolata-g%20for%20Powerline.otf

# For use in template files
echo -n "Full name: "
read fullname
echo -n "GitHub user name: "
read gh_user
echo -n "email: "
read email
echo -n "home wifi ssid: "
read ssid
export BASEPATH fullname gh_user email ssid

# Instantiate template files
backup "$HOME/.cookiecutterrc"
backup "$HOME/.gitconfig"
backup "$HOME/.zshrc"
backup "$HOME/.bashrc"
$SCRIPTPATH/template.sh cookiecutterrc "$HOME/.cookiecutterrc"
$SCRIPTPATH/template.sh gitconfig "$HOME/.gitconfig"
$SCRIPTPATH/template.sh zshrc "$HOME/.zshrc"
$SCRIPTPATH/template.sh bashrc "$HOME/.bashrc"
$SCRIPTPATH/template.sh hammerspoon "$BASEPATH/dotFiles/hammerspoon/ssid.lua"
