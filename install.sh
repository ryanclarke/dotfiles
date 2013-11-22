#!/bin/bash

bashrc_caller="if [ -f ~/dotfiles/bash/.bashrc ]; then . ~/dotfiles/bash/.bashrc; fi"
first_line=`head -n 1 ~/.bashrc`
if [ "$first_line" != "$bashrc_caller" ]; then
  echo $bashrc_caller > $TMP/temp_bash.txt
fi
cat ~/.bashrc >> $TMP/temp_bash.txt
mv $TMP/temp_bash.txt ~/.bashrc
source ~/dotfiles/vim/.vimrc

vimrc_caller="source ~/dotfiles/vim/.vimrc"
first_line=`head -n 1 ~/_vimrc`
if [ "$first_line" != "$vimrc_caller" ]; then
  echo $vimrc_caller > $TMP/temp_vim.txt
fi
cat ~/_vimrc >> $TMP/temp_vim.txt
mv $TMP/temp_vim.txt ~/_vimrc

