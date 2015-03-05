. ~/dotfiles/bash/.git_helpers
. ~/dotfiles/bash/.t56_helpers

if [ "$TERM" == "xterm" ]
  then filebrowser='nautilus'
  else filebrowser='explorer'
fi

alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'
alias ......='cd ../../../../../'
alias ba='gvim ~/dotfiles/bash/.bashrc'
alias bl='gvim ~/.bashrc'
alias c-='cd -'
alias cdd='cd /c/dev/'
alias code='cd ~/Documents/Code'
alias df='cd ~/dotfiles'
alias e='$filebrowser . &'
alias h='cd ~'
alias ll='ls -lAh --color'
alias ls='ls -F --color --show-control-chars'
alias q='exit'
alias v='gvim'
alias va='gvim ~/dotfiles/vim/.vimrc'
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
