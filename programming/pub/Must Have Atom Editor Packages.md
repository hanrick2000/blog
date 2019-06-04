---

### [Awesome Tips about Atom](/search/label/Atom_Series){target="blank"}
<script src="/feeds/posts/default/-/Atom_Series?orderby=updated&amp;alt=json-in-script&amp;callback=series&amp;max-results=20"></script>

---

<!-- SD: 
The Must Have Atom Packages for Productivity, Developers, Writing, Writing with Markdown and etc.
-->

#### Packages for Productivity
- [open-recent](https://atom.io/packages/open-recent)
- [highlight-selected](https://atom.io/packages/highlight-selected)

- [keybinding-cheatsheet](https://atom.io/packages/keybinding-cheatsheet)
  - Ctrl+Option+/: quickly find keybindings
- [Maximize active pane](https://atom.io/packages/maximize-panes)
  - cmd-shift-enter
  - used together with preview package.
- [Jumpy: shortcut-shift + enter](https://atom.io/packages/jumpy)

#### Packages for Writing
- [Spell Check: Cmd+Shift+:](https://atom.io/packages/spell-check)
- [Change Case](https://atom.io/packages/change-case)
  - change-case:kebab/upperFirst/snake/constant
  - Shortcut from command palette: `UF`
  - Find all command by typing `cc, CC or 'Change Case'`
- [title-case](https://atom.io/packages/title-case)
  - solve the issue in `change-case:title`
  - Shortcut: type `etc[Editor: Title Case]` in command palette
- [Document Outline](https://atom.io/packages/document-outline)
  - Shortcut: Ctrl-Cmd-T 
  - Uncheck "Show by default" in its settings
  - Only use h4 or above for markdown
```markdown
'atom-workspace':
    'cmd-ctrl-t': 'document-outline:toggle'
```
- [Delete Whitelines: Option+Shift+D](https://atom.io/packages/delete-whitelines)
- [linter-write-good](https://atom.io/packages/linter-write-good)

#### Packages for Writing - Markdown
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
  - 
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

---

### [Awesome Tips about Markdown](/search/label/Markdown_Series){target="blank"}
<script src="/feeds/posts/default/-/Markdown_Series?orderby=updated&amp;alt=json-in-script&amp;callback=series&amp;max-results=20"></script>

---

#### Packages for Developers
- [Git-Plus](https://atom.io/packages/git-plus)
  - Add All Commit And Push
  - Useful for blog repo etc.
<!-- - [Sync-on-Save](https://atom.io/packages/sync-on-save) -->
- [linter](https://atom.io/packages/linter) [link](https://atomlinter.github.io/)
  * [jsonlint](https://atom.io/packages/linter-jsonlint)
- [atom-beautify](https://atom.io/packages/atom-beautify)
  - brew install uncrustify
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
#### Other Packages
- [**Advanced Open File**](https://atom.io/packages/advanced-open-file)
  - Cmd-Alt-O: used to get the directory path we want move a file to
- [split-diff](https://atom.io/packages/split-diff)
- [escape-utils: encode/decode URLs, Base64 or escape HTML entites](https://atom.io/packages/escape-utils)
- [language-log: Log syntax highlighting and filtering](https://atom.io/packages/language-log)
- [dictionary: shortcut-Ctrl+Cmd+K](https://atom.io/packages/dictionary)
- [set-syntax](https://atom.io/packages/set-syntax)
- [ide-bash](https://atom.io/packages/ide-bash)
- [Sublime Style Column Selection](https://atom.io/packages/sublime-style-column-selection)
<!-- - [teletype: collaborate on code in real time](https://atom.io/packages/teletype) -->
- [Atom Package Sync - Synchronize between computers using Google account](https://atom.io/packages/atom-package-sync)
- [Hyperlink Hyperclick: Cmd+click to open link](https://atom.io/packages/hyperlink-hyperclick)
  - Need also install [Hyperlink](https://atom.io/packages/hyperclick)

#### Core Packages
##### Tree View
##### Command Palette
- [Select ```Preserve Last Search```](https://github.com/atom/atom/issues/16097)
- Tune settings
  - Enable **Auto Reveal**: link tree view with editor
  - Enable [Hide Ignored Names](https://discuss.atom.io/t/a-way-to-hide-the-ds-store-files-in-the-tree-view/1431), Hide VSS Ignored Files
- ```cmd-\``` to open/close the tree view, ```ctrl-0``` to focus it
- a, shift-a, m, or delete to add, move or delete files and folders
- [up/down arrow keys to preview files](https://github.com/atom/tree-view/issues/834)
  - need reload the window

##### Fuzzy Finder
- Select **Preserve Last Search**

##### AutoSave
  - select "enabled".

##### Whitespace package
- uncheck "Ensure Single Trailing Newline" option
  * [remove trailing whitespace doesn't work for markdown file](https://github.com/atom/whitespace/issues/68)
    - Change the file suffix then change it back


---
#### [Related Posts](/search?q=label:Markdown|label:"Atom Editor")
<script src="/feeds/posts/default/-/Atom Editor?orderby=updated&amp;alt=json-in-script&amp;callback=weightedRandomRelatedPosts&amp;max-results=20"></script>
<script src="/feeds/posts/default/-/Markdown?orderby=updated&amp;alt=json-in-script&amp;callback=weightedRandomRelatedPosts&amp;max-results=20"></script>
<script src="/feeds/posts/default/-/Dev Tips?orderby=updated&amp;alt=json-in-script&amp;callback=weightedRandomRelatedPosts&amp;max-results=20"></script>