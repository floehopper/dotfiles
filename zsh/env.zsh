export EDITOR="atom -f"

# Prevent less from escaping xterm color control
# characters that appear in Rails log file
export LESS="-R"

eval "$(rbenv init -)"

export PATH="/usr/local/sbin:$PATH"
export PATH="/System/Library/CoreServices:$PATH"
export PATH="/Users/jamesmead/bin:$PATH"
export PATH="/usr/local/heroku/bin:$PATH"
export PATH="./node_modules/.bin:$PATH"
export PATH="./.bundle/bin:$PATH"
