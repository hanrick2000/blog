---

### [Awesome Tips about Atom Series](https://lifelongprogrammer.blogspot.com/search/label/Atom_Series){target="blank"}
<script src="/feeds/posts/default/-/Atom_Series?orderby=updated&amp;alt=json-in-script&amp;callback=series&amp;max-results=20"></script>

---

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
- Select [```Preserve Last Search```](https://github.com/atom/atom/issues/16097){target="blank"} at `Packages -> Command Palette`
  - As we usually call same functions multiple times.
- Tune settings
  - Enable **Auto Reveal**: link tree view with editor
  - Enable [Hide Ignored Names](https://discuss.atom.io/t/a-way-to-hide-the-ds-store-files-in-the-tree-view/1431){target="blank"}, Hide VSS Ignored Files
- ```cmd-\``` to open/close the tree view, ```ctrl-0``` to focus it
- a, shift-a, m, or delete to add, move or delete files and folders
- [up/down arrow keys to preview files](https://github.com/atom/tree-view/issues/834){target="blank"}
  - need reload the window
- [toggle focus between the tree view and the editor panes by pressing Ctrl+0](https://discuss.atom.io/t/toggle-tree-view-lose-focus/10055)

#### Fuzzy Finder
- Select **Preserve Last Search**

|                |                                                   |
| -------------- | ------------------------------------------------- |
| cmd-t or cmd-p | open the file finder                              |
| cmd-b          | open the list of open buffers                     |
| cmd-shift-b    | open the list of Git modified and untracked files |


#### AutoSave
  - select "enabled".

#### Whitespace package
- uncheck "Ensure Single Trailing Newline" option
  * [remove trailing whitespace doesn't work for markdown file](https://github.com/atom/whitespace/issues/68){target="blank"}
    - Change the file suffix then change it back

<!-- #### Show or edit config at: Atom -> Config
-: link with editor: autoReveal from tree-view package
```yaml
"tree-view":
  autoReveal: true
``` -->

---

### How To Explore and Learn Atom Functions<a name='explore'></a>
- [Command Palette](https://atom.io/packages/command-palette){target="blank"}
  - Find all commands from one package by starting with the package name: e.g. Type `Change Case` to know all functions provided
- Use `Cmd+Shift+?: Search -> Help` to find/explore/call command.
- After install the package, read its readme, and settings, change them if applied.
- When you want to figure out how to do xx, or want some features, change some settings, first figure out what package provides the function.
  - By using `Key Binding Resolver` which shows which package responds to your typing or shortcut.

  <!-- LC -> lower case, UP -> change-case:UpperFirst -->
### Functions
- **Multiple cursors**
  - `cmd++Shift+click`: add new cursors
- [Fold](https://flight-manual.atom.io/using-atom/sections/folding/){target="blank"}
- [Pending Pane Items](https://flight-manual.atom.io/using-atom/sections/pending-pane-items/){target="blank"}
- [Open Atom in command line](https://stackoverflow.com/questions/22390709/how-to-open-atom-editor-from-command-line-in-os-x){target="blank"}
  - Atom >> Install Shell Commands

---

### [Must-Have Atom Editor Packages](https://lifelongprogrammer.blogspot.com/2019/03/must-have-atom-editor-packages.html){target="blank"}
- [The Must Have Atom Packages for Productivity, Developers, Writing, Writing with Markdown and etc.](https://lifelongprogrammer.blogspot.com/2019/03/must-have-atom-editor-packages.html){target="blank"}

---

### [Shortcuts](https://lifelongprogrammer.blogspot.com/2018/05/keyboard-shortcuts-for-developers.html#atom){target="blank"}
- Search shortcut at Settings -> Keybindings
- Shortcuts from [vim-mode-plus](https://github.com/t9md/atom-vim-mode-plus){target="blank"}
- New File under current folder when select the folder or a file in project panel:  **A**

|     |     |
| --- | --- |
**Command+P**|**Switch to File**
**Command+Shift+P**|**Command Palette**
**Command+\\** | **Toggle Tree View**
**Command+Enter** |**Replace all**
**Ctrl+Shift+C** | **Copy full path**
**Cmd+Option++(-)** |  **Increase(decrease) active panel size**
Cmd+Ctrl+G|Select all matching characters
Shift+Ctrl+M|Markdown Preview
Cmd+R|File symbol navigation
Ctrl + g| Go to Line
**Ctrl+m** | **Go to Matching Bracket**
**Cmd+Shift+t** | **Bring up the list of corrections (with spell-check extension)**
**Ctrl+Shift+left(or right)** | **move tab to left(or right)**

---

#### Shortcut for Moving/Selection
|                          |                                        |
|:------------------------ |:-------------------------------------- |
| Option+left(right)       | Move to beginning/end of word          |
| Option+Shift+left(right) | Select to beginning/end of word        |
| Ctrl+A(E)                | Move to first character(end) of Line   |
| Ctrl+Shift+A(E)          | Select to first character(end) of line |
| Cmd+up(down)             | Move to top(bottom)                    |
| Shift+Cmd+up(down)       | Select to top(bottom)                  |

---

#### Shortcut for Writing

|              |                       |
|:------------ |:--------------------- |
| Cmd+k+u      | Convert to Upper Case |
| Cmd+k+l      | Convert to Lower Case |
| Ctrl+Shift+k | Delete Line           |
| Ctrl+K       | Cut to End of Line    |
|              |                       |

##### New Line Above
- Space and new line are important when we write with markdown and use Pandoc to convert it to HTML.
- So we need insert a new line above to fix the format issue: the default `cmd-shift-enter` confits with `maximize-panels:maxmize`
- To assign `alt-enter` to `newline-above`, add the following in keymap.cson:
```cson
"atom-workspace atom-text-editor:not([mini])":
  "alt-enter": "editor:newline-above"
  # "alt-enter": "editor:newline",
```

- [keybinding-cheatsheet](https://atom.io/packages/keybinding-cheatsheet){target="blank"}

---

### Keymap
#### Shortcut doesn't work
Example: `Ctrl+e` doesn't work: not go to end of line
- Use `Cmd+.` to open `Key Binding Resolver`
- Type the shortcut, the `Key Binding Resolver` will show what commands this keybinding resolves to, and which one wins
- In my case, `Ctrl+e` conflicts with `Emmet: expand abbreviation`
- To solve it, I can either uninstall Emmet(as I don't really use it)
- or replace the shortcut with desired function
  - in the `Key Binding Resolver` click and go to the keymap file and find the keymap definition
```cson
'atom-text-editor:not([mini])':
  'ctrl-e': 'editor:move-to-end-of-line'
```

#### [How to disable key binding](https://stackoverflow.com/questions/33023349/atom-disable-single-key-binding){target="blank"}
- Click the clipboard to copy the shortcut definition in **Keybindings** settings
- replace the function to **unset!** to remove it or change it to another function

#### Solve the conflict between jumpy:toggle and markdown-preview-enhanced:run-code-chunk
```cson
'.editor[data-grammar*="gfm"], .editor[data-grammar*="md"], .editor[data-grammar*="markdown"]':
  'shift-enter': 'jumpy:toggle'
```

### Moving in Atom without Mouse or Trackpad
- `Fn+up/down` for page up/down
- [After highlight and select multiple same words, `Cmd+d: find-and-replace:select-next` to choose all words what to change, then replace it or use left, right arrow to append words](https://daijiang.name/en/2015/04/10/useful-atom-shortcuts/){target="blank"}
- `Cmd+U` to `Unselect the next matching characters`
- `Cmd+Ctrl+G` to `Select all matching characters`

|         |                     |
|:------- |:------------------- |
| ctrl+F2 | list bookmarks      |
| cmd+F2  | create bookmark     |
| cmd+R   | toggle file symbols |

### Tabs
- In command palette: Tabs: close other tabs, close tabs to left/right etc
- `Pane: Move item left/right`(ctrl+shift+left/right) to move tab to the left/right

### [Snippets](https://flight-manual.atom.io/using-atom/sections/snippets/){target="blank"}
- [using """ for Multi-line Snippet Body](https://flight-manual.atom.io/using-atom/sections/snippets/#multi-line-snippet-body){target="blank"}
```cson
'.source.gfm':
  'TL;DR':
    'prefix': 'tldr'
    'body': '### TL;DR'
```

### Find Replace with regex
- Add `|` at the beginning (to fix markdown table)
  - Search for `^(.*)$` and replace with `|$1`
- find all links that doesn't start with http in markdown: `\]\([^h]`
- `Only in Selection`

### [Pending Pane Items](https://flight-manual.atom.io/using-atom/sections/pending-pane-items/){target="blank"}
- single-clicking a file will open it in pending state
- use this to open files that we don't want to keep and avoid open too many files
- `Cmd+Shift+F: project find` opens files in pending state.
---

### Tips
- Open link in Atom
  - [ctrl-shift-o	from Atom core](https://github.com/atom/atom/tree/master/packages/link){target="blank"}
  - Cmd+click from [Hyperlink Hyperclick](https://atom.io/packages/hyperlink-hyperclick){target="blank"} which requires [Hyperclick](https://atom.io/packages/hyperclick){target="blank"}
- [Use Rename to move files](http://timgthomas.com/2015/04/simple-file-tricks-with-atom/){target="blank"}
- Find previous: shift + enter in the search dialog
- Use Cmd+/ to comment: it know the right syntax for different language
- **Click the file name at the bottom bar to copy the full path**
- Use Settings -> Updates to update all extensions
- [Reset to Factory Defaults](https://flight-manual.atom.io/hacking-atom/sections/debugging/#reset-to-factory-defaults): `mv ~/.atom ~/.atom-backup`

#### [File/Directory Pattern Syntax](https://flight-manual.atom.io/using-atom/sections/find-and-replace/){target="blank"}
- Use [minimatch](https://github.com/isaacs/minimatch){target="blank"} and [glob patterns](https://en.wikipedia.org/wiki/Glob_%28programming%29){target="blank"}
- "globstar" pattern (\*\*) can be used to match arbitrarily many subdirectories: docs/\*\*/\*.md
- Exclude file types or paths: !
- Search only java source (exclude test) code: \*\*/src/main/\*\*/\*.java or \*.java,!\*Test.java(this also works in Eclipse)

### Limitation
- [Can't print directly](https://github.com/atom/atom/issues/3525){target="blank"}
  - Open it in Chrome
  - For markdown, use [markdown-preview-enhanced](https://github.com/shd101wyy/markdown-preview-enhanced){target="blank"} to open it in browser then print.

### apm
```bash
apm list --installed --enabled
apm list --installed --bare
apm upgrade --no-confirm
apm uninstall ${packagename}
```

### Resources
- [Atom Flight Manual](https://flight-manual.atom.io/){target="blank"}

---
#### [Related Posts](https://lifelongprogrammer.blogspot.com/search?q=label:Markdown|label:"Atom Editor"){target="blank"}
<script src="/feeds/posts/default/-/Atom Editor?orderby=updated&amp;alt=json-in-script&amp;callback=weightedRandomRelatedPosts&amp;max-results=20"></script>
<script src="/feeds/posts/default/-/Markdown?orderby=updated&amp;alt=json-in-script&amp;callback=weightedRandomRelatedPosts&amp;max-results=20"></script>
<script src="/feeds/posts/default/-/Dev Tips?orderby=updated&amp;alt=json-in-script&amp;callback=weightedRandomRelatedPosts&amp;max-results=20"></script>
