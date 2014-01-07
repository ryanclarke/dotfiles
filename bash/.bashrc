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
alias g-='git checkout -'
alias ga='git add -p'
alias gac='git commit -am'
alias gb='git branch -a'
alias gc='git commit -m'
alias gd='git diff'
alias gdt='git difftool'
alias gf='git fetch'
alias ghh='git log --graph --full-history --all --color --pretty=format:"%Cred%h%Creset %ad %C(bold blue)<%an>%Creset%C(yellow)%d%Creset %s" --date=short'
alias gk='gitk --all'
alias glb='git shortlog -sn'
alias gm='git checkout master'
alias gp='git pull'
alias grm='git rebase master'
alias gs='git status'
alias gt='git tag -l'
alias gz='git checkout zzz'
alias h='cd ~'
alias j='cd C:/Projects/fcu-mobile-android-tablet'
alias ll='ls -lAh --color'
alias ls='ls -F --color --show-control-chars'
alias q='exit'
alias v='gvim'
alias vg='gvim ~/.dotfiles/vim/.vimrc'

function cl() {
  cd $1
  ll
}

function cn() {
  mkdir -p "$1" && cd "$1";
}

function gff() {
  if [ $BRANCHNAME != master ]; then
    gm
    git merge --ff -
    gh 10
  fi
}

function gh() {
  if [ -n "$1" ]
    then commitcount="$1"
    else commitcount='20'
  fi
  echo
  echo "####### LAST $commitcount COMMITS #######"
  echo
  ghh | head -n $commitcount | less -E
  echo
}

function gsave() {
  if [ -n "$1" ] ; then
    gac "$1"
    gum
    grm
    gh 10
  fi
}

function gum() {
  BRANCHNAME=`git rev-parse --abbrev-ref HEAD`
  if [ $BRANCHNAME != master ]; then gm; fi
  gf
  gp
  if [ $BRANCHNAME != master ]; then git checkout $BRANCHNAME; fi
}

function ra() {
  eval $1
  reload
}

function reload() {
  unalias -a 
  source $HOME/.bashrc 1>/dev/null
}

