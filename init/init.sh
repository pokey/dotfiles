#!/usr/bin/env bash

set -e  # Exit on error

# macOS only
if [ "$(uname)" != "Darwin" ]; then
   echo "This script only supports macOS"
   exit 1
fi

# Get paths
pushd $(dirname $0) >/dev/null
SCRIPTPATH=$(pwd)
BASEPATH=$(git rev-parse --show-toplevel)
popd >/dev/null

DOTFILES="$BASEPATH/dotFiles"
DOTCONFIG="$BASEPATH/dotConfig"
VSCODE_TARGET="$HOME/Library/Application Support/Code/User"
VSCODE_SRC="$BASEPATH/vscode"

# Work in the home directory
cd $HOME

# Back up a file before overwriting it
function backup {
   dst="$1"
   bak="$dst.bak"

   if [ -e "$dst" ]; then
      if [ -e "$bak" ]; then
         echo "$bak exists; unable to backup $dst"
         exit 1
      fi
      mv "$dst" "$bak"
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

function symlinkIntoDir {
   src_base="$1"
   dst_base="$2"

   for file in $src_base/*; do
      src="$file"
      dst="$dst_base/$(basename $src)"

      # Backup old dot file
      backup "$dst"

      # Add symlink
      ln -s "$src" "$dst"
   done
}

# Set up symlinks to dotConfig
CONFIG_DIR="$HOME/.config"
mkdir -p "$CONFIG_DIR"
symlinkIntoDir "$DOTCONFIG" "$CONFIG_DIR"

# Set up vscode
mkdir -p "$VSCODE_TARGET"
symlinkIntoDir "$VSCODE_SRC" "$VSCODE_TARGET"

# Install Homebrew packages
brew install tmux
brew install fasd
brew install neovim
brew install ripgrep
brew install fd
brew install eza
brew install fzf
brew install gh
brew install git-delta
brew install starship

# Setup fzf key bindings and completion
$(brew --prefix)/opt/fzf/install --key-bindings --completion --no-update-rc

mkdir -p $HOME/src
mkdir -p $HOME/bin

# Install tpm (tmux plugin manager)
git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"
"$HOME/.tmux/plugins/tpm/bin/install_plugins"

# Install zsh syntax highlighting
mkdir -p $HOME/.zsh.plugins
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git \
   $HOME/.zsh.plugins/zsh-syntax-highlighting

# Install mise (version manager for node, python, etc)
curl https://mise.run | sh
~/.local/bin/mise install

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
backup "$HOME/.gitconfig.personal"
backup "$HOME/.zshrc"
backup "$HOME/.bashrc"
$SCRIPTPATH/template.sh gitconfig.personal "$HOME/.gitconfig.personal"
$SCRIPTPATH/template.sh zshrc "$HOME/.zshrc"
$SCRIPTPATH/template.sh bashrc "$HOME/.bashrc"
$SCRIPTPATH/template.sh hammerspoon "$BASEPATH/dotFiles/hammerspoon/ssid.lua"

# Setup karabiner
karabiner_dir="$HOME/.config/karabiner"
mkdir -p $karabiner_dir
backup "$karabiner_dir/karabiner.json"
(
   cd "$BASEPATH/karabiner-gen"
   uv run generate_karabiner.py >"$karabiner_dir/karabiner.json"
)

mkdir -p "$HOME/.zfunc"

echo ""
echo "Done! Remember to:"
echo "  - Run 'source ~/.zshrc' to reload shell config"
echo "  - Run Talon setup: $BASEPATH/init/setup-talon-repos.sh"
