export EDITOR="mate -w"

# don't escape colours in Rails log file
export LESS="-R"

eval "$(rbenv init -)"

export PATH="./.bundle/bin:$PATH"
