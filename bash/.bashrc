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
alias e='$filebrowser . &'
alias ga='git add -p'
alias gb='git branch -a'
alias gc='git commit -m'
alias gf='git fetch'
alias gh='git log --graph --full-history --all --color --pretty=format:"%Cred%h%Creset %ad %C(bold blue)<%an>%Creset%C(yellow)%d%Creset %s" --date=short'
alias gl='git checkout -'
alias gm='git checkout master'
alias gp='git pull'
alias gs='git status'
alias h='cd ~'
alias j='cd C:/Projects/fcu-mobile-android-tablet'
alias ll='ls -lAh --color'
alias ls='ls -F --color --show-control-chars'
alias q='exit'
alias reload='source $HOME/.bashrc 1>/dev/null'
alias v='gvim'
alias vg='gvim ~/.dotfiles/vim/.vimrc'

function cl() {
  cd $1
  ls
}

function gum() {
  BRANCHNAME=`git rev-parse --abbrev-ref HEAD`
  if [ $BRANCHNAME != master ]; then gm; fi
  gf
  gp
  if [ $BRANCHNAME != master ]; then git checkout $BRANCHNAME; fi
}

function mcd() {
  mkdir -p "$1" && cd "$1";
}

function ra() {
  eval $1
  reload
}
