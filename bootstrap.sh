#!/bin/sh

U=${BOOTSTRAP_USER:-rphan}
if ! brew --version; then
    echo Installing Homebrew
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew tap caskroom/cask

BOOTSTRAP=${BOOTSTRAP:-"$U/bootstrap"}
if ! brew tap $BOOTSTRAP; then
    echo "Could not tap $BOOTSTRAP"
    exit
fi

# Bootstrapping circular dependency
if [ -z ${SKIP_MAS+x} ]; then
  brew install mas
fi
brew restore

export HOMESHICK_DIR=/usr/local/opt/homeshick
source "$HOMESHICK_DIR/homeshick.sh"

DOTFILES=${DOTFILES:-"$U/dotfiles"}
if [ ! -d $HOME/.homesick/repos/dotfiles ]; then
    if ! yes | homeshick clone $DOTFILES; then
        echo "Could not clone castle $BOOTSTRAP"
        exit
    fi
fi

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/vundle
vim +PluginInstall +qall 2> /dev/null
