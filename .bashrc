#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias l='ls --color=auto'
alias ll='ls -l --color=auto'
alias la='ls -a --color=auto'
alias v='vim'
alias grep='grep --color=auto'
alias cff='clear && fastfetch'
PS1='\[\e[32m\]\u@\h:\[\e[34m\]\w\[\e[31m\]\$ \[\e[0m\]'
eval "$(zoxide init bash)"
