#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# alias ls='ls --color=auto'
alias c=clear
alias ..='cd ..'
alias ip='ip -color=auto'
alias grep='grep --color=auto'
alias ls='exa --icons'

PS1='[\u@\h \W]\$ '
eval "$(starship init bash)"

source /home/krivah/.config/broot/launcher/bash/br
