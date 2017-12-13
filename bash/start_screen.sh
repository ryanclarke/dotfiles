lines=$(tput lines)
cols=$(tput cols)

headertxt=~/dotfiles/bash/start_screen.txt
headerlines=$(wc -l < $headertxt)
headercols=$(wc -L < $headertxt)

headertopline=$(($(($lines - $headerlines)) / 2))
headerleftcol=$(($(($cols - $headercols)) / 2))

tput cup $headertopline 0
cat $headertxt | awk -v leftcolumn="$(tput cuf $headerleftcol)" -v color="$(tput setaf 6)" -v reset="$(tput sgr0)" '{ print color leftcolumn $0 reset }'

tput cup $(($lines - 3)) 0


