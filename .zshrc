autoload -Uz compinit
if [[ -n ~/.zcompdump(#qNmh-24) ]]; then
  compinit -C
else
  compinit
fi

zstyle ':completion:*' menu select

autoload -Uz up-line-or-beginning-search
autoload -Uz down-line-or-beginning-search

zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

bindkey '^[[A' up-line-or-beginning-search
bindkey '^[[B' down-line-or-beginning-search

HISTSIZE="10000"
SAVEHIST="10000"

HISTFILE="$HOME/.zsh_history"
mkdir -p "$(dirname "$HISTFILE")"

setopt HIST_FCNTL_LOCK
unsetopt APPEND_HISTORY
setopt HIST_IGNORE_DUPS
unsetopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
unsetopt HIST_EXPIRE_DUPS_FIRST
setopt SHARE_HISTORY
unsetopt EXTENDED_HISTORY

eval "$(mise activate zsh)"
alias z="mise exec -- zed --classic"

ulimit -S -n 2048

alias d="git diff"
alias ls="ls -l"
alias s="git status"

alias bi="bundle install"
alias be="bundle exec"

export EDITOR="vim"
export LESS="-R" # Prevent less from escaping xterm color control chars that appear in Rails log file

export HOMEBREW_NO_ENV_HINTS=1

alias dotfiles='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

eval "$(zed --completions zsh)"

autoload -U promptinit; promptinit
prompt pure
