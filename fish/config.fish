# opam configuration
source /home/eniehack/.opam/opam-init/init.fish > /dev/null 2> /dev/null; or true

#hledger config
export LEDGER_FILE=~/ledger/hledger.journal

# starship config
starship init fish | source

# xfs rm config
# alias rm="mv $argv /tmp/"
abbr -a rm "mv -t /tmp/"

# vim : set ft=fish :
