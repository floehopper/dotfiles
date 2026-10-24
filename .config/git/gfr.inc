[user]
  email = james.mead@gofreerange.com
  signingkey = ~/.ssh/github-gfr.pub

[core]
  # Use built-in MacOS ssh binary to support UseKeychain directive in SSH config
  # Use Github (GFR) SSH key
  sshCommand = "/usr/bin/ssh -i ~/.ssh/github-gfr.pub"

