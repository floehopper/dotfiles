# make atom the default editor
# keep the main process in the foreground
export EDITOR="atom --foreground"

# Prevent less from escaping xterm color control
# characters that appear in Rails log file
export LESS="-R"

export PATH="./.bundle/bin:./node_modules/.bin:/Users/jamesmead/bin:$PATH"

if [ -f ~/.bashrc ]; then . ~/.bashrc; fi
