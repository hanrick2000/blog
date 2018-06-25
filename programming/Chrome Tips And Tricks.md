<!-- http://lifelongprogrammer.blogspot.com/2018/06/chrome-tips-and-tricks.html -->
#### [Shortcuts](http://lifelongprogrammer.blogspot.com/2018/05/keyboard-shortcuts.html#chrome)
#### Chrome Extensions
- **[Vimium](https://chrome.google.com/webstore/search/Vimium?_category=extensions)**
- **[Weava Highlighter - PDF & Web](https://chrome.google.com/webstore/detail/weava-highlighter-pdf-web/cbnaodkpfinfiipjblikofhlhlcickei/related)**
- [Click to Remove Element](https://chrome.google.com/webstore/detail/click-to-remove-element/jcgpghgjhhahcefnfpbncdmhhddedhnk)
- [Search Plus](https://chrome.google.com/webstore/detail/search-plus/cdpohbejnbclggljmoijjcpdhbaaijfm)
- [Simple Allow Copy](https://chrome.google.com/webstore/detail/simple-allow-copy/aefehdhdciieocakfobpaaolhipkcpgc)
- [Tampermonkey](https://chrome.google.com/webstore/detail/tampermonkey/dhdgffkkebhmkfjojejmpbldmpobfkfo)
- [Sight - Syntax Highlighter](https://chrome.google.com/webstore/search/Sight?_category=extensions)
- [Tab Modifier](https://chrome.google.com/webstore/detail/tab-modifier/hcbgadmbdkiilgpifjgcakjehmafcjai)
- [Proxy SwitchyOmega](https://chrome.google.com/webstore/detail/proxy-switchyomega/padekgcemlokbadohgkifijomclgjgif)
- [ModHeader](https://chrome.google.com/webstore/detail/modheader/idgpnmonknjnojddfkpgkljpfnnfcklj)
- Grammarly
- [Google Translate](https://chrome.google.com/webstore/detail/google-translate/aapbdbdomjkkjkaonfhkkikfgjllcleb)
- [Awesome Screenshot: Screen Video Recorder](https://chrome.google.com/webstore/detail/awesome-screenshot-screen/nlipoenfbbikpbjkfpfillcgkoblgpmj)

##### [Chrome Vimium](https://github.com/philc/vimium)
- [Shortcuts](http://lifelongprogrammer.blogspot.com/2018/05/keyboard-shortcuts.html#vimium)
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
    - c to enter caret mode from visual mode
    - vi-like movements: $

##### [Tampermonkey](https://chrome.google.com/webstore/detail/tampermonkey/dhdgffkkebhmkfjojejmpbldmpobfkfo)
- [Auto Close YouTube Ads
](https://greasyfork.org/en/scripts/9165-auto-close-youtube-ads)

##### Chrome Urls
- chrome://flags/
- chrome://restart/

##### Change/Assign extension's shortcuts
- chrome://extensions/shortcuts

#### Settings
##### Block notification requests
- go to chrome://settings/content/notifications
- toggle Ask before sending (recommended) to Blocked

###### Close Download Bar
- ⌘ + Shift + j then ⌘ + W
- [Disable Download Bar](https://chrome.google.com/webstore/detail/disable-download-bar/epnnapjdpplekmodajomjojfpeicclep/related)

<br/>

#### Tips
|     |     |
| --- | --- |
Drag multiple tabs to new window|hold the Command key
Open a Search in New Tab|Hold down the Command button and hit return
Cmd+click|Open link in new tab

<br/>

#### DevTools
- Cmd+P | Open File
- Cmd+Shift+P | Run Command

<br/>

#### [Extension Development](https://developer.chrome.com/extensions/overview)
##### Partition code into background scripts and content scripts
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


##### APIs
- chrome.contextMenus.create
- window.getSelection()
