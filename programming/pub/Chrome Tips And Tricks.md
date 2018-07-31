<!-- http://lifelongprogrammer.blogspot.com/2018/06/chrome-tips-and-tricks.html -->
#### [Chrome Shortcuts](http://lifelongprogrammer.blogspot.com/2018/05/keyboard-shortcuts.html#chrome)
|||
|-|-|
Cmd+shift+J then close it|Close download bar
Option+Cmd+left(right)|go one tab left(right)
**(Shift+)spacebar**|**Page down(up)**
**Command-Shift-V** |**Paste without formatting**
Cmd+left(right)|go back(forward) in history  
⌘ + Shift + w|Closes the current window
⌘ + Shift + j|Open the Downloads page
⌘ + Option + i|Open Developer Tools (not Cmd+shift+i: Email this page)
**Cmd+Option+C** |Open dev tools in inspect mode
<br/>

#### Chrome Extensions
- **[Vimium](https://chrome.google.com/webstore/search/Vimium?_category=extensions)**
- **[Tab Position Customizer 2](https://chrome.google.com/webstore/detail/tab-position-customizer-2/jglbflnkbgbklegdblkohbbbheeeklej?hl=en)**
  - Open new tab/link on the right of the current tabs
- **[Enable Copy](https://chrome.google.com/webstore/detail/enable-copy/lmnganadkecefnhncokdlaohlkneihio)**
- [Tab Scissors - split tabs into 2 windows](https://chrome.google.com/webstore/detail/tab-scissors/cdochbecpfdpjobpgnacnbepkgcfhoek/related?hl=en)
- **[Shortkeys](https://chrome.google.com/webstore/detail/shortkeys-custom-keyboard/logpjaacgmcbpdkdchjiaagddngobkck/reviews)**
  * [Disable command+shift+i(send email), command+shift+f(Always show toolbar in full screen)](https://apple.stackexchange.com/questions/108060/how-to-prevent-command-i-command-shift-i-from-opening-mac-mail-when-in-browser)
    - Activation Settings -> All Sites
- **[Weava Highlighter - PDF & Web](https://chrome.google.com/webstore/detail/weava-highlighter-pdf-web/cbnaodkpfinfiipjblikofhlhlcickei/related)**
- [Click to Remove Element](https://chrome.google.com/webstore/detail/click-to-remove-element/jcgpghgjhhahcefnfpbncdmhhddedhnk)
- [Search Plus](https://chrome.google.com/webstore/detail/search-plus/cdpohbejnbclggljmoijjcpdhbaaijfm)
- [Simple Allow Copy](https://chrome.google.com/webstore/detail/simple-allow-copy/aefehdhdciieocakfobpaaolhipkcpgc)
- [Tampermonkey](https://chrome.google.com/webstore/detail/tampermonkey/dhdgffkkebhmkfjojejmpbldmpobfkfo)
  * [Auto Close YouTube Ads](https://greasyfork.org/en/scripts/9165-auto-close-youtube-ads)
  * [Wide Github](chrome-extension://dhdgffkkebhmkfjojejmpbldmpobfkfo/ask.html?aid=85e76337-bc4b-47c6-8448-176e7da56af0)
- [Sight - Syntax Highlighter](https://chrome.google.com/webstore/search/Sight?_category=extensions)
- [Tab Modifier](https://chrome.google.com/webstore/detail/tab-modifier/hcbgadmbdkiilgpifjgcakjehmafcjai)
- [Proxy SwitchyOmega](https://chrome.google.com/webstore/detail/proxy-switchyomega/padekgcemlokbadohgkifijomclgjgif)
- [ModHeader](https://chrome.google.com/webstore/detail/modheader/idgpnmonknjnojddfkpgkljpfnnfcklj)
    - Example: Set "Content-Type" in response to application/json
- [Grammarly](https://chrome.google.com/webstore/detail/grammarly-for-chrome/kbfnbcaeplbcioakkpcpgfkobkghlhen)
    - [Also a standalone Mac App](https://app.grammarly.com/)
    - Use this together with Chrome's native spell checker
    - Check on demand: Change "Site access" to "On Click"
- [Google Translate](https://chrome.google.com/webstore/detail/google-translate/aapbdbdomjkkjkaonfhkkikfgjllcleb)
- [Awesome Screenshot: Screen Video Recorder](https://chrome.google.com/webstore/detail/awesome-screenshot-screen/nlipoenfbbikpbjkfpfillcgkoblgpmj)
- [OneTab - save memory](https://chrome.google.com/webstore/detail/onetab/chphlpgkkbolifaimnlloiipkdnihall/)
- [Close download bar: Option+W](https://chrome.google.com/webstore/detail/close-download-bar/bkfclmjddajodogcbpohgfpdkgdecgmg)

### [Chrome Vimium](https://github.com/philc/vimium)
- [Install from Chrome Webstore](https://chrome.google.com/webstore/detail/vimium/dbepggeogbaibhgnhhndojpepiihcmeb?hl=en)
- [How to use Vimium](https://github.com/philc/vimium/wiki)
- [Shortcuts](http://lifelongprogrammer.blogspot.com/2018/05/keyboard-shortcuts.html#vimium)

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
- numbers+command
    - number+x-close multiple tabs
    - number+r-reload multiple tabs
    - number+W-move multiple tabs to new window
    - number+<<(>>) move multiple tabs
    - (number+)f(F)-open multiple links
    - (number+)d(u)- multiple half page(up) down
- Find Mode (/)
    - Support regex(\r)
    - Find queries are global and persistent
    - Use <Up> and <Down> to re-use previous queries
- [Visual Mode](https://github.com/philc/vimium/wiki/Visual-Mode)
    - v or V (line mode)
    - o to swap the anchor and the focus
    - c to enter caret mode from a visual mode
    - vi-like movements: $
##### Customize keys
- [source 1](https://avilpage.com/2014/04/useful-custom-key-maps-for-vimium-to.html)
```text
map h goBack
map l goForward
map o Vomnibar.activateInNewTab
map O Vomnibar.activate
map b Vomnibar.activateBookmarksInNewTab
map B Vomnibar.activateBookmarks
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

### [Tampermonkey](https://chrome.google.com/webstore/detail/tampermonkey/dhdgffkkebhmkfjojejmpbldmpobfkfo)
- [Auto Close YouTube Ads
](https://greasyfork.org/en/scripts/9165-auto-close-youtube-ads)

### Chrome Urls
- chrome://flags/
- chrome://restart/

### Change/Assign extension's shortcuts
- chrome://extensions/shortcuts

### Settings
#### Block notification requests
- go to chrome://settings/content/notifications
- toggle Ask before sending (recommended) to Blocked

#### Print
- Hide headers and footers

#### Close Download Bar
- ⌘ + Shift + j then ⌘ + W
- [Disable Download Bar](https://chrome.google.com/webstore/detail/disable-download-bar/epnnapjdpplekmodajomjojfpeicclep/related)

<br/>

### Tips
|     |     |
| --- | --- |
Drag multiple tabs to new window|hold the Command key
Open a Search in New Tab|Hold down the Command button and hit return
Cmd+click|Open link in new tab
- [How to Merge Multiple Tabs from Two Windows](http://interactivelogic.net/wp/2017/05/google-chrome-pro-tip-how-to-merge-multiple-tabs-from-two-google-chrome-windows-2/)
  - Left-click the first tab in the window you want to merge. While holding the shift key, left-click the right most tab. All of tabs for the current window are now selected, so you can drag and drop them as as group on the other window.

### Misc
- [Print only the selection](https://wiki.millersville.edu/display/instructdocs/Print+from+a+Selection+-+Mac+OSX+-+Chrome+and+Firefox)
  - Check "Selection only" in "More Settings" in the Print Dialog
  - Choose whether to include background graphics, default false
- [One line browser notepad](https://coderwall.com/p/lhsrcq/one-line-browser-notepad)
  * data:text/html, <html contenteditable>
- Copy tooltip text: search the context in the Sources panel in dev tools
- [NET::ERR_CERTIFICATE_TRANSPARENCY_REQUIRED for known safe (intranet) sites](https://kurttappe.com/2017/05/15/whitelisting-unsecure-websites-in-recent-versions-of-chrome-for-macos/)
- edit /Library/Preferences/com.google.chrome.plist

<br/>

### Auto Sync
- [How Do Websites Disable Password Saving?](https://www.maketecheasier.com/remember-username-password-chrome/)
  - autocomplete=off
- [**Chrome sync keeps pausing and asking me to re-sign-in1**](https://support.google.com/chrome/thread/2320112?msgid=2402417)
  - chrome://settings/ and scroll down to the "Privacy and security" section and turn "Allow Chrome sign-on" off
  - chrome://flags/#account-consistency: Default

#### DevTools
- Cmd+P | Open File
- Cmd+Shift+P | Run Command
- [We can search all response bodies in network tab](https://bugs.chromium.org/p/chromium/issues/detail?id=468416)

<br/>

### [Extension Development](https://developer.chrome.com/extensions/overview)
- Partition code into background scripts and content scripts
- [Content Scripts](https://developer.chrome.com/extensions/content_scripts)
    - Run in the context of web pages
    - limited access to Chrome APIs
    - Use Chrome Dev Tools to debug it
- Background Scripts
    - Full access to Chrome APIs, but no access to web page content
    -  Use background.html page in chrome://extensions/ to debug it
- [Message Passing](https://developer.chrome.com/apps/messaging)
    - Some functions can be only run in context scripts, some only in background script, use message passing to pass data in different context 
    - [Disable Blocking of Mixed Content](https://stackoverflow.com/questions/36348559/chrome-extension-disable-blocking-of-mixed-content)
    - chrome.tabs.sendMessage, chrome.extension.onMessage.addListener
- [chrome.commands|shortcuts](https://developer.chrome.com/apps/commands)

#### APIs
- chrome.contextMenus.create
- window.getSelection()