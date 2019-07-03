
---

<details open><summary>
[Series: Awesome Tips about Mac](https://lifelongprogrammer.blogspot.com/search/label/Mac_Series){target="blank"}
</summary>
<script src="https://lifelongprogrammer.blogspot.com/feeds/posts/default/-/Mac_Series?orderby=updated&amp;alt=json-in-script&amp;callback=series&amp;max-results=20"></script>
</details>

<!-- SD:
Tips and Tricks about how to use latest iTerm effectively: shortcuts, common settings, etc.
 -->

#### Install iTerm2
- Install it with brew, check [here for more HomeBrew tips and tricks](https://lifelongprogrammer.blogspot.com/2019/02/mac-home-brew-tips-and-tricks.html)
```bash
brew tap caskroom/cask
brew cask install iterm2

# or install iterm2-beta
# brew tap homebrew/cask-versions
# brew cask install iterm2-beta
```

##### install [shell-integration](https://www.iterm2.com/documentation-shell-integration.html)
- Install from menu:  iTerm2 > Install Shell Integration

<!--
Disable "New Terminal Tab at Folder" and "New Terminal at Folder"
"Folder Actions Setup"
 -->

#### Change Default Settings to Make iTerm2 Even Better
To make iTerm2 even better, we can change its default settings by pressing **Cmd+,** or open menu **iTerm2 -> Preferences**.

##### Reuse previous session's directory
- Profiles > Default > General > Working Directory > Reuse previous session's directory

##### Store command history/directory info
- Check **Save copy/paste and command history** at General > Magic Section.
    - So we can use the history, recent directory even after restart iTerm

##### [Restore last windows after restart](https://gitlab.com/gnachman/iterm2/issues/3717#note_1733467)

- Ensure Preferences > Advanced > Restore window contents at startup is set to Yes in iTerm (default to true)
- Ensure "Close windows when quitting an app" is off in Mac's System Preferences >General

##### Disable "Quit iTerm2?" confirm dialog
By default, iTerm2 will ask us whether we really want to quit or close sessions. We always click OK. Even we accidentally quit iTerms, we can just reopen it, it will restore previous tabs.

So let's disable all confirm dialogs for closing at Preferences -> General -> Closing section and uncheck all.

##### Other Settings
- Enable "Check for updates automatically" at General -> Services. (iTerms's pretty useful, so why not keep it to the latest.)

<!-- ##### [Change default window size](https://superuser.com/questions/333591/windows-open-maximized-by-default)
- Profiles -> Window -> Set rows to 80, Columns to 300
- No way to open as maximized by default -->

#### [Keyboard Shortcuts for iTerm2](https://lifelongprogrammer.blogspot.com/2018/05/keyboard-shortcuts-for-developers.html#iterm)

| Keys               | Action                          |
| ------------------ | ------------------------------- |
| Cmd+\\             | Show Annotations                |
| Cmd+Click          | Clickable Links                 |
| Cmd+Shift+H        | Paste History                   |
| **Cmd+k**          | **Clear buffer**                |
| **Cmd+Shift+O**    | **Open Quickly(Search tabs)**   |
| **Cmd+;**          | **Autocomplete**                |
| **Cmd+Shift+;**    | **Show Command History**        |
| **Cmd+Shift+H**    | **Show Paste History**          |
| **Cmd+Option+/**   | **Recent Directories popup**    |

#### Bash emacs mode shortcuts

| Keys               | Action                          |
|--------------------|--------------------------------------------------|
| CTRL-A             | Move cursor to the beginning of the line         |
| CTRL-E             | Move to the end of the line                      |
| CTRL-K             | Kill forward to the end of a line                |
| CTRL-U             | Kill the line from the beginning to this point   |
| **\^abc\­^­def**     | **Run previous command, replacing abc with def** |
| Option+left(right) | Move backward(forward) one word                  |

#### Tips for iTerm2
- Copy to pasteboard on selection
- `Cmd+k` to `clear current buffer` vs `Cmd+r` or the `clear` bash command.
  - Use `Cmd+k: clear current buffer`, if you don't want `cmd+f` to search old history

##### Command History - Cmd+Shift+;
- Type to search, up/down to select

##### Paste History  - Cmd+Shift+H
- **Works for multiple-lines command**

##### Split Screening
- **Cmd+d** for horizontal split
- **Cmd+Shift+d** for vertical split

##### highlight errors and warnings
- Preferences > Profiles > Advanced > Triggers > Edit
```text
(?i:.*error.*)                     // Yellow on Black
(?i:.*(warning|warn).*)            // Orange on Black
(?i:.*FATAL.*)                     // White on Red
```

<!-- #### Bash Settings
##### ~/.bash_profile
```
# \w - Full path of the current working directory
export PS1="\w "
```
##### ~/.inputrc
```bash
# sets auto completion to ignore cases
set completion-ignore-case on
# ctrl+p/n
"\C-p":history-search-backward
"\C-n":history-search-forward
# set -o vi
# set -o emacs
``` -->

##### [Make Option+left(right) work](https://elweb.co/making-iterm-2-work-with-normal-mac-osx-keyboard-shortcuts/)
- Preferences > Profiles > Keys

||||
|-|-|-|
Keyboard Shortcut: Option+Left | Action: Send Escape Sequence | Esc+ b
Keyboard Shortcut: Option+Right| Action: Send Escape Sequence|Esc+ f

##### [imgcat](https://www.iterm2.com/documentation-images.html)
- Show the image in the command line.

<!-- - to use the feature download and upload with scp, we need install shell integration on each remote host -->

##### [badge](https://www.iterm2.com/documentation-badges.html)
> A badge is a large text label that appears in the top right of a terminal session to provide dynamic status, such as the current host name or git branch

- Preferences>Profiles>General>Badge
\(session.username)@\(session.hostname)


#### Toolbet
##### Track long running command
- Edit > Marks and Annotations > Alert on next mark

##### [Related Posts](https://lifelongprogrammer.blogspot.com/search/label/Mac)
<script src="https://lifelongprogrammer.blogspot.com/feeds/posts/default/-/Mac_Series?orderby=updated&amp;alt=json-in-script&amp;callback=weightedRandomRelatedPosts&amp;max-results=20"></script>
<script src="https://lifelongprogrammer.blogspot.com/feeds/posts/default/-/Mac?orderby=updated&amp;alt=json-in-script&amp;callback=weightedRandomRelatedPosts&amp;max-results=20"></script>