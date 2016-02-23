__rsc__rulechars="········································································································································································································"

__ps1__STATUS="[ DOTFILES - ... ]"
__ps1__STATUSLENGTH="$(echo $__ps1__STATUS | wc -c)"

function df_status {
    local dfs="DOTFILES -"
    local revs="$(cd ~/dotfiles; git rev-list --left-right master...origin/master --)"

    [[ $(cd ~/dotfiles; git status --short | wc -l) -gt 0 ]] && dfs="${dfs} {UNCOMMITTED}"
    [[ $(grep -c '<' <<< ${revs}) -gt 0 ]] && dfs="${dfs} {AHEAD}"
    [[ $(grep -c '>' <<< ${revs}) -gt 0 ]] && dfs="${dfs} {BEHIND}"
    [[ "${dfs}" == "DOTFILES -" ]] && dfs="${dfs} {CURRENT}"

    echo "${dfs}"
}

function prompt_command_update_df_stats {
  if [ -z "$__ps1__timestamp" ] ; then
    __ps1__timestamp="$(date -d '2 hour ago' +%s)"
  fi
  local timeouttime="$(date -d '1 hour ago' +%s)"
  if [ $__ps1__timestamp -lt $timeouttime ] ; then #if it's less than, it's older
    echo "$(df_status)" > ~/dotfiles/.ps1df
    __ps1__timestamp="$(date +%s)"
  fi
}

function prompt_command {
  [[ -a ~/dotfiles/.ps1df ]] || touch ~/dotfiles/.ps1df

  reset="\[\033[0m\]"
  red="\[\033[31m\]"
  gray="\[\033[1;30m\]"
  yellow="\[\033[33m\]"
  cyan="\[\033[36m\]"
  blue="\[\033[34m\]"
  bluebackground="\[\033[44m\]"

  __ps1__STATUS="[ $(<~/dotfiles/.ps1df) ]"
  __ps1__STATUSLENGTH=$(echo ${__ps1__STATUS} | wc -c)

  let "rulelength = $(tput cols) - ${__ps1__STATUSLENGTH} - 8 - 3"
  horizontal_rule="${__rsc__rulechars:0:$rulelength}"

  __ps1__blue_line="${bluebackground}${__ps1__STATUS}${reset}${blue}▓▒░${reset}"
  TIME="${gray}\A${reset}"
  HRULE="${gray}${horizontal_rule}${reset}"
  COMMANDNUMBER="${red}{${gray}!\!${red}}${reset}"
  GITBRANCH="${cyan}$(__git_ps1)${reset}"
  CURRENTPATH="${yellow}\w${reset}"

  export PS1="\n${__ps1__blue_line} ${HRULE} ${TIME}\n${COMMANDNUMBER}${GITBRANCH} ${CURRENTPATH}$ ${reset}"

  prompt_command_update_df_stats &
  disown
}
export PROMPT_COMMAND=prompt_command

function prompt_command_reset() {
  __ps1__timestamp=
}

