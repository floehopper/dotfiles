# Dotfiles

## First-time setup

* Install nix
* Install nix-darwin
* home-manager is configured as a module within the nix-darwin system configuration

## After making changes to `darwin-configuration.nix`

    darwin-rebuild switch

## Secrets managed by mise

- A key pair has been generated and saved to `~/.config/mise/age.txt` by running `age-keygen -o ~/.config/mise/age.txt` (only needs to be run once on a given machine)
- Secrets needed in a particular directory are stored in `.secrets.json` and encrypted by running `sops encrypt -i --age "<public key>" .secrets.json` (`.secrets.json` is ignored by my git config)
- The `SOPS_AGE_KEY_FILE` env var should be set to `~/.config/mise/age.txt` (via `~/.config/mise/config.toml`) so you can use `sops decrypt -i .secrets.json` to decrypt or `sops edit .secrets.json` to edit
- See [this documentation](https://mise.jdx.dev/environments/secrets.html#sops) for details
