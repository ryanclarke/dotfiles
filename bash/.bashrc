. ~/dotfiles/bash/.git_helpers
. ~/dotfiles/bash/.forum_helpers

if [ "$TERM" == "xterm" ]
  then filebrowser='nautilus'
  else filebrowser='explorer'
fi

alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'
alias ......='cd ../../../../../'
alias bg='gvim ~/dotfiles/bash/.bashrc'
alias bl='gvim ~/.bashrc'
alias c-='cd -'
alias df='cd ~/dotfiles'
alias e='$filebrowser . &'
alias h='cd ~'
alias j='cd C:/Projects/fcu-mobile-android-tablet'
alias ll='ls -lAh --color'
alias ls='ls -F --color --show-control-chars'
alias q='exit'
alias v='gvim'
alias vg='gvim ~/dotfiles/vim/.vimrc'

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
