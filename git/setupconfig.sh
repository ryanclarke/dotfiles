#!/bin/sh

# === USER INFO ===
git config --global user.useconfigonly true
git config --global user.name "Ryan Clarke"
git config --global --unset user.email
git config --global github.user "ryanclarke"

# === ALIASES ===
git config --global --remove-section alias

git config --global alias.alias '!git config -l --show-origin | grep alias'
git config --global alias.aa 'add -A'
git config --global alias.amend 'commit --amend --reset-author --no-edit'
git config --global alias.ap 'add -p'
git config --global alias.b 'branch -a'
git config --global alias.currentbranch 'rev-parse --abbrev-ref HEAD'
git config --global alias.c 'commit -m'
git config --global alias.ca 'commit -am'
git config --global alias.cd 'checkout develop'
git config --global alias.cl 'checkout -'
git config --global alias.cm 'checkout master'
git config --global alias.co 'checkout'
git config --global alias.committers 'shortlog -es --no-merges'
git config --global alias.cz 'checkout zzz'
git config --global alias.d 'diff -b'
git config --global alias.dh 'diff -b HEAD'
git config --global alias.dm 'diff -b master'
git config --global alias.dsh 'diff -b --stat HEAD'
git config --global alias.dsm 'diff -b --stat master'
git config --global alias.dt 'difftool'
git config --global alias.email 'config --local user.email'
git config --global alias.emailpersonal 'config --local user.email ryan@ryanclarke.net'
git config --global alias.emailsep 'config --local user.email rsclarke@sep.com'
git config --global alias.f 'fetch --all -p'
git config --global alias.history 'log --graph --full-history --color'
git config --global alias.k '!gitk --all'
git config --global alias.leaderboard 'shortlog -nes --no-merges'
git config --global alias.localdead '!git branch -vv | grep ": gone]" | cut -c 3- | cut -d" " -f1'
git config --global alias.localdead-obliterate '!git localdead | xargs git branch -D'
git config --global alias.localdead-remove '!git localdead | xargs git branch -d'
git config --global alias.localonly '!git branch -vv | grep -v "\[origin/" | cut -c 3- | cut -d" " -f1'
git config --global alias.localtracked '!git branch -vv | grep "\[origin/" | grep -v ": gone]" | cut -c 3- | cut -d" " -f1'
git config --global alias.pushnew '!git push --set-upstream origin `git currentbranch`'
git config --global alias.rb 'rebase'
git config --global alias.rbm 'rebase master'
git config --global alias.s 'status --short --branch'
git config --global alias.sh 'show --name-status'
git config --global alias.t 'tag -l'
git config --global alias.up '!git fetch --all -p; git merge --ff-only @{u}'

# === SETTINGS ===
git config --global core.excludesfile "~/dotfiles/git/gitignore_global.txt"
git config --global difftool.prompt false
git config --global format.pretty "%C(red)%h%C(reset) %ad %C(bold blue)%<(19,trunc)%ae%C(reset)%C(yellow)%d%C(reset) %s"
git config --global log.date short
git config --global merge.ff only
git config --global mergetool.prompt false
git config --global pull.ff only
git config --global push.default simple
git config --global status.showUntrackedFiles all

