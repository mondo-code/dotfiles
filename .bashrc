# .bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export PATH="/usr/local/bin:$PATH"

alias v='vim'
alias ls='ls --color=auto'
alias l='ls'
alias ll='ls -l'
alias la='ls -a'
alias cff='clear && fastfetch'
PS1='[\e[0;31m\u\e[m@\e[0;32m\h\e[m] \W \$ '
eval "$(zoxide init bash)"
