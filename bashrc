# make atom the default editor
# keep the main process in the foreground
export EDITOR="atom --foreground"

# Prevent less from escaping xterm color control
# characters that appear in Rails log file
export LESS="-R"

alias ls="ls -l"

# depends on git
alias s="git st"
alias c="git ci"
alias a="git add"
alias d="git diff"
