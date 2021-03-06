#!/bin/sh

function source_vimrc() {
  vimrc_caller="source ~/dotfiles/vim/vimrc.vim"
  pathogen="execute pathogen#infect()"
  echo "$pathogen" >> $(eval echo $__rsc__vimrc)
  echo "$vimrc_caller" >> $(eval echo $__rsc__vimrc)
}

function install_vim_plugins() {
  mkdir -p $(eval echo $__rsc__vim_dir/autoload) $(eval echo $__rsc__vim_dir/bundle)
  curl -LSso $(eval echo $__rsc__vim_dir/autoload/pathogen.vim https://tpo.pe/pathogen.vim)
  git clone https://github.com/scrooloose/nerdtree.git $(eval echo $__rsc__vim_dir/bundle/nerdtree)
}

source_vimrc
install_vim_plugins

