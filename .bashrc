#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export PATH=$HOME/go/bin:$PATH
export PATH=$HOME/.config/v-analyzer/bin/:$PATH
export PATH="$HOME/zig-x86_64-linux-0.15.2:$PATH"

alias ls='ls --color=auto'
alias l='ls --color=auto'
alias ll='ls -l --color=auto'
alias la='ls -a --color=auto'
# alias lf='lfrun'
alias grep='grep --color=auto'
alias cff='clear && fastfetch'
alias ta='tmux attach'
alias tn='tmux new'
alias tl='tmux list-sessions'
alias tk='tmux kill-session'
alias nv='nvim'
alias tuia='tuiarchiver tui'
alias jarvis='htop'

PS1='\[\e[1m\]\u@\h:\[\e[34m\]\w\[\e[36m\]\$ \[\e[0m\]'
eval "$(zoxide init bash)"
