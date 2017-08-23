export EDITOR="atom -f"
export GIT_EDITOR="atom -w"

# Prevent less from escaping xterm color control
# characters that appear in Rails log file
export LESS="-R"

eval "$(rbenv init -)"

# added by Anaconda3 4.1.1 installer
# export PATH="/Users/jamesmead/Code/continuum/anaconda3/bin:$PATH"

export PATH="/usr/local/sbin:$PATH"
export PATH="/System/Library/CoreServices:$PATH"
export PATH="/Users/jamesmead/bin:$PATH"
export PATH="/usr/local/heroku/bin:$PATH"
export PATH="./node_modules/.bin:$PATH"
export PATH="./.bundle/bin:$PATH"
