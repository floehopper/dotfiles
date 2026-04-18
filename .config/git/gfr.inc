[user]
  email = james.mead@gofreerange.com
  signingkey = ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEpCm/TZgXZidDkmWqQ368J7GK5goYGwe2urBVv5a9j1

[core]
  # Use built-in MacOS ssh binary to support UseKeychain directive in SSH config
  # Use Github (GFR) SSH key
  sshCommand = "/usr/bin/ssh -i ~/.ssh/github-gfr.pub"

