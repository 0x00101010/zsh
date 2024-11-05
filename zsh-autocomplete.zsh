# all history widgets
zstyle ':autocomplete:*history*:*' insert-unambiguous yes
zstyle ':autocomplete:*' default-context history-incremental-search-backward
zstyle ':autocomplete:*' min-input 3
zstyle ':autocomplete:history-incremental-search-backward:*' list-lines 8
zstyle -e ':autocomplete:*:*' list-lines 'reply=( $(( LINES / 3 )) )'
bindkey -M menuselect '\r' .accept-line
