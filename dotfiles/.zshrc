# Basic zsh configuration
# Minimal and efficient setup with Starship prompt

# History configuration
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_REDUCE_BLANKS

# Initialize Starship prompt
eval "$(starship init zsh)"

# Useful aliases
alias ll="ls -la"
alias ..="cd .."
alias ...="cd ../.."
alias g="git"
alias gc="git commit"
alias gp="git push"
alias gl="git pull"
alias gs="git status"

# Environment variables
export EDITOR="nvim"
export VISUAL="nvim"
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Basic completion system
autoload -Uz compinit && compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 