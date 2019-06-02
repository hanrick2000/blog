<!-- http://lifelongprogrammer.blogspot.com/2018/06/working-effectively-with-iterm.html -->
#### Install iTerm2
- brew cask install iterm2

##### install [shell-integration](https://www.iterm2.com/documentation-shell-integration.html)
- Install from menu:  iTerm2 > Install Shell Integration

---

#### [Shortcuts](http://lifelongprogrammer.blogspot.com/2018/05/keyboard-shortcuts-for-developers.html#iterm)

|                  |                               |
|------------------|-------------------------------|
| Cmd+\\           | Show Annotations              |
| Cmd+Click        | Clickable Links               |
| Cmd+Shift+H      | Paste History                 |
| **Cmd+k**        | **Clear buffer**              |
| **Cmd+Shift+O**  | **Open Quickly(Search tabs)** |
| **Cmd+;**        | **Autocomplete**              |
| **Cmd+Shift+;**  | **Show Command History**      |
| **Cmd+Shift+H**  | **Show Paste History**        |
| **Cmd+Option+/** | **Recent Directories popup**  |

#### Bash emacs mode shortcuts

|                    |                                                  |
|--------------------|--------------------------------------------------|
| CTRL-A             | Move cursor to the beginning of the line         |
| CTRL-E             | Move to the end of the line                      |
| CTRL-K             | Kill forward to the end of a line                |
| CTRL-U             | Kill the line from the beginning to this point   |
| **\^abc\­^­def**     | **Run previous command, replacing abc with def** |
| Option+left(right) | Move backward(forward) one word                  |

---

#### Tips
- `Cmd+k to clear current buffer` vs `clear`
  - Use `clear current buffer`, if you don't want `cmd+f` to search old history

##### Command History - Cmd+Shift+;
##### Paste History  - Cmd+Shift+H
- **Works for multiple-lines command**

##### highlight errors and warnings
- Preferences > Profiles > Advanced > Triggers > Edit
```text
(?i:.*error.*)                     // Yellow on Black
(?i:.*(warning|warn).*)            // Orange on Black
(?i:.*FATAL.*)                     // White on Red
```

---

#### Settings
##### Reuse previous session's directory
- Profiles > Default > General > Working Directory > Reuse previous session's directory

##### Store command history/directory info
- General > Save copy/paste and command history
    - So we can use the history, recent directory even after restart iTerm

##### [Restore last windows after restart](https://gitlab.com/gnachman/iterm2/issues/3717#note_1733467)
- Ensure Preferences > Advanced > Restore window contents at startup is set to Yes in iTerm (default to true)
- Ensure "Close windows when quitting an app" is off in Mac's System Preferences >General

##### [Change default window size](https://superuser.com/questions/333591/windows-open-maximized-by-default)
- Profiles -> Window -> Set rows to 80, Columns to 300
- No way to open as maximized by default

#### Bash Settings
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
```

---

##### [Make Option+left(right) work](https://elweb.co/making-iterm-2-work-with-normal-mac-osx-keyboard-shortcuts/)
- Preferences > Profiles > Keys

||||
|-|-|-|
Keyboard Shortcut: Option+Left | Action: Send Escape Sequence | Esc+ b
Keyboard Shortcut: Option+Right| Action: Send Escape Sequence|Esc+ f

##### [badge](https://www.iterm2.com/documentation-badges.html)
- Preferences>Profiles>General>Badge
\(session.username)@\(session.hostname)

##### [imgcat](https://www.iterm2.com/documentation-images.html)
- add command: imgcat
- to use the feature download and upload with scp, we need install shell integration on each remote host

#### Toolbet
#### Track long running command
- Edit > Marks and Annotations > Alert on next mark
