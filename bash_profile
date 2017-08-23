export EDITOR="atom -f"
export GIT_EDITOR="atom -w"

# Prevent less from escaping xterm color control
# characters that appear in Rails log file
export LESS="-R"

eval "$(rbenv init -)"

export PATH="./.bundle/bin:./node_modules/.bin:/Users/jamesmead/bin:$PATH"

if [ -f ~/.bashrc ]; then . ~/.bashrc; fi


# added by Anaconda3 4.1.1 installer
# export PATH="/Users/jamesmead/Code/continuum/anaconda3/bin:$PATH"
