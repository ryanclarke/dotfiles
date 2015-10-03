#!/bin/sh

# === USER INFO ===
git config --global user.name "Ryan Clarke"
git config --global user.email "(none)"
git config --global github.user "ryanclarke"

# === ALIASES ===
git config --global --remove-section alias

git config --global alias.aa 'add -A'
git config --global alias.ap 'add -p'
git config --global alias.b 'branch -a'
git config --global alias.currentbranch 'rev-parse --abbrev-ref HEAD'
git config --global alias.c 'commit -m'
git config --global alias.ca 'commit -am'
git config --global alias.cl 'checkout -'
git config --global alias.cm 'checkout master'
git config --global alias.co 'checkout'
git config --global alias.committers 'shortlog -es --no-merges'
git config --global alias.cz 'checkout zzz'
git config --global alias.d 'diff'
git config --global alias.dh 'diff HEAD'
git config --global alias.dm 'diff master'
git config --global alias.dsh 'diff --stat HEAD'
git config --global alias.dsm 'diff --stat master'
git config --global alias.dt 'difftool'
git config --global alias.email 'config --local user.email'
git config --global alias.emailpersonal 'config --local user.email ryan@ryanclarke.net'
git config --global alias.emailsep 'config --local user.email rsclarke@sep.com'
git config --global alias.f 'fetch --all -p'
git config --global alias.history 'log --graph --full-history --color --pretty=format:"%Cred%h%Creset %ad %C(bold blue)<%ae>%Creset%C(yellow)%d%Creset %s" --date=short'
git config --global alias.k '!gitk --all'
git config --global alias.leaderboard 'shortlog -nes --no-merges'
git config --global alias.rb 'rebase'
git config --global alias.rbm 'rebase master'
git config --global alias.s 'status'
git config --global alias.t 'tag -l'
git config --global alias.up '!git fetch --all -p; git merge --ff-only @{u}'

# === SETTINGS ===
git config --global core.autocrlf true
git config --global core.excludesfile "~/dotfiles/git/gitignore_global.txt"
git config --global difftool.prompt false
git config --global merge.ff only
git config --global mergetool.prompt false
git config --global pull.ff only
git config --global push.default simple
