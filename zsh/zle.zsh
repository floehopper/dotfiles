# use vi-mode (as opposed to emacs-mode) for the zsh line editor
bindkey -v

# seems to allow me to delete characters before where I entered insert mode
bindkey "^?" backward-delete-char

# the zsh line editor starts in vi insert mode by default
VIMODE="ins"

# zle-keymap-select is a special user-defined widget such that we can execute this function every time the keymap changes
# we use this to determine whether the zsh line editor is in vi insert or command mode
function zle-keymap-select {
  VIMODE="${${KEYMAP/vicmd/cmd}/(main|viins)/ins}"
  zle reset-prompt
}
zle -N zle-keymap-select

