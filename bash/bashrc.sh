. ~/dotfiles/bash/git_helpers.sh

if [ "$TERM" == "xterm" ]
  then filebrowser='nautilus'
  else filebrowser='explorer'
fi

alias __rsc__vim='gvim '

alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'
alias ......='cd ../../../../../'
alias ba='__rsc__vim ~/dotfiles/bash/bashrc.sh &'
alias bl='__rsc__vim ~/.bashrc &'
alias c-='cd -'
alias cdd='cd /c/dev/'
alias df='cd ~/dotfiles'
alias e='$filebrowser . &'
alias h='cd ~'
alias ll='ls -lAh --color'
alias ls='ls -F --color --show-control-chars'
alias q='exit'
alias v='__rsc__vim'
alias va='__rsc__vim ~/dotfiles/vim/vimrc.vim &'
alias x='$filebrowser'

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
  source $HOME/.bashrc 1>/dev/null
}
