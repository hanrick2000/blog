<!-- http://lifelongprogrammer.blogspot.com/2017/10/tips-and-tricks-for-atom-editor.html -->

#### Settings
##### Show files/folders ignored by .gitignore 
- uncheck "Hide VCS Ignored Files" in Tree View package

##### Make files/folders ignored by .gitignore searchable
- uncheck "Exclude VCS Ignored Paths" in Settings

##### AutoSave
- disabled by default, find autosave in packages, go to its settings and select "enabled".

##### uncheck "Ensure Single Trailing Newline"
- Find whitespace package, uncheck "Ensure Single Trailing Newline" option

##### Auto Reveal Tree-view
- Find Tree-view package, select "Auto Reveal"

##### Atom -> Preference -> Editor -> Enable soft wrap

##### Show or edit config at: Atom -> Config

#### Extensions
- [markdown-preview-enhanced](https://github.com/shd101wyy/markdown-preview-enhanced)
  - Ctrl+Shift+M: toggle preview
  - Support Code chunk, [Presentation](https://shd101wyy.github.io/markdown-preview-enhanced/#/presentation)
  - [Diagrams](https://shd101wyy.github.io/markdown-preview-enhanced/#/diagrams)
    - Support PlantUML, mermaid, flow charts, sequence diagrams
- [markdown-preview-plus](https://atom.io/packages/markdown-preview-plus)
  - Ctrl+Shift+M: toggle preview
  - Copy html: convert markdown to html and copy the output to clipboard
  - Enable "Preview Position Synchronization behavior"

- [atom-beautify](https://atom.io/packages/atom-beautify)
  - Beautify javascript, java, json etc

- [vim-mode-plus](https://github.com/t9md/atom-vim-mode-plus)
  - Settings: Start in insert mode
  - [hitt escape to close autocomplete popup](https://github.com/t9md/atom-vim-mode-plus/wiki/TIPS#in-insert-mode-hitting-escape-to-close-autocomplete-popup-result-in-normal-mode-but-want-to-remain-in-insert-mode)
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

- [open-recent](https://atom.io/packages/open-recent)
- [spell-check: Cmd+Shift+t](https://atom.io/packages/spell-check)
- [delete-whitelines: Alt+Shift+D](https://atom.io/packages/delete-whitelines)
- [escape-utils: encode/decode URLs, Base64 or escape HTML entites](https://atom.io/packages/escape-utils)
- [highlight-selected](https://atom.io/packages/highlight-selected)
- [language-log: Log syntax highlighting and filtering](https://atom.io/packages/language-log)
- [dictionary: shortcut-Ctrl+Cmd+K](https://atom.io/packages/dictionary)
- [Jumpy: shortcut-shift + enter](https://atom.io/packages/jumpy)
- [set-syntax](https://atom.io/packages/set-syntax)
- [ide-bash](https://atom.io/packages/ide-bash)
- [linter](https://atom.io/packages/linter)
- [Sublime Style Column Selection](https://atom.io/packages/sublime-style-column-selection)
- [teletype: collaborate on code in real time](https://atom.io/packages/teletype)

##### [Check Atom Shortcuts at here](http://lifelongprogrammer.blogspot.com/2018/05/keyboard-shortcuts.html#atom)

##### Tips
- Use Cmd+/ to comment: it know the right syntax for different language

##### apm
```bash
apm list --installed --bare
apm uninstall ${packagename}
```