#!/bin/sh

__rsc__os="$(uname)"

function source_sh_scripts() {
  bash_profile_caller="if [ -f ~/dotfiles/bash/bash_profile.sh ]; then . ~/dotfiles/bash/bash_profile.sh; fi"
  echo "$bash_profile_caller" >> ~/.bash_profile
}

source_sh_scripts

