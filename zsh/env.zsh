export EDITOR="mate -w"

# Prevent less from escaping xterm color control
# characters that appear in Rails log file
export LESS="-R"

eval "$(rbenv init -)"

export PATH="./.bundle/bin:./node_modules/.bin:/Users/jamesmead/bin:$PATH"
