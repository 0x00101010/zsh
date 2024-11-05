export EDITOR='vim'

# editing config
alias ez="$EDITOR ~/.zshrc"     # alias for Edit Zshrc
alias ea="$EDITOR ~/.alias.zsh" # alias for Edit Alias
alias el="$EDITOR ~/.local.zsh" # alias for Edit Local
alias sz='source ~/.zshrc'      # alias for Source Zsh

# bookmarks
alias @tmp='cd ~/tmp'
alias @downloads='cd ~/Downloads'
alias @src='cd ~/src'
alias @repo='cd ~/src/monorepo'
alias @monorail='cd ~/src/coinbase'
alias @tfs='cd ~/src/tx_service'

# directory related
alias ls='ls -G'      # ls with color
alias l='ls -1A'      # list directory
alias ll='ls -lah'    # list directory with additional information
alias ..='..'         # move up by one directory
alias ...='../..'     # move up by two directories
alias ....='../../..' # move up by three directories

# applications
alias tree='cb-tree -C'
alias d='docker'
alias dc='docker-compose'
alias v='nvim'
alias y='yarn'
alias m='make'

# create and delete files/folders
alias t='touch'   # create file
alias md='mkdir'  # make directory
alias rd='rm -rf' # remove directory and file

# misc.
alias q='exit'                                                                                # vim like quit command to close terminal pane
alias c='clear'                                                                               # clear terminal
alias o='open'                                                                                # open file or chrome with full url
alias myip="ifconfig | sed -En 's/127.0.0.1//;s/.*inet (addr:)?(([0-9]*\.){3}[0-9]*).*/\2/p'" # show my ip
alias pingg='ping www.google.com'                                                             # See network speed against google.com

# git
alias g='git'

# Commit Management
alias ga='git add'
alias gu='git unadd' # git config --global alias.unadd reset HEAD
alias grb='git rebase'
alias gcp='git cherry-pick'
alias gca='git commit -v --amend'
alias gc='git commit'
alias gempty="git commit --allow-empty -m 'empty'"
alias gps='git push origin $(git branch --show-current)'
alias gpu='git pull origin $(git branch --show-current)'
alias gpsf='git push francis $(git branch --show-current)'

# Branch Management
alias gb='git --no-pager branch' # make _git_push_auto_branch_local
alias gr='git remote -v'
alias gf='git fetch'
alias gfa='git fetch --all'

alias gco='git checkout'
alias gcob="git checkout -b"
alias gp='_git_push_auto_branch' # git push to origin on current branch if no argument specified. Otherwise, git push to specified remote. (from cb-zsh)
alias gprune="git remote prune origin | grep -o '\[pruned\] origin\/.*$' | sed -e 's/\[pruned\] origin\///' | xargs git branch -D"
alias gpum='git pull upstream master'
alias gpumain='git pull upstream main'
alias gpud='git pull upstream develop'
alias gpom='git pull origin master'
alias gpomain='git pull origin main'
alias gpod='git pull origin develop'

# Experimental
alias gpop='git reset --soft head^ && git unadd :/'
alias gsave='git add :/ && git commit -m "save point"'

# Git Status
alias gs='git status -sb' # short and concise
alias gst='git status'

# Git Log
alias gl="_git_commit_all"
alias gll='git log --stat'     # git log with file info
alias glll='git log --stat -p' # git log with file info + content

# Git Commits
alias glc='_git_commit_diff' # show commits diff against (upstream|origin)/master (from cb-zsh)

# Git Diff
alias gd='git diff HEAD'

# Git Reset
alias grhh='git reset --hard HEAD'

# Fuzzyhub
alias fco='fh checkout'
alias fcop='fh checkout-pr'
alias fsm='fh sync-master'
alias fpr='fh view-pr'
alias fm='fh view-master'
alias fl='fh view-local'

# Docker
alias dc='docker compose'
alias de='docker exec -it'
alias dl='docker logs'
alias dp='docker ps'
alias dpg='docker ps | grep'

alias protoc='protoc --proto_path=./third_party'
