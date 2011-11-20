# add my functions to the front of the function load path
# so my functions take precedence over any others
fpath=(~/.zsh/functions $fpath)

source ~/.zsh/prompt.zsh
source ~/.zsh/aliases.zsh

# the -U turns off the use of any aliases defined when the function is actually loaded
# this is so that the function doesn't have to worry about whether a command it wants
# to use has been aliased to something else
autoload -U ~/.zsh/functions/*(:t)