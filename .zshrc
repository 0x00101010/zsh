# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  virtualenv
  asdf
)

source $ZSH/oh-my-zsh.sh

[[ -s "$HOME/.zsh/home.zsh" ]] && source "$HOME/.zsh/home.zsh"                          # load home specific variables
[[ -s "$HOME/.zsh/local.zsh" ]] && source "$HOME/.zsh/local.zsh"                        # load environment variables and secret keys
[[ -s "$HOME/.zsh/scripts.zsh" ]] && source "$HOME/.zsh/scripts.zsh"                    # load functions
[[ -s "$HOME/.zsh/alias.zsh" ]] && source "$HOME/.zsh/alias.zsh"                        # load aliases
[[ -s "$HOME/.zsh/ctrl-z.zsh" ]] && source "$HOME/.zsh/ctrl-z.zsh"                      # load ctrl-z command
[[ -s "$HOME/.zsh/zsh-autocomplete.zsh" ]] && source "$HOME/.zsh/zsh-autocomplete.zsh"  # load zsh-autocomplete
[[ -s "$HOME/.zsh/key-binding.zsh" ]] && source "$HOME/.zsh/key-binding.zsh"            # load key bindings
[[ -s "$HOME/.zsh/devnet.zsh" ]] && source "$HOME/.zsh/devnet.zsh"                        # load devnet development related helpers

[[ -s "$HOME/.zsh/cb.zsh" ]] && source "$HOME/.zsh/cb.zsh"                              # load cb env vars
[[ -s "$HOME/.zsh/salus.zsh" ]] && source "$HOME/.zsh/salus.zsh"                        # load salus command
export XCODE_13_UPGRADE=true

# setup ASDF
export PATH="${ASDF_DATA_DIR-$HOME/.asdf}/shims:$PATH"

if which go &> /dev/null; then
  export PATH="$(go env GOPATH)/bin:$PATH"
fi

# if which cargo &> /dev/null; then
#   export PATH="$(asdf where rust)/bin:$HOME/.cargo/bin:$PATH"
# fi

# helping with prysm tests
export CGO_CFLAGS="-O2 -D__BLST_PORTABLE__"

# pnpm
export PNPM_HOME="/Users/francisli/Library/pnpm"
case ":$PATH:" in
*":$PNPM_HOME:"*) ;;
*) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# If you come from bash you might have to change your $PATH.
# export PATH="/opt/homebrew/opt/gnu-tar/libexec/gnubin:$PATH"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f .p10k.zsh ]] || source .p10k.zsh

# To customize prompt, run `p10k configure` or edit ~/.zsh/.p10k.zsh.
[[ ! -f ~/.zsh/.p10k.zsh ]] || source ~/.zsh/.p10k.zsh
