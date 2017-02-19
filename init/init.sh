#!/usr/bin/env bash

# Select package manager
case "$(uname)" in
   Darwin) INSTALL='brew install' ;;
        *) INSTALL='sudo apt-get install' ;;
esac

pushd `dirname $0` > /dev/null
SCRIPTPATH=`pwd`
BASEPATH=$(git rev-parse --show-toplevel)
popd > /dev/null

DOTFILES="$BASEPATH/dotFiles"
DOTCONFIG="$BASEPATH/dotConfig"

cd $HOME

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
   ln -s $src $dst
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

   ln -s $src $dst
done

$INSTALL pyenv-virtualenv

$SCRIPTPATH/neovim_python.sh

# Install neovim
case "$(uname)" in
   Darwin) brew install neovim/neovim/neovim ;;
   *) sudo apt-get install neovim ;;
esac

# Make old vim still work
backup "$HOME/.vim"
backup "$HOME/.vimrc"
ln -s $HOME/.config/nvim $HOME/.vim 
ln -s $HOME/.config/nvim/init.vim $HOME/.vimrc 

# Install vim plugins
# Note that this will ask for the wakatime api key
vim +PluginInstall +qall

# zsh
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

# Install tldr
if test "$(uname)" = "Darwin"; then
  brew tap tldr-pages/tldr && brew install tldr
fi

test "$(uname)" = "Darwin" && brew install reattach-to-user-namespace
test "$(uname)" = "Darwin" && brew install thefuck

$INSTALL hub

# Install git-flow
case "$(uname)" in
   Darwin) brew install git-flow-avh ;;
   *) sudo apt-get install git-flow ;;
esac

pip install virtualenvwrapper

# Install git-flow completions
cd sources
git clone git@github.com:petervanderdoes/git-flow-completion.git
cd

# Download Inconsolata-g for Powerline
curl -so "$HOME/Library/Fonts/Inconsolata-g for Powerline.otf" \
   https://raw.githubusercontent.com/powerline/fonts/master/Inconsolata-g/Inconsolata-g%20for%20Powerline.otf

echo -n "Full name: "
read fullname
echo -n "GitHub user name: "
read gh_user
echo -n "email: "
read email

$SCRIPTPATH/cookiecutter.sh "$fullname" "$gh_user" "$email"
$SCRIPTPATH/gitconfig.sh "$fullname" "$email"
$SCRIPTPATH/rc.sh "$BASEPATH"
