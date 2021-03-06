#!/bin/sh

. ~/dotfiles/git/setupconfig.sh

function gff() {
  BRANCHNAME=`git currentbranch`
  if [ $BRANCHNAME != master ]; then
    git cm
    git merge --ff -
    gh 10
  fi
  BRANCHNAME=
}

function gr() {
  __rsc__filebrowser $(git config remote.origin.url | sed -e 's_:_/_' -e 's_///_\://_' -e 's_git@_https\://_')
}

function gsave() {
  if [ -n "$1" ] ; then
    gac "$1"
    gum
    git rbm
    gh 10
  fi
}

function gchanges() {
  if [ -n "$1" ]; then
    unit="day"
    if [ -n "$2" ] ; then unit="$2" ; fi
    ago="$1 $unit ago"
    since="--since=\""$(date --date="$ago" -I)"\""
  fi

  git log --pretty=format:"%h %at %ad %ae" --date=short $since --numstat | sed 's/@[^   ]\+\.[a-z]\+//' | awk '{ if ($4) commitdetails = $1 " " $2 " " $3 " " $4; else printf "%s %d %d %d\n", commitdetails, $1, $2, $1+$2 }'

  ago=""
  since=""
  unit=""
}

# accepts: gstime [number [unit of time]]
# returns list: username added removed difference
function gstime() {
  git_change_log=$(gchanges $@ | awk '{ print strftime("%Y-%U", $2), $5, $6, $7 }')
  
  printf "\n\e[0;36m%-10s %6s %6s %6s\e[0m\n" Week Add Remove Total

  git_time_changes=$(for week in $(echo "$git_change_log" | awk '{ print $1 }' | sort | uniq); do
  echo "$git_change_log" | grep ${week} | awk '{ add += $2; remove += $3; total += $4 } END { printf "%-10s %6d %6d %6d\n", $1, add, remove, total }'
  done)

  echo "$git_time_changes"

  git_change_log=""
  git_time_changes=""
}

# accepts: gsuser [number [unit of time]]
# returns list: username added removed difference
function gsuser() {
  git_change_log=$(gchanges $@ | awk '{ print $4, $5, $6, $7 }')

  printf "\n\e[0;36m%-10s %6s %6s %6s\e[0m\n" Committer Add Remove Total

  git_user_changes=$(for committer in $(echo "$git_change_log" | awk '{ print $1 }' | sort | uniq); do
  echo "$git_change_log" | grep ${committer} | awk '{ add += $2; remove += $3; total += $4 } END { printf "%-10s %6d %6d %6d\n", $1, add, remove, total }'
  done)

  echo "$git_user_changes" | sort -gr -k 3

  git_change_log=""
  git_user_changes=""
}

function gscommit() {
  echo
  printf "\e[1;33m%6d  %s\e[0m\n" $(git log --oneline | wc -l ) "Total Commits"
  echo "   ---  -------------"
  git shortlog -se | sed -e 's/[^0-9]*</ /' -e 's/@sep.com>//' | awk '{ printf "%6d  %s\n", $1, $2 }' | sort -gr
  echo
}

function gschart() {
  awk '{ first = $3; second = $2; scale = 150; firstscaled = int(first/scale)+1; secondscaled = int(second/scale)+1; printf "%-8s \033[1;30;4;41m%-*s\033[43m%-*s\033[0m\n\n", $1, firstscaled, first, secondscaled, second }'
}

function gum() {
  BRANCHNAME=`git currentbranch`
  if [ $BRANCHNAME != master ]; then git cm; fi
  git up
  if [ $BRANCHNAME != master ]; then git co $BRANCHNAME; fi
  BRANCHNAME=
}

#returns list: username
function gusers() {
  git committers | sed -e 's/.*<//' -e 's/>//'
}

