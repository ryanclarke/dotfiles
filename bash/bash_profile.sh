#!/bin/sh

. ~/dotfiles/bash/os_vars.sh
. ~/dotfiles/bash/git_helpers.sh

alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'
alias ......='cd ../../../../../'
alias ba='__rsc__vim ~/dotfiles/bash/bash_profile.sh &'
alias bl='__rsc__vim ~/.bash_profile
alias c-='cd -'
alias cdd='cd /c/dev/'
alias df='cd ~/dotfiles'
alias e='__rsc__filebrowser . &'
alias h='cd ~'
alias la='__rsc__ls_color -F'
alias ll='__rsc__ls_color -AFhl'
alias q='exit'
alias v='__rsc__vim'
alias va='__rsc__vim ~/dotfiles/vim/vimrc.vim &'
alias vl='__rsc__vim __rsc__vimrc'
alias x='__rsc__filebrowser '

function cl() {
  cd $1
  ll
}

function cn() {
  mkdir -p "$1" && cd "$1";
}

function ra() {
  eval $1
  reload
}

function reload() {
  unalias -a 
  source ~/.bash_profile 1>/dev/null
}
