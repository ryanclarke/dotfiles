#!/bin/sh

function __rsc__windows_vars() {
  alias __rsc__filebrowser='explorer '
  alias __rsc__ls_color='ls --color '
  alias __rsc__vim='gvim '
  alias __rsc__vimrc='~/_vimrc '
  alias __rsc__vim_dir='~/vimfiles/ '
}

function __rsc__linux_vars() {
  alias __rsc__filebrowser='nautilus '
  alias __rsc__ls_color='ls --color '
  alias __rsc__vim='gvim '
  alias __rsc__vimrc='~/.vimrc '
  alias __rsc__vim_dir='~/.vim/ '
}

function __rsc__osx_vars() {
  alias __rsc__filebrowser='open '
  alias __rsc__ls_color='ls -G '
  alias __rsc__vim='mvim '
  alias __rsc__vimrc='~/.vimrc '
  alias __rsc__vim_dir='~/.vim/ '
}

function __rsc__set_os() {
  __rsc__os="$(uname)"
  case "$__rsc__os" in
    *_NT* )
      __rsc__windows_vars;;
    Linux )
      __rsc__linux_vars;;
    Darwin )
      __rsc__osx_vars;;
  esac
}

__rsc__set_os

