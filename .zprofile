
eval "$(/opt/homebrew/bin/brew shellenv)"

# Added to support JRuby provided by mise
export JAVA_HOME="$(/usr/libexec/java_home)"
export PATH="$JAVA_HOME/bin:$PATH"

# Added to support pipenv when installed for single user using `pip install --user pipenv` for Python provided by mise
export PATH="$HOME/.local/bin:$PATH"

# Make psql available
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"

