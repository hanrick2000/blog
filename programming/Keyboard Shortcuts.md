<!-- http://lifelongprogrammer.blogspot.com/2018/05/keyboard-shortcuts.html -->
- Use Mac without a mouse and less fingers
- My fingers burn when use mac trackpad or touch bar, so try to use key board as possible as I can.
- Some shortcuts are supported by multiple applications, or we can customize them to use same shortcuts.

#### Mac
- More [Mac Tips](http://lifelongprogrammer.blogspot.com/2016/04/mac-tips-tricks-2016.html)

##### Turn on Full Keyboard Access
- Keyboard > Shortcuts > All Controls
- Control + F7 to switch the modes

##### [Mouse Keys](https://support.apple.com/kb/ph25642?locale=en_US)
- Command+Option+F5 > Open Accessibility Option
- Enable Press Option key five times to toggle Mouse Keys
- Move pointer: 7, 8, 9, 4, 6, 1, 2, 3
- Click mouse button: I
- Press and hold the mouse button: M
- Release the mouse button: .

##### Right Click
- When Mouse key is on, Fn-Ctrl-I
- Control + Click

##### Switch input source
- Keyboard > Shortcuts > Input Sources
- Select the previous input source: ctrl+space

##### [Shortcuts]<a name="mac-shortcuts"></a>
- Customize at Preferences > Keyboard > Shortcuts > Keyboard

|||
|-|-|
/ or Command+Shift+G|Go to Folder
Fn+F11|Show Desktop
Command+Shift+3|Capture the entire screen
Command+Shift+4|Capture a selected area
Control + a/e|Got to head/end - work in Terminal, Chrome, Atom
Command+\`|cycle between open windows in selected application
Command+Option+D|show or hide dock
Command + Option + Escape|Force Quit Applications
**Ctrl+F2** |**Access menu, enable it at Keyboard -> Shortcuts -> Keyboard**
**Cmd+Shift+?** |**Open Help menu and navigate**
^+F3|Move focus to dock 
**^+F8** |**Move focus to status menu, search all actions in menu**
Command+q|Quit the app
Command+shift+w|Close the window
Command + ,| Open Preferences  
Command+~|Switch windows for same application(Command-Shift-~, reverse order)
Command + X| Cut the highlighted text
**Shift+Alt+Command+V** | paste the highlighted text and matches the destination style
**Cmd+Shift++(-)** |Zoom in(out) text
Command + B/I/U | make text bold/italic/underlined
Shift+Arrow|Select text
**(Shift+)Option+Left(Right)** |**(Select)Jump by word**
**Cmd+Shift+Z** |**Redo**
**Fn + up(down)** | **Page up(down)**
**Cmd+1..8** |**Move tab**
**Cmd+9** |**Move to last tab**
**Cmd++(-)** | **Increase(Decrease) Font Size**
**Cmd+Shift+F** | **Enter full screen mode**
**Cmd+Space bar** | **Open Spotlight**


###### v(visual), c(caret mode), /(find mode)
###### vi mode movement
- h(move left), l(right), j(down), k(up), w(move to right one word), b(move to left one word)

---

##### Finder

|||
|-|-|
Command + up|go up a level
Command + down|open current selected folder in same window
Command + [(])| go bak or forward
Spacebar|preview(open) the item
Command + I|get info
- type to search

- [Disable the new touchbar function and have the old F-keys with brightness, volume backlight](https://apple.stackexchange.com/questions/288658/way-for-new-mac-touch-bar-to-behave-the-same-as-the-old-keyboard)
    - Keybard > select "Expanded Control Strip" in the "Touch Bar Shows"
- Keyboard > Shortcuts tab > "Function Keys" > Click the + and add the applications where you want the F-keys to always show

- [Switch dialog buttons using the keyboard](https://apple.stackexchange.com/questions/38015/how-can-i-switch-dialog-buttons-using-the-keyboard)
    - Keyboard > Keyboard Shortcuts > Select All controls under Full Keyboard Access
    - Use tab to switch between the dialog box
    - Use space(instead of enter) to trigger

#### Mac Mail<a name="mac-mail"></a>
|||
| --- | --- |
**Command+shift+D** |Send message
Command+shift+D|Forward message
**Command+shift+R** |Reply all
Command+shift+A|Attach files to message
Command+1|Go to inbox
Command+1 or +2 etc|Go to other items in favorites

<br/>

---

#### Chrome<a name="chrome"></a>
|||
|-|-|
Cmd+shift+J then close it|Close download bar
Option+Cmd+left(right)|go one tab left(right)
**(Shift+)spacebar**|**Page down(up)**
**Command-Shift-V** |**Paste without formatting**
Cmd+left(right)|go back(forward) in history  
⌘ + Shift + w|Closes the current window
⌘ + Shift + j|Open the Downloads page
⌘ + Option + i|Open Developer Tools - conflict in mac
**Cmd+Option+C** |Open dev tools in inspect mode
<br/>

##### Change/Assign extension's shortcuts
- chrome://extensions/shortcuts

####
Install [ Tampermonkey](https://chrome.google.com/webstore/detail/tampermonkey/dhdgffkkebhmkfjojejmpbldmpobfkfo) and then install the ["Auto Close YouTube Ads" script](https://greasyfork.org/en/scripts/9165-auto-close-youtube-ads)

#### Vimium<a name="vimium"></a>
- [Install from Chrome Webstore](https://chrome.google.com/webstore/detail/vimium/dbepggeogbaibhgnhhndojpepiihcmeb?hl=en)
- [How to use Vimium](https://github.com/philc/vimium/wiki)

|||
|-|-|
**(number+)W**|**move tabs(s) to new window**
**(number+)<<(>>)**|**Move tab to the left(right)**
**T**|**search through your open tabs**
B|Bookmark search  
**(number+)r**|**reload tab(s)**
**(number+)f(F)**|**open/click multiple links in the current(or new) tab or execute multiple action in same tab**
**(number+)x**|**close tabs(s)**
**^**|**Go to previously-visited tab**
**yt** |**duplicate current tab**
gE|Edit the current URL and open in a new tab
X|restore closed tab (i.e. unwind the 'x' command)
**gi** |**focus the first (or n-th) text input box on the page**
h/j/k/l|scroll left/down/up/right
**(number+)d(u)** | **half page down(up)**
yy|copy the current url to the clipboard
yf|copy a link url to the clipboard
p/P|search the text in clipboard using search engine 
**[[ or ]]** | **Follow the link labeled previous or \< \| next or \> - not always works**
**gu(or U)** | **Go up the URL hierarchy or Go to root of current URL hierarchy**
?| help

##### Customize keys
```
map m toggleMuteTab
map M toggleMuteTab all
map X toggleMuteTab other
map cl closeTabsOnLeft
map cr closeTabsOnRight
map co closeOtherTabs
map fi LinkHints.activateModeToOpenIncognito
unmap J
unmap K
unmap t
```

<br/>

---

#### iTerm<a name="iterm"></a>

|||
|-|-|
Cmd+\\|Show Annotations
Cmd+Click|Clickable Links
Cmd+Shift+H|Paste History
Cmd + k|Clear buffer
**Cmd+Shift+O** |**Open Quickly(Search tabs)**
**Cmd+;** |**Autocomplete**
**Cmd+Shift+;** |**Show Command History**
**Cmd+Shift+H** |**Show Paste History**
**Cmd+Option+/** |**Recent Directories popup**

---

#### VLC Player
- Preferences > HotKeys

|||
| --- | --- |
Cmd + F|Toggle Full Screen
Space|Toggle Play/Pause
Command + Shift + left/right|jump back/forward about a minute
Command + Ctrl + left/right|jump back/forward about ten seconds
Cmd + =(-)|Faster(Slower)
Cmd + Up(down)|Volume up(down)
Cmd+Option+P|Playlist

---

#### Atom<a name="atom"/>
- [More Atom Tips](http://lifelongprogrammer.blogspot.com/2017/10/tips-and-tricks-for-atom-editor.html)

|     |     |
| --- | --- |
**Command+P**|**Switch to File**
**Command+Shift+P**|**Command Palette**
**Command+\\** | **Toggle Tree View**
**Command+Enter** |**Replace all**
Cmd+Ctrl+G|Select all matching characters
Shift+Ctrl+M|Markdown Preview
Cmd+R|File symbol navigation
**Ctrl+Shift+C** | **Copy full path**
Ctrl + g| Go to Line
**Ctrl+m** | **Go to Matching Bracket**
**Cmd+Shift+t** | **Bring up the list of corrections (with spell-check extension)**
**Ctrl+Shift+left(or right)** | **move tab to left(or right)**
Cmd+k+u | Convert to Upper Case
Cmd+k+l | Convert to Lower Case
Ctrl+Shift+k|Delete Line
Ctrl+K|Cut to End of Line

- Shortcuts from [vim-mode-plus](https://github.com/t9md/atom-vim-mode-plus)

---

#### Eclipse
- [More Eclipse Tips](http://lifelongprogrammer.blogspot.com/2016/02/eclipse-tips-trick-2016.html)

|     |     |
| --- | --- |
Command+3|Quick Access( a lot of things, like switch views)
Cmd+1|Quick fix  
Cmd+F8|Switch between perspectives
Shift+F10|Open context menu
**Cmd+Option+X +T(J)** |**Run Junit test(Java Application)**
**Fn+Up(down)** |Page up(down)
Cmd+Option+ctrl+left(right)|Previous(next) tab, need manually add them in Pref > Keys
Cmd+Option+left(right)|Go to previous or next   
Ctrl+M|Maximize(restore) the editor area
Cmd+Shift+L|List all shortcuts
Cmd+I|Show info in project explorer
**Cmd+.** | **Next Error**
Cmd+E|Get a list of opened editors
**Ctrl+Option+Left(Right) - Customized** | **Previous (next) editor**
**Ctrl+U (From [More Unit](https://marketplace.eclipse.org/content/moreunit))** |create test method
Ctrl+J (From [More Unit](https://marketplace.eclipse.org/content/moreunit))|jump to test method
---

#### Quip
|||
| --- | --- |
Command+Option+1/2/3|Large/Medium/Small Heading
Command+Shift+L|Bulleted List
Command+Shift+7|Numbered List
Command+Option+K|Code block
Command+Option+C|Toggle Conversation
Command+/|Keyboard shortcuts