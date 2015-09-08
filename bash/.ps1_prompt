### GIT SYMBOLS
# $ (yellow) -- stashed objects
# t (red)    -- untracked files
# u (yellow) -- uncommitted changes
# x (red)    -- HEAD isn't a valid object
# s (green)  -- changes staged

### COLORS

# Reset
Color_Off='\[\e[0m\]'       # Text Reset

# Regular Colors
Black='\[\e[0;30m\]'        # Black
Red='\[\e[0;31m\]'          # Red
Green='\[\e[0;32m\]'        # Green
Yellow='\[\e[0;33m\]'       # Yellow
Blue='\[\e[0;34m\]'         # Blue
Purple='\[\e[0;35m\]'       # Purple
Cyan='\[\e[0;36m\]'         # Cyan
White='\[\e[0;37m\]'        # White

# Bold
BBlack='\[\e[1;30m\]'       # Black
BRed='\[\e[1;31m\]'         # Red
BGreen='\[\e[1;32m\]'       # Green
BYellow='\[\e[1;33m\]'      # Yellow
BBlue='\[\e[1;34m\]'        # Blue
BPurple='\[\e[1;35m\]'      # Purple
BCyan='\[\e[1;36m\]'        # Cyan
BWhite='\[\e[1;37m\]'       # White

# Underline
UBlack='\[\e[4;30m\]'       # Black
URed='\[\e[4;31m\]'         # Red
UGreen='\[\e[4;32m\]'       # Green
UYellow='\[\e[4;33m\]'      # Yellow
UBlue='\[\e[4;34m\]'        # Blue
UPurple='\[\e[4;35m\]'      # Purple
UCyan='\[\e[4;36m\]'        # Cyan
UWhite='\[\e[4;37m\]'       # White

# Background
On_Black='\[\e[40m\]'       # Black
On_Red='\[\e[41m\]'         # Red
On_Green='\[\e[42m\]'       # Green
On_Yellow='\[\e[43m\]'      # Yellow
On_Blue='\[\e[44m\]'        # Blue
On_Purple='\[\e[45m\]'      # Purple
On_Cyan='\[\e[46m\]'        # Cyan
On_White='\[\e[47m\]'       # White

# High Intensity
IBlack='\[\e[0;90m\]'       # Black
IRed='\[\e[0;91m\]'         # Red
IGreen='\[\e[0;92m\]'       # Green
IYellow='\[\e[0;93m\]'      # Yellow
IBlue='\[\e[0;94m\]'        # Blue
IPurple='\[\e[0;95m\]'      # Purple
ICyan='\[\e[0;96m\]'        # Cyan
IWhite='\[\e[0;97m\]'       # White

# Bold High Intensity
BIBlack='\[\e[1;90m\]'      # Black
BIRed='\[\e[1;91m\]'        # Red
BIGreen='\[\e[1;92m\]'      # Green
BIYellow='\[\e[1;93m\]'     # Yellow
BIBlue='\[\e[1;94m\]'       # Blue
BIPurple='\[\e[1;95m\]'     # Purple
BICyan='\[\e[1;96m\]'       # Cyan
BIWhite='\[\e[1;97m\]'      # White

# High Intensity backgrounds
On_IBlack='\[\e[0;100m\]'   # Black
On_IRed='\[\e[0;101m\]'     # Red
On_IGreen='\[\e[0;102m\]'   # Green
On_IYellow='\[\e[0;103m\]'  # Yellow
On_IBlue='\[\e[0;104m\]'    # Blue
On_IPurple='\[\e[0;105m\]'  # Purple
On_ICyan='\[\e[0;106m\]'    # Cyan
On_IWhite='\[\e[0;107m\]'   # White

### SYMBOL DEFINITIONS

GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWSTASHSTATE=1
GIT_PS1_SHOWUNTRACKEDFILES=1
GIT_PS1_STASHED_INDICATOR="${Yellow}\$${Color_Off}"
GIT_PS1_UNTRACKED_INDICATOR="${Red}t${Color_Off}"
GIT_PS1_UNCOMMITTED_INDICATOR="${Yellow}u${Color_Off}"
GIT_PS1_BOMB_INDICATOR="${Red}x${Color_Off}"
GIT_PS1_STAGED_INDICATOR="${Green}s${Color_Off}"

### WORKING DIRECTORY
WorkingDirectory="\W"

### GIT PROMPT
my_git_prompt()
{
    GitPrompt="\w"
    AreWeInRepository=$(__gitdir)

    if [[ -n $AreWeInRepository ]]; then
	WorkingRepositoryName=$(git rev-parse --show-toplevel | awk -F/ '{print $NF}')
	WorkingRepositoryCwd=$(git rev-parse --show-prefix)
	WorkingBranch=""
	UntrackedIndicator=""
	StashIndicator=""
	UncommittedIndicator=""
	StagedIndicator=""
	GitStatus=""

	b="$(git symbolic-ref HEAD 2>/dev/null)" || {
	    
	    b="$(
		 case "${GIT_PS1_DESCRIBE_STYLE-}" in
		 (contains)
		   git describe --contains HEAD ;;
		 (branch)
		   git describe --contains --all HEAD ;;
		 (describe)
		   git describe HEAD ;;
		 (* | default)
		   git describe --tags --exact-match HEAD ;;
		 esac 2>/dev/null)" ||
	    
	    b="$(cut -c1-7 "$g/HEAD" 2>/dev/null)..." ||
	    b="unknown"
	    b="($b)"
	}
	WorkingBranch="${b##refs/heads/}"


	git rev-parse --verify refs/stash >/dev/null 2>&1 && StashIndicator=$GIT_PS1_STASHED_INDICATOR

	if [ -n "$(cd `__gitdir` && cd .. && git ls-files --others --exclude-standard)" ]; then
	    UntrackedIndicator=$GIT_PS1_UNTRACKED_INDICATOR
	fi

	if [ "$(git config --bool bash.showDirtyState)" != "false" ]; then
	    git diff --no-ext-diff --quiet --exit-code || UncommittedIndicator=$GIT_PS1_UNCOMMITTED_INDICATOR
	    if git rev-parse --quiet --verify HEAD >/dev/null; then
		git diff-index --cached --quiet HEAD -- || StagedIndicator=$GIT_PS1_STAGED_INDICATOR
	    else
		StagedIndicator=$GIT_PS1_BOMB_INDICATOR
	    fi
	fi

	if [[ -n $StagedIndicator || -n $StashIndicator || -n $UncommittedIndicator || -n $UntrackedIndicator ]]
	then
	    GitStatus="("

	    [[ -n $StagedIndicator ]] && GitStatus="${GitStatus}${GIT_PS1_STAGED_INDICATOR}"
	    [[ -n $StashIndicator ]] && GitStatus="${GitStatus}${GIT_PS1_STASHED_INDICATOR}"
	    [[ -n $UncommittedIndicator ]] && GitStatus="${GitStatus}${GIT_PS1_UNCOMMITTED_INDICATOR}"
	    [[ -n $UntrackedIndicator ]] && GitStatus="${GitStatus}${GIT_PS1_UNTRACKED_INDICATOR}"

	    GitStatus="${GitStatus})"
	else
	    GitStatus="(${Green}+${Color_Off})"
	fi

	if [[ -z ${WorkingRepositoryCwd} ]]
	then
	   WorkingRepositoryCwd="/"
	fi

	GitPrompt="\n(${BGreen}Git${Color_Off})[${BPurple}${WorkingRepositoryName}${Color_Off}] ${BYellow}${WorkingRepositoryCwd}${Color_Off}\n(${BIWhite}${WorkingBranch}${Color_Off})${GitStatus}"
    fi

    echo $GitPrompt
}

PROMPT_COMMAND='PS1="${BBlue}[\u@\h]${Color_Off}$(my_git_prompt)\$ "'
