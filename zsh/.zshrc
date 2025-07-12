export ZSH=~/.oh-my-zsh

ZSH_THEME="agnoster"

plugins=(git docker brew tmux)

source $ZSH/oh-my-zsh.sh

export EDITOR='nvim'

alias ws='cd ~/workspace'
alias reload-zsh='source ~/.zshrc'
