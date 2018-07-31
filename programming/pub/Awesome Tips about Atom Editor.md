<!-- http://lifelongprogrammer.blogspot.com/2017/10/tips-and-tricks-for-atom-editor.html -->
### Settings
#### Core Settings
- Show/Hide files/folders ignored by .gitignore
  - (un)check "Hide VCS Ignored Files" in Tree View package
- Make files/folders ignored by .gitignore searchable or not
  - (un)check "Exclude VCS Ignored Paths" in Settings

#### Atom -> Preference -> Editor -> Enable soft wrap

### Tune Package Configuration
- After install a new package, read its settings page to configure it, learn its Keybindings etc.
- Find the package in "Preference -> Packages"
#### Tree View
#### Command Palette
- [Select ```Preserve Last Search```](https://github.com/atom/atom/issues/16097)
#### Fuzzy Finder
- Select **Preserve Last Search**
#### AutoSave
  - select "enabled".
- Tune settings
  - Enable **Auto Reveal**: link tree view with editor
  - Enable [Hide Ignored Names](https://discuss.atom.io/t/a-way-to-hide-the-ds-store-files-in-the-tree-view/1431), Hide VSS Ignored Files
- ```cmd-\``` to open/close the tree view, ```ctrl-0``` to focus it
- a, shift-a, m, or delete to add, move or delete files and folders
- [up/down arrow keys to preview files](https://github.com/atom/tree-view/issues/834)
  - need reload the window

#### Whitespace package
- uncheck "Ensure Single Trailing Newline" option
  * [remove trailing whitespace doesn't work for markdown file](https://github.com/atom/whitespace/issues/68)
    - Change the file suffix then change it back

<!-- #### Show or edit config at: Atom -> Config
-: link with editor: autoReveal from tree-view package
```yaml
"tree-view":
  autoReveal: true
``` -->

### How To Explore Atom Functions
- [Command Palette](https://atom.io/packages/command-palette)
  - Find all commands from one package by starting with the package name
  LC -> lower case, UP -> change-case:UpperFirst
- [keybinding-cheatsheet](https://atom.io/packages/keybinding-cheatsheet)

### Functions
- Multiple cursors
  - cmd+click: add new cursors
- [Fold](https://flight-manual.atom.io/using-atom/sections/folding/)
- [Pending Pane Items](https://flight-manual.atom.io/using-atom/sections/pending-pane-items/)
- [Open Atom in command line](https://stackoverflow.com/questions/22390709/how-to-open-atom-editor-from-command-line-in-os-x)
  - Atom >> Install Shell Commands
#### Find Content Fast
|         |                     |
|:------- |:------------------- |
| ctrl+F2 | list bookmarks      |
| cmd+F2  | create bookmark     |
| cmd+R   | toggle file symbols |

### Plugins
#### Plugins for Everyday's Productivity
- [open-recent](https://atom.io/packages/open-recent)
- [keybinding-cheatsheet](https://atom.io/packages/keybinding-cheatsheet)
  - Ctrl+Option+/: quickly find keybindings
- [Maximize active pane](https://atom.io/packages/maximize-panes)
  - cmd-shift-enter
- [Jumpy: shortcut-shift + enter](https://atom.io/packages/jumpy)

#### Plugins for Writing
- [Spell Check: Cmd+Shift+:](https://atom.io/packages/spell-check)
- [Change Case](https://atom.io/packages/change-case)
  - change-case:title/upperFirst/snake/constant
- [Document Outline](https://atom.io/packages/document-outline)
  - Shortcut: Ctrl-Cmd-T 
  - Uncheck "Show by default" in its settings
  - Only use h4 or above for markdown
```markdown
'atom-workspace':
    'cmd-ctrl-t': 'document-outline:toggle'
```
- [Markdown Writer](https://atom.io/packages/markdown-writer)
  - Execute command **Markdown Writer: Create Default keymaps** to add the recommended keymaps

|                  |                        |
|:---------------- |:---------------------- |
| ctrl-alt-[1-5]   | switch among H1 to H5. | 
| cmd-'            | code                   |
| cmd-b            | **bold**               |
| cmd-i            | _italic_               |
| cmd-h            | ~~strike through~~     |
| shift-cmd-"      | '''code block'''       |
| - unordered list | (shift-cmd-U)          |
| 0. ordered list  | (shift-cmd-O)          |

- [Markdown Table Editor](https://atom.io/packages/markdown-table-editor)
  - Hit tab to move to the next cell
- [markdown-preview-enhanced](https://github.com/shd101wyy/markdown-preview-enhanced)
  - [Ctrl+Shift+M: toggle preview](https://github.com/shd101wyy/markdown-preview-enhanced/issues/1137)
  - Support: **Scroll sync**, automatically show and switch preview of markdown being edited
  - Support Code chunk, [Presentation](https://shd101wyy.github.io/markdown-preview-enhanced/#/presentation)
  - Copy (part of) html content from the preview panel directly
  - [Diagrams](https://shd101wyy.github.io/markdown-preview-enhanced/#/diagrams)
    - Support PlantUML, mermaid, flow charts, sequence diagrams
- [markdown-preview-plus](https://atom.io/packages/markdown-preview-plus)
  - Ctrl+Shift+M: toggle preview
  - Copy html: convert markdown to html and copy the output to clipboard
  - Enable "Preview Position Synchronization behavior"
  - support pandoc syntax
- [atom-csv-markdown](https://atom.io/packages/atom-csv-markdown)
- [linter-write-good](https://atom.io/packages/linter-write-good)

#### Plugins for Developers
- [Git-Plus](https://atom.io/packages/git-plus)
  - Add All Commit And Push
  - Useful for blog repo etc.
- [Sync-on-Save](https://atom.io/packages/sync-on-save)
- [linter](https://atom.io/packages/linter) [link](https://atomlinter.github.io/)
  * [jsonlint](https://atom.io/packages/linter-jsonlint)
- [atom-beautify](https://atom.io/packages/atom-beautify)
  - Beautify javascript, java, json etc
- [vim-mode-plus](https://github.com/t9md/atom-vim-mode-plus)
  - Settings: Start in insert mode
  - [hit escape to close autocomplete popup](https://github.com/t9md/atom-vim-mode-plus/wiki/TIPS#in-insert-mode-hitting-escape-to-close-autocomplete-popup-result-in-normal-mode-but-want-to-remain-in-insert-mode)
  ```
  'atom-text-editor.vim-mode-plus.insert-mode.autocomplete-active':
    'escape': 'autocomplete-plus:cancel'
  ```
  - [remap escape key](https://github.com/t9md/atom-vim-mode-plus/issues/130#issuecomment-286776553)
  ```
  <!-- Open Atom -> Keymap and add: -->
  'atom-text-editor.vim-mode-plus.insert-mode':
    'cmd ^cmd ^ctrl': 'vim-mode-plus:activate-normal-mode'
  ```
#### Other Plugins
- [**Advanced Open File**](https://atom.io/packages/advanced-open-file)
  - Cmd-Alt-O: used to get the directory path we want move a file to
- [Delete Whitelines: Option+Shift+D](https://atom.io/packages/delete-whitelines)
- [split-diff](https://atom.io/packages/split-diff)
- [escape-utils: encode/decode URLs, Base64 or escape HTML entites](https://atom.io/packages/escape-utils)
- [highlight-selected](https://atom.io/packages/highlight-selected)
- [language-log: Log syntax highlighting and filtering](https://atom.io/packages/language-log)
- [dictionary: shortcut-Ctrl+Cmd+K](https://atom.io/packages/dictionary)
- [set-syntax](https://atom.io/packages/set-syntax)
- [ide-bash](https://atom.io/packages/ide-bash)
- [Sublime Style Column Selection](https://atom.io/packages/sublime-style-column-selection)
<!-- - [teletype: collaborate on code in real time](https://atom.io/packages/teletype) -->
- [Atom Package Sync - Synchronize between computers using Google account](https://atom.io/packages/atom-package-sync)

### [Shortcuts](http://lifelongprogrammer.blogspot.com/2018/05/keyboard-shortcuts.html#atom)
- Search shortcut at Settings -> Keybindings
- Shortcuts from [vim-mode-plus](https://github.com/t9md/atom-vim-mode-plus)
- New File under current folder when select the folder or a file in project panel:  **A**

|     |     |
| --- | --- |
**Command+P**|**Switch to File**
**Command+Shift+P**|**Command Palette**
**Command+\\** | **Toggle Tree View**
**Command+Enter** |**Replace all**
**Ctrl+Shift+C** | **Copy full path**
**Cmd+Option++(-)** |  **Increase(decrease) active <kbd>panel</kbd> size**
Cmd+Ctrl+G|Select all matching characters
Shift+Ctrl+M|Markdown Preview
Cmd+R|File symbol navigation
Ctrl + g| Go to Line
**Ctrl+m** | **Go to Matching Bracket**
**Cmd+Shift+t** | **Bring up the list of corrections (with spell-check extension)**
**Ctrl+Shift+left(or right)** | **move tab to left(or right)**
Cmd+k+u | Convert to Upper Case
Cmd+k+l | Convert to Lower Case
Ctrl+Shift+k|Delete Line
Ctrl+K|Cut to End of Line

### Keymap
- [How to disable key binding](https://stackoverflow.com/questions/33023349/atom-disable-single-key-binding)
  - Click the clipboard to copy the shortcut definition in **Keybindings** settings
  - replace the function to **unset!** to remove it or change it to another function
#### Solve the conflict between jumpy:toggle and markdown-preview-enhanced:run-code-chunk
```text
'.editor[data-grammar*="gfm"], .editor[data-grammar*="md"], .editor[data-grammar*="markdown"]':
  'shift-enter': 'jumpy:toggle'
```
### Tips
- [Use Rename to move files](http://timgthomas.com/2015/04/simple-file-tricks-with-atom/)
- Find previous: shift + enter in the search dialog
- Use Cmd+/ to comment: it know the right syntax for different language
- **Click the file name at the bottom bar to copy the full path**
- [Pending Pane Items](https://flight-manual.atom.io/using-atom/sections/pending-pane-items/)
  - single-clicking a file will open it in pending state
  - use this to open files that we don't want to keep and avoid open too many files
- Use Settings -> Updates to update all extensions

#### [File/Directory Pattern Syntax](https://flight-manual.atom.io/using-atom/sections/find-and-replace/)
- Use [minimatch](https://github.com/isaacs/minimatch) and [glob patterns](https://en.wikipedia.org/wiki/Glob_%28programming%29)
- "globstar" pattern (\*\*) can be used to match arbitrarily many subdirectories: docs/\*\*/\*.md
- Exclude file types or paths: !
- Search only java source (exclude test) code: \*\*/src/main/\*\*/\*.java or \*.java,!\*Test.java(this also works in Eclipse)

### apm
```bash
# To see all packages installed
apm list --installed --bare
apm upgrade --no-confirm
apm uninstall ${packagename}
```

### Resources
- [Atom Flight Manual](https://flight-manual.atom.io/)