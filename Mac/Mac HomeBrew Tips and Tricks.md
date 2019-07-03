
---

<details open><summary>
[Series: Awesome Tips about Mac](https://lifelongprogrammer.blogspot.com/search/label/Mac_Series){target="blank"}
</summary>
<script src="https://lifelongprogrammer.blogspot.com/feeds/posts/default/-/Mac_Series?orderby=updated&amp;alt=json-in-script&amp;callback=series&amp;max-results=20"></script>
</details>


##### The Problem
Every once in a while, we nee change our workstation and reinstall all softwares. We don't want to to website, download binary, click it to install for all these tools.

We can use [HomeBrew](https://brew.sh/) to install them in command line, and even better have one script to install all tools.

#### [Install HomeBrew](https://brew.sh/)
- [The missing package manager for macOS.](https://github.com/Homebrew/)
```bash
/usr/bin/ruby -e "$(curl -fsSL \
https://raw.githubusercontent.com/Homebrew/install/master/install)"
```
- `brew search`{.bash}
  - `brew search iterm2`{.bash}
- `brew list`: List all installed formulae.
- `brew update`{.bash}: Fetch the newest version of Homebrew and all formulae
- `brew upgrade`{.bash}: Upgrade outdated, unpinned formulae
  - `brew upgrade <formula>`{.bash} to update a package
- `brew cleanup`{.bash}: remove old versions of installed formulae
- `brew uninstall the_name`{.bash}
- `brew outdated`{.bash}: Show formulae that have an updated version available.
- `brew doctor`{.bash}: Check your system for potential problems.

#### [brew tap](https://github.com/Homebrew/brew/blob/master/docs/Taps.md)
- The default formulae: [homebrew-core](https://github.com/Homebrew/homebrew-core/)
- brew tap adds more repositories to the list of formulae that brew tracks, updates, and installs from.
- `brew tap`{.bash}: list tapped repositories
- `brew tap <tapname>`{.bash}: add tap
- `brew untap <tapname>`{.bash}: remove a tap

#### Homebrew Cask
- Cask allows us to install large binary files via a command-line tool.
- Install cask by adding it as a tap: `brew tap caskroom/cask`{.bash}
- `brew cask list`: with no args, lists installed Casks; given installed Casks, lists staged files

#### [Homebrew Cask Versions](https://github.com/Homebrew/homebrew-cask-versions)
- Another git repo from homebrew that allows us to install beta or older versions.
- Install: `brew tap homebrew/cask-versions`{.bash}
- Example: `brew cask install atom-beta`{.bash}
- `brew cask uninstall atom-deta`{.bash}
- `brew cask info atom-beta`{.bash}

#### [Bash Completion](https://davidalger.com/posts/bash-completion-on-os-x-with-brew/)
- `brew install bash-completion`{.bash}
- Add bash-completion to your ~/.bash_profile:
```bash
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion || {
    # if not found in /usr/local/etc, try the brew --prefix location
    [ -f "$(brew --prefix)/etc/bash_completion.d/git-completion.bash" ] && \
        . $(brew --prefix)/etc/bash_completion.d/git-completion.bash
}
```

#### Oracle Java vs OpenJDK
##### Install Oracle Java
- Install latest Oracle Java: `brew cask install java`{.bash}
- Install older Oracle Java from cask-versions: `brew cask install java8`{.bash}
  - Run `brew tap caskroom/versions`{.bash} if not added cask-versions before.

##### Install OpenJDK
```bash
brew tap AdoptOpenJDK/openjdk
brew cask install adoptopenjdk11
```

<details><summary>
#### One Script to Install All
</summary>

``` {.bash .numberLines .lineAnchors}
brew update
brew upgrade --all

brew install git
# change default applications
brew install duti
brew install pandoc
brew install htop
brew install wget
brew install watch

# https://github.com/AdoptOpenJDK/homebrew-openjdk
# brew cask install adoptopenjdk
# adoptopenjdk11, adoptopenjdk11-jre
brew tap AdoptOpenJDK/openjdk
brew cask install adoptopenjdk11

brew tap caskroom/cask
brew tap homebrew/cask-versions

# or iterm2-beta
brew cask install iterm2
brew cask install google-chrome
brew cask install google-chrome-canary
brew cask install visual-studio-code
brew cask install visual-studio-code-insiders
brew cask install intellij-idea
brew cask install eclipse-jee
brew cask install docker

brew cask install postman
# Tools
brew cask install the-unarchiver
# MPV media player
brew install mpv
#  vlc media player
brew cask install vlc

brew cask install slack

# Java development
brew install maven
brew install gradle

# toggle dark-mode in command line
brew install dark-mode

brew cask install flux
# convert and resize images
brew install imagemagick

brew cleanup
brew cask cleanup
```
</details>

