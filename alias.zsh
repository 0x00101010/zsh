export EDITOR="vim"

alias l="ls -1AG"
alias ll="ls -lahG"
alias -g ...="../.."
alias -g ....="../../.."

# editing configs
alias ez="$EDITOR ~/.zshrc"
alias ea="$EDITOR ~/.zsh/alias.zsh"
alias el="$EDITOR ~/.zsh/local.zsh"
alias sz="exec zsh"

alias ga="git add"
alias gb="git branch -v"
alias gst="git status"
alias gc="git commit"
alias gd="git diff"
alias gl="git log --oneline"
alias gco="git checkout"
alias gp="git push"

alias k='kubectl'
alias mk='minikube'

alias t="truffle"
alias sshpi="ssh ubuntu@192.168.86.200"
