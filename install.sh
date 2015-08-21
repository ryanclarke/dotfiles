#!/bin/sh

__rsc__os="$(uname)"

function prepend() {
  >> $2
  sed -i -e '1i'"$1"'\' $2
}

bash_profile_caller="if [ -f ~/dotfiles/bash/bashrc.sh ]; then . ~/dotfiles/bash/bashrc.sh; fi"
prepend "$bash_profile_caller" ~/.bash_profile

vimrc_caller="source ~/dotfiles/vim/vimrc.vim"
case "$__rsc__os" in
  *_NT* )
    prepend "$vimrc_caller" ~/_vimrc;;
  * )
    prepend "$vimrc_caller" ~/.vimrc;;
esac

