__rsc__rulechars="········································································································································································································"

function prompt_command {
  reset="\[\033[0m\]"
  red="\[\033[31m\]"
  gray="\[\033[1;30m\]"
  yellow="\[\033[33m\]"
  cyan="\[\033[36m\]"
  blue="\[\033[34m\]"
  bluebackground="\[\033[44m\]"

  if [ -z "$h2wtimestamp" ] ; then 
    h2wtimestamp="`date -d '11 minutes ago' +%s`"
  fi
  local timeouttime="`date -d '10 minutes ago' +%s`"
  if [ $h2wtimestamp -lt $timeouttime ] ; then #if it's less than, it's older
    H2WSTATUS="[ H2W - `h2w quickstats` ]"
    H2WSTATUSLENGTH="$(echo $H2WSTATUS | wc -c)"
    h2wtimestamp="`date +%s`"
  fi

  let "rulelength = $(tput cols) - $H2WSTATUSLENGTH - 8 - 6"
  horizontal_rule="${__rsc__rulechars:0:$rulelength}"

  H2W="$bluebackground$H2WSTATUS$reset$blue▓▒░$reset"
  TIME="$gray\A$reset"
  HRULE="$gray$horizontal_rule$reset"
  COMMANDNUMBER="$red{$gray!\!$red}$reset"
  GITBRANCH="$cyan`__git_ps1`$reset"
  CURRENTPATH="$yellow\w$reset"

  export PS1="\n$H2W $HRULE $TIME\n$COMMANDNUMBER$GITBRANCH $CURRENTPATH$ $reset"
}
export PROMPT_COMMAND=prompt_command

