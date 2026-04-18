[user]
  email = james.mead4@nhs.net
  signingkey = ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIH0N2+xFZ5YzNkehmOIoi4xL0gotFsdnZn+qdUGQW07T

[core]
  # Use built-in MacOS ssh binary to support UseKeychain directive in SSH config
  # Use Github (NHS) SSH key
  sshCommand = "/usr/bin/ssh -i ~/.ssh/github-nhs.pub"

