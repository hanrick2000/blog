##### [Series: Awesome Tips about Atom](https://lifelongprogrammer.blogspot.com/search/label/Atom_Series){target="blank"}
<script src="https://lifelongprogrammer.blogspot.com/feeds/posts/default/-/Atom_Series?orderby=updated&amp;alt=json-in-script&amp;callback=series&amp;max-results=20"></script>
---

<!-- SD:
The Must Have Atom Packages for Productivity, Developers, Writing, Writing with Markdown and etc.
-->

#### Packages for Everyday's Productivity
- [Fuzzy Finder](https://atom.io/packages/fuzzy-finder)\
  - Select **Preserve Last Search** in the package's settings
- [AutoSave](https://atom.io/packages/autosave)\
- Select "enabled" in the package's settings
- [Tree View](https://atom.io/packages/tree-view)\
  - Cmd+\\ to toggle tree view.
- [Command Palette](https://atom.io/packages/command-palette)
  - [Select ```Preserve Last Search```](https://github.com/atom/atom/issues/16097)
  - Tune settings
    - Enable **Auto Reveal**: link tree view with editor
    - Enable [Hide Ignored Names](https://discuss.atom.io/t/a-way-to-hide-the-ds-store-files-in-the-tree-view/1431), Hide VSS Ignored Files
  - ```cmd-\``` to open/close the tree view, ```ctrl-0``` to focus it
  - a, shift-a, m, or delete to add, move or delete files and folders
  - [up/down arrow keys to preview files](https://github.com/atom/tree-view/issues/834)
    - need reload the window
  - [toggle focus between the tree view and the editor panes by pressing Ctrl+0](https://discuss.atom.io/t/toggle-tree-view-lose-focus/10055)
- [Whitespace](https://atom.io/packages/whitespace)
  - uncheck "Ensure Single Trailing Newline" option
    * [remove trailing whitespace doesn't work for markdown file](https://github.com/atom/whitespace/issues/68) <!-- - Change the file suffix then change it back -->
- [project-manager](https://atom.io/packages/project-manager)
- [open-recent](https://atom.io/packages/open-recent)
- [fuzzy-finder](https://atom.io/packages/fuzzy-finder)
- [highlight-selected](https://atom.io/packages/highlight-selected)
- [Hyperlink Hyperclick: Cmd+click to open link](https://atom.io/packages/hyperlink-hyperclick)
  - Need also install [Hyperlink](https://atom.io/packages/hyperclick)
- [Delete Whitelines: Option+Shift+D](https://atom.io/packages/delete-whitelines)
- [Maximize active pane](https://atom.io/packages/maximize-panes)
  - **cmd-shift-enter** to mix/max current pane
  - used together with preview package.

<details><summary>Click to Expand for More Packages</summary>

- [zentabs](https://atom.io/packages/zentabs)
  - Keep your opened tabs below a maximum limit, closing the oldest one first.
  - Temp tabs:
    - The temp tab will kind of conflict with zentabs: we don't want to close unsaved tabs, but they are also counted, if we have too many unsaved tabs, then after a while, only unsaved tabs will be left open.
    - One approach is to use only a few (<2) temp unsaved tabs, put temp content into tmep files like tmp.txt etc.
    - Reason: (1) project find(Command+Shift+F) will not search for temp tabs; (2) temp tabs would get lost when Atom crashes (like open a big file accidentally).
- [keybinding-cheatsheet](https://atom.io/packages/keybinding-cheatsheet)
  - Ctrl+Option+/: quickly find keybindings
- [Jumpy: shortcut-shift + enter](https://atom.io/packages/jumpy)
- [pinned-tabs](https://atom.io/packages/pinned-tabs){target="blank"}: pin tabs to save context
- [bracket-matcher](https://atom.io/packages/bracket-matcher)
  - **ctrl-m** to jump to the bracket matching the one adjacent to the cursor
  - **ctrl-cmd-m** to select all the text inside the current brackets
</details>


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
- [linter-write-good](https://atom.io/packages/linter-write-good)

#### Packages for Writing - Markdown
- [Markdown Writer](https://atom.io/packages/markdown-writer)
  - Execute command **Markdown Writer: Create Default keymaps** to add the recommended Keymaps.
  - snippet: b(bold), i, p(bullet point: -), l(link), code, t(todo), img

  |                      |                        |
  |:-------------------- |:---------------------- |
  | **ctrl-alt-[1-5] **  | toggle among H1 to H5. |
  | cmd-'                | code                   |
  | cmd-b                | **bold**               |
  | cmd-i                | _italic_               |
  | cmd-h                | ~~strike through~~     |
  | shift-cmd-"          | '''code block'''       |
  | **- unordered list** | **(shift-cmd-U)**      |
  | 0. ordered list      | (shift-cmd-O)          |

- [Markdown Table Editor](https://atom.io/packages/markdown-table-editor)
  - **Hit tab to move to the next cell**
  - Snippet: table
- [markdown-preview-enhanced](https://github.com/shd101wyy/markdown-preview-enhanced)
  - [Ctrl+Shift+M: toggle preview](https://github.com/shd101wyy/markdown-preview-enhanced/issues/1137)
  - Support: **Scroll sync**, automatically show and switch preview of markdown being edited
  - Support Code chunk, [Presentation](https://shd101wyy.github.io/markdown-preview-enhanced/#/presentation)
  - Copy (part of) html content from the preview panel directly
  - [Diagrams](https://shd101wyy.github.io/markdown-preview-enhanced/#/diagrams)
    - Support PlantUML, mermaid, flow charts, sequence diagrams
  - [Turn off "Open preview pane automatically when opening a markdown file" as it will steal Tree View focus.](https://github.com/shd101wyy/markdown-preview-enhanced/issues/1054)
  - `Use Pandoc Parser`
- [markdown-preview-plus](https://atom.io/packages/markdown-preview-plus)
  - Ctrl+Shift+M: toggle preview
  - Copy html: convert markdown to html and copy the output to clipboard
  - Enable "Preview Position Synchronization behavior"
  - support pandoc syntax
- [atom-csv-markdown](https://atom.io/packages/atom-csv-markdown)

<!--
tidy-markdown: not work
beautifier: not work: script tag
-->

---

#### [Awesome Tips about Markdown](https://lifelongprogrammer.blogspot.com/search/label/Markdown_Series){target="blank"}
<script src="https://lifelongprogrammer.blogspot.com/feeds/posts/default/-/Markdown_Series?orderby=updated&amp;alt=json-in-script&amp;callback=series&amp;max-results=20"></script>

---

#### Packages for Developers
- [set-syntax](https://atom.io/packages/set-syntax)
- [compare-files](https://atom.io/packages/compare-files): "Compare Files: Compare"
- [atom-beautify](https://atom.io/packages/atom-beautify)
  - brew install uncrustify
  - Beautify javascript, java, json etc
- [Git-Plus](https://atom.io/packages/git-plus)
  - Add All Commit And Push
  - Useful for blog repo etc.
- [escape-utils: encode/decode URLs, Base64 or escape HTML entites](https://atom.io/packages/escape-utils)

<details><summary>Click to Expand for More Packages</summary>

- [atom-runner: run javascript, python, go, bash etc directly in atom](https://atom.io/packages/atom-runner)
- [atom-ternjs: JavaScript code intelligence](https://atom.io/packages/atom-ternjs)
<!-- - [Sync-on-Save](https://atom.io/packages/sync-on-save) -->
- [linter](https://atom.io/packages/linter) [link](https://atomlinter.github.io/)
  * [jsonlint](https://atom.io/packages/linter-jsonlint)
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
- [emmet-simplified](https://atom.io/packages/emmet-simplified)
  - Not [emmet](https://atom.io/packages/emmet) which defines a lot of default keys and conflict with atom.
</details>

#### Other Packages
- [**Advanced Open File**](https://atom.io/packages/advanced-open-file)
  - Cmd-Alt-O: used to get the directory path we want move a file to
- [language-log: Log syntax highlighting and filtering](https://atom.io/packages/language-log)
- [dictionary: shortcut-Ctrl+Cmd+K](https://atom.io/packages/dictionary)
<!-- - [ide-bash](https://atom.io/packages/ide-bash) -->
- [Sublime Style Column Selection](https://atom.io/packages/sublime-style-column-selection)
- [Atom Package Sync - Synchronize between computers using Google account](https://atom.io/packages/atom-package-sync)

<!-- - [split-diff](https://atom.io/packages/split-diff) -->
<!-- - [teletype: collaborate on code in real time](https://atom.io/packages/teletype) -->
<!-- - [ide-bash](https://atom.io/packages/ide-bash) -->

<!-- #### Tips
- `apm list --installed --enabled`{.bash} -->

##### [Related Posts](/search?q=label:Markdown|label:"Atom Editor")
<script src="https://lifelongprogrammer.blogspot.com/feeds/posts/default/-/Atom Editor?orderby=updated&alt=json-in-script&callback=weightedRandomRelatedPosts&max-results=20"></script>
<script src="https://lifelongprogrammer.blogspot.com/feeds/posts/default/-/Markdown?orderby=updated&amp;alt=json-in-script&amp;callback=weightedRandomRelatedPosts&amp;max-results=20"></script>
