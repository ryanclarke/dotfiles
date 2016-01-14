#!/bin/sh

[[ $PATH == *"$(echo ~/dotfiles/bin)"* ]] || export PATH=$PATH:~/dotfiles/bin

. ~/dotfiles/bash/os_vars.sh
. ~/dotfiles/bash/git_helpers.sh

function v() {
  __rsc__vim $1 &
}

alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'
alias ......='cd ../../../../../'
alias ba='v $__rsc__dotfiles_dir/bash/bash_profile.sh'
alias bl='v ~/.bash_profile'
alias c-='cd -'
alias cdd='cd $(eval echo $__rsc__dev_dir)'
alias df='cd $(eval echo $__rsc__dotfiles_dir)'
alias la='__rsc__ls_color -F'
alias ll='__rsc__ls_color -AFhl'
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
    __rsc__filebrowser $(eval "echo $PWD/$1 $__rsc__to_native_path")
  fi
}

function ra() {
  eval $1
  reload
}

function reload() {
  beforedir=$PWD
  unalias -a 
  source ~/.bash_profile 1>/dev/null
  cd $beforedir
  beforedir=
}

