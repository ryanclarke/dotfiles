#!/bin/sh

[[ $PATH == *"$(echo ~/dotfiles/bin)"* ]] || export PATH=$PATH:~/dotfiles/bin
[[ $PATH == *"$(echo ~/dotfiles/git/bin)"* ]] || export PATH=$PATH:~/dotfiles/git/bin

. ~/dotfiles/bash/os_vars.sh
. ~/dotfiles/git/setupconfig.sh
. ~/dotfiles/bash/git_helpers.sh
. ~/dotfiles/bash/npm-completion.bash

function v() {
  __rsc__vim $1 &
}

__rsc__default_editor='code'

alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'
alias ......='cd ../../../../../'
alias ba='$__rsc__default_editor $__rsc__dotfiles_dir/bash/bash_profile.sh'
alias bl='$__rsc__default_editor ~/.bash_profile'
alias c-='cd -'
alias cdd='cd $(eval echo $__rsc__dev_dir)'
alias df='cd $(eval echo $__rsc__dotfiles_dir)'
alias la='__rsc__ls_color -F'
alias ll='__rsc__ls_color -AFhl'
alias sa='s $__rsc__dotfiles_dir/spacemacs/spacemacs.el'
alias q='exit'
alias va='v $__rsc__dotfiles_dir/vim/vimrc.vim'
alias vl='v $__rsc__vimrc'

function cl() {
  cd $1
  ll
}

function cn() {
  mkdir -p "$1" && cd "$1";
}

function e() {
  if [ -z "$1" ]; then
    __rsc__filebrowser .
  else
    __rsc__filebrowser "$1" # $(eval "echo $PWD/$1 $__rsc__to_native_path")
  fi
}

function ra() {
  eval $1
  reload
}

function rb() {
  reload
  eval $1
}

function reload() {
  beforedir=$PWD
  unalias -a 
  source ~/.bash_profile 1>/dev/null
  cd $beforedir
  beforedir=
}

function s() {
    if [ -z "$1" ]
    then
        echo "Must supply a filename: s file.txt"
    else
        emacsclient -n -q -a='runemacs' $1 &!
        disown
    fi
}

