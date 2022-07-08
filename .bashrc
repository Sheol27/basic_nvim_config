#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

if [ -f ~/.bash_aliases ]; then
. ~/.bash_aliases
fi


PS1="\[$(tput bold)\]\[\033[38;5;75m\]\u\[$(tput sgr0)\]\\$: \[$(tput sgr0)\]\[\033[38;5;72m\]\w\[$(tput sgr0)\] \[$(tput sgr0)\]\[$(tput bold)\]\[\033[38;5;167m\]>\[$(tput sgr0)\] \[$(tput sgr0)\]"
