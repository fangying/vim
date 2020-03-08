
# User specific aliases and functions
alias ll='ls -lGh '
alias l='ls -laGh'
alias lsa='ls -lahG'
alias md='mkdir -p'
alias wget='wget --no-check-certificate '

alias cdf='cd ~/code/fang'
alias cdc='cd ~/code'
alias cdq='cd ~/code/opensource/qemu'
alias cdl='cd ~/code/opensource/linux'
alias cdw='cd ~/Workspace'
alias cdo='cd ~/code/opensource'

alias ..='cd ..'
alias ...='cd ../..'

# enable the default zsh completions!
autoload -Uz compinit && compinit

zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash
fpath=(~/.zsh $fpath)
