# make atom the default editor
# keep the main process in the foreground
export EDITOR="atom --foreground"

# Prevent less from escaping xterm color control
# characters that appear in Rails log file
export LESS="-R"

export PATH="/usr/local/sbin:$PATH"
export PATH="/System/Library/CoreServices:$PATH"
export PATH="/Users/jamesmead/bin:$PATH"
export PATH="/usr/local/heroku/bin:$PATH"
export PATH="./node_modules/.bin:$PATH"
export PATH="./.bundle/bin:$PATH"
