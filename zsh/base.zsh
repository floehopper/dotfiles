source ~/.zsh/prompt.zsh
source ~/.zsh/history.zsh
source ~/.zsh/aliases.zsh
source ~/.zsh/completion.zsh

# Instructions from `brew install zsh` output
# "Add the following to your zshrc to access the online help:"
unalias run-help
autoload run-help
HELPDIR=/usr/local/share/zsh/help
