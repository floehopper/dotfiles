[user]
  email = james.mead4@nhs.net
  signingkey = ~/.ssh/github-nhs.pub

[core]
  # Use built-in MacOS ssh binary to support UseKeychain directive in SSH config
  # Use Github (NHS) SSH key
  sshCommand = "/usr/bin/ssh -i ~/.ssh/github-nhs.pub"

