#!/bin/sh

function __rsc__common_vars() {
  __rsc__dotfiles_dir='~/dotfiles'
}

function __rsc__windows_vars() {
  alias gvim='/c/bin/Vim/Vim74/gvim.exe '
  alias __rsc__filebrowser='explorer '
  alias __rsc__ls_color='ls --color '
  alias __rsc__vim='gvim '
  __rsc__vimrc='~/_vimrc'
  __rsc__vim_dir='~/vimfiles'
  __rsc__dev_dir='/c/dev'
  __rsc__to_native_path="| sed -e 's/^\///' -e 's/\//\\\\/g' -e 's/^./\0:/'" 
}

function __rsc__linux_vars() {
  alias __rsc__filebrowser='nautilus '
  alias __rsc__ls_color='ls --color '
  alias __rsc__vim='gvim '
  __rsc__vimrc='~/.vimrc'
  __rsc__vim_dir='~/.vim'
  __rsc__dev_dir='~/dev'
  __rsc__to_native_path="" 
}

function __rsc__osx_vars() {
  alias __rsc__filebrowser='open '
  alias __rsc__ls_color='ls -G '
  alias __rsc__vim='mvim '
  __rsc__vimrc='~/.vimrc'
  __rsc__vim_dir='~/.vim'
  __rsc__dev_dir='~/dev'
  __rsc__to_native_path="" 
}

function __rsc__set_os() {
  __rsc__os="$(uname)"
  case "$__rsc__os" in
    *_NT* )
      __rsc__common_vars
      __rsc__windows_vars
      ;;
    Linux )
      __rsc__common_vars
      __rsc__linux_vars
      ;;
    Darwin )
      __rsc__common_vars
      __rsc__osx_vars
      ;;
  esac
}

__rsc__set_os

