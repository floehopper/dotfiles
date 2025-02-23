## List & install software updates
```
softwareupdate --list
sudo softwareupdate --verbose --install --all
```

## Set computer name
```
COMPUTER_NAME="<computer-name>"
sudo scutil --set ComputerName $COMPUTER_NAME
sudo scutil --set LocalHostName $COMPUTER_NAME
sudo scutil --set HostName $COMPUTER_NAME
```

## Screen saver / lock

* System Preferences > Desktop & Screen Saver > Screen Saver > Hot Corners > Top Right
  * Start Screen Saver
* System Preferences > Security & Privacy > General
  * Require password *immediately* after sleep or screen saver begins

## Accessibility

* System Preferences > Accessibility > Zoom
  * Use keyboard shortcuts to zoom
* System Preferences > Accessibility > Pointer Control > Mouse & Trackpad > Trackpad Options
  * Check "Enable dragging"
  * Select "three finger drag"

## Dock settings

```
defaults write com.apple.dock static-only -bool TRUE
defaults write com.apple.Dock autohide -bool TRUE
defaults write com.apple.dock showhidden -bool TRUE
killall Dock
```

## Trackpad gestures

* System Preferences > Trackpad > Point & Click > Tap to click
  * Check checkbox (now the default)

## Keyboard shortcuts

* System Preferences > Keyboard > Shortcuts > App Shortcuts > All Applications
  * Click "+" to add "Zoom" with shortcut cmd-shift-M

## Date & time

* System Preferences > Date & Time > Clock > Date options
  * Check "Show date" checkbox

## Sound

* System Preferences > Sound > Sound Effects > Alert Volume
  * Move slider to minimum

## Battery usage

* Click on battery icon in status bar
  * Enable "Show Percentage" option

## Keyboard

* System Preferences > Keyboard > Keyboard
  * Set "Key Repeat" to maximum ("Fast")
  * Set "Delay Until Repeat" to minimum ("Short")
  * Tick "Show keyboard and emoji viewers in menu bar" checkbox

## Bluetooth

* System Preferences > Bluetooth
  * Check "Show Bluetooth in menu bar"

## Finder preferences

**TODO**

```
sfltool add-item com.apple.LSSharedFileList.FavoriteItems file:///Users/jamesmead/Code
```

## SSH

* Copy `~/.ssh` directory from backup drive

## Rubygems

* Copy `~/.gem` directory from backup drive

## AWS

* Copy `~/.aws` directory from backup drive

## Environment

### Set default shell to bash (default is now zsh)

```
chsh -s /bin/bash
sudo chsh -s /bin/bash # sets default shell for `root`
```

* Add `export BASH_SILENCE_DEPRECATION_WARNING=1` to `~/.bashrc`

```
mkdir ~/Code
cd ~/Code
mkdir floehopper
cd floehopper
git clone git@github.com:floehopper/dotfiles.git
cd dotfiles
./install
```

* Copy `~/bin` directory from backup drive # maybe move this into `dotfiles`
* Copy `.env*` files from relevant projects from backup drive

## Install Homebrew

* See https://brew.sh

```
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

Note: This installs "Command Line Tools for XCode"

## Install tools

Follow post-install instructions in each case.

```
brew install git
# brew install hub
brew install bash-completion
brew install wget
brew install trash
brew install nmap
brew install rclone
brew install ag
brew install tree
# brew install phantomjs
# brew install neovim
# brew install vim --with-override-system-vi
brew install awscli
# brew install jq
brew tap heroku/brew && brew install heroku
# brew install postgres
# brew install tldr
# brew install openshift-cli
# brew install elasticsearch
# brew install kibana
# brew install grv
# brew install tidy-html5
# brew install httpie
# brew install ffmpeg
brew install openssl
# brew install fd
# brew install saulpw/vd/visidata
# brew install youtube-dl
# brew install fzf
# brew install gnupg
brew install go
brew install imagemagick
brew install ffmpeg
brew install cmake # for rugged/libgit2
brew install yarn
brew install csvkit
```

### Rust

* Follow instructions at https://rustup.rs/
* Follow instructions at https://github.com/rust-lang/rustup#profiles to install bash completions

## Terminal

```
cd ~/Code/
mkdir lysyi3m
cd lysyi3m
git clone git@github.com:lysyi3m/osx-terminal-themes.git
cd osx-terminal-themes
open "schemes/Solarized Dark.terminal"
open "schemes/Solarized Light.terminal"
defaults write com.apple.terminal "Default Window Settings" "Solarized Dark"
defaults write com.apple.terminal "Startup Window Settings" "Solarized Dark"
killall Terminal
```

## Ruby

```
brew install rbenv && rbenv init
```

* Follow instructions to update dotfiles if necessary.

## Node

* Follow [these instructions](https://github.com/nvm-sh/nvm#installation-and-update) to install nvm.
* Update dotfiles if necessary (installation will not overwrite existing configuration)
* Note installation using Homebrew is not currently supported.
* Install latest version of node & npm: `nvm install node`

## Install apps

* Use [Homebrew-Cask](https://caskroom.github.io) built into Homebrew

### 1Password

```
brew cask install 1password
```

* Disable notifications
* Sign in using 1password.com account

### Safari

* Preferences > Extensions
  * Enable 1Password extension
* Preferences > Advanced
  * Check "Show Develop menu in menu bar"

### Google Chrome

```
brew cask install google-chrome
```

* Disable notifications
* Set as default browser
* Sign in to Chrome using floehopper.org account
* Enable sync (installs browser extensions)
* Install [1Password companion app extension](https://chrome.google.com/webstore/detail/1password-extension-deskt/aomjjhallfgjeglblehebfpbcfeobpgk) (if not installed by previous step)
* Visit https://mail.google.com/ and pin tab
* Visit http://calendar.google.com/ , add gmail.com account, and pin tab
* Install 4od adblocker:
  * Clone https://github.com/Tryptamine42/4od-ad-block repo
  * Unzip `adblocker.crx`
  * Visit chrome://extensions & ensure developer mode is enabled at top-right
  * Click "Load unpacked" button and select unzipped directory

* Manage People > Add person "GFR"
* Sign in to Chrome using gofreerange.com account
* Enable sync - installs browser extensions
* Install [1Password companion app extension](https://chrome.google.com/webstore/detail/1password-extension-deskt/aomjjhallfgjeglblehebfpbcfeobpgk) (if not installed by previous step)
* Visit https://mail.google.com/ and pin tab
* Visit http://calendar.google.com/ and pin tab
* Visit https://trello.com/ , sign in, open "Go Free Range" board, and pin tab
* Visit https://freerange.freeagent.com/ , sign in, and pin tab
* Visit https://stripe.com/ , sign in, and pin tab
* Visit https://mission-patch.awsapps.com/ , sign in, and pin tab

* Install Tampermonkey scripts - https://github.com/floehopper/user-scripts

### Firefox

```
brew cask install firefox
```

* Install [1Password companion app extension](https://1password.com/browsers/firefox/)

### Dropbox

```
brew cask install dropbox
```

* Sign in
* Click through introduction
* Disable notifications
* Start smart syncing
* Add the following folders to Finder sidebar
  * `~/Dropbox/Inbox%20-%20Personal`
  * `~/Dropbox/Inbox%20-%20Work`

### Google Drive

```
brew cask install google-backup-and-sync
```

* Open app
* Disable access to Desktop, Download, Pictures/Photos
* Sign in using gofreerange.com account
* Sync "My Drive" to default location (`~/Google Drive`)

### Kindle for Mac

**TODO**

```
brew cask install kindle
```

* Sign in
* Setup
* Start syncing

### Chromedriver

```
brew cask install chromedriver
```

### Slack

```
brew cask install slack
```

* Sign in to relevant workspaces

### Doxie

```
brew cask install doxie
```

### Atom editor

```
brew cask install atom
apm install language-elm
apm install language-diff
apm install language-docker
apm install language-puppet
apm install language-groovy
apm install markdown-pdf
apm install linter
apm install linter-ruby
apm install linter-eslint
apm install linter-shellcheck
apm install linter-tidy
apm install formatter
apm install formatter-tidy # set options from freerange/site `Spider#normalize_artefacts`
apm install atom-ternjs
```

### Docker

```
brew cask install docker
```

* Follow instructions at https://docs.docker.com/machine/completion/#bash for docker bash completion
* Follow instructions at https://docs.docker.com/compose/completion/#bash for docker-compose bash completion

### Spotify


```
brew cask install spotify
```

### Calibre eBook reader

```
brew cask install calibre
```

* Install the "KFX Input" plugin
* Download latest release from https://github.com/apprenticeharper/DeDRM_tools/releases
* Manually install the DeDRM plugin from "DeDRM_calibre_plugin/DeDRM_plugin.zip" in the unzipped directory
* TODO: Export books from previous computer

### Vienna RSS reader

**TODO**

```
brew cask install vienna
```

### Tunnelblick (VPN client)

**TODO**

```
brew cask install tunnelblick
```

### Mac App Store CLI

```
brew install mas
```

### Pages

```
mas search Pages
409201541 Pages (8.2)
...

mas install 409201541
```

### Numbers

```
mas search Numbers
409203825 Numbers (6.2)
...

mas install 409203825
```

### Keynote

```
mas search Keynote
409183694 Keynote (9.2)
...

mas install 409183694
```

### Quicklook plugins

```
brew cask install qlmarkdown quicklook-json
```

* Open Finder
* When you see warning: "QLMarkdown.qlgenerator" can't be opened because Apple cannot check it for malicious software.
  * Click "OK"
  * System Preferences > Security & Privacy > General
    * Check "Open Anyway"

### Real VNC viewer

* Used for sharing screen with Raspberry Pi

```
brew cask install realvnc
```

### balenaEtcher

* Used to create bootable SD drives for Raspberry Pi

```
brew cask install balenaEtcher
```

### BBC iPlayer downloader

```
brew cask install bbc-iplayer-downloads
```

### Gmvault: Gmail backup

```
brew cask install gmvault
```
