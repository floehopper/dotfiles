# Dotfiles

## Initial setup

    git clone --bare git@github.com:floehopper/dotfiles.git $HOME/.dotfiles
    alias dotfiles='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
    dotfiles checkout

## Ongoing management

Use `dotfiles` alias in place of `git` in `$HOME`, e.g.

    dotfiles add new-file
    dotfiles status
    dotfiles commit
    dotfiles push
