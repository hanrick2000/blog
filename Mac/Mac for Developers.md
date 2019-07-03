
#### brew
```bash
brew list -l
brew cask list
brew update/upgrade
brew cleanup
```

#### Xcode
Xcode is an integrated development environment for macOS containing a suite of software development tools developed by Apple. Some tools requires it.
- `xcode-select --install`{.bash}


brew doctor

```text
Warning: The following directories do not exist:
/usr/local/sbin

You should create these directories and change their ownership to your account.
  sudo mkdir -p /usr/local/sbin
  sudo chown -R $(whoami) /usr/local/sbin
```

Homebrew-Cask extends Homebrew and allows you to install large binary files via a command-line tool.
We can use it to install applications like Google Chrome, Dropbox, VLC and Spectacle.

brew tap caskroom/cask
brew cask install

homebrew-cask-versions

brew tap homebrew/cask-versions

brew cask install atom-beta
==> Installing Cask atom-beta
==> Creating Caskroom at /usr/local/Caskroom
==> We'll set permissions properly so we won't need sudo in the future.

```text
iterm2
google-chrome
google-chrome-canary

caffeine
docker

```

appcleaner


brew update-reset && brew update

no `brew cask search` any more, it was deprecated then removed.


brew search --casks

brew cask info atom-beta


[xcrun: error: invalid active developer path (/Library/Developer/CommandLineTools), missing xcrun at: /Library/Developer/CommandLineTools/usr/bin/xcrun](https://stackoverflow.com/questions/52522565/git-is-not-working-after-macos-mojave-update-xcrun-error-invalid-active-devel)
- Update Xcode Command-line Tools
xcode-select --install

slow, 25+ minutes

#### [Install Golang](https://sourabhbajaj.com/mac-setup/Go/README.html)
- `brew install golang`{.bash}
```bash
export GOPATH=$HOME/go-workspace # don't forget to change your path correctly!
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin
```
- a lot of tools uses go: like [html minify command](https://github.com/tdewolff/minify/tree/master/cmd/minify)


#### Python
brew install pyenv

meld not work:
The operation couldn’t be completed. (OSStatus error 99999.)


#### Ruby
gem install xcode-install

https://sourabhbajaj.com/mac-setup/Ruby/
brew install rbenv ruby-build rbenv-default-gems rbenv-gemset

