<!-- /2018/06/awesome-tips-about-chrome.html -->
### TL;DR
- Most commonly used chrome shortcuts, settings and tips.
- Most commonly used  chrome Extensions for developers and productivity.
- How to reduce memory.

---

### [Awesome Tips about Chrome Series](/search/label/Chrome_Series){target="blank"}
<script src="/feeds/posts/default/-/Chrome_Series?orderby=updated&amp;alt=json-in-script&amp;callback=series&amp;max-results=20"></script>

---

### [Chrome Shortcuts](/2018/05/keyboard-shortcuts-for-developers.html#chrome)
- Use [Shortkeys (Custom Keyboard Shortcuts)](https://chrome.google.com/webstore/detail/shortkeys-custom-keyboard/logpjaacgmcbpdkdchjiaagddngobkck) to assgin shortcuts to chrome standard commands if don't use [Chrome Vimium](/2019/04/awesome-tips-about-chrome-vimium.html).

|                           |                                                         |
| ------------------------- | ------------------------------------------------------- |
| Cmd+shift+J then close it | Close download bar                                      |
| Option+Cmd+left(right)    | go one tab left(right)                                  |
| **(Shift+)spacebar**      | **Page down(up)**                                       |
| **Command-Shift-V**       | **Paste without formatting**                            |
| Cmd+left(right)           | go back(forward) in history                             |
| ⌘ + Shift + w             | Closes the current window                               |
| ⌘ + Shift + j             | Open the Downloads page                                 |
| ⌘ + Option + i            | Open Developer Tools (not Cmd+shift+i: Email this page) |
| **Cmd+Option+C**          | Open dev tools in inspect mode                          |

#### If you REALLY don't want to use the `trackpad`
- [How to leave focus from address bar without mouse or trackpad](http://xavierchow.github.io/2016/03/07/vimium-leave-address-bar/)
  - We can press the trackpad to leave the address bar (when the mouse is at browser area, usually it's)
  - I avoid to use trackpad as possible as I can as my fingers hurt when use trackpad.
  - Luckily, we can add a custom search engine like below at chrome://settings/searchEngines.
  - Then we can type l then enter to go back to the browser area.

| Name                   | keyword | URL                                                                                                 |
|:---------------------- |:------- | --------------------------------------------------------------------------------------------------- |
| Leave Address bar      | l       | javascript:                                                                                         | 

### Must Have Google Chrome Extensions
- Read the [Must Have Google Chrome Extensions](/2019/04/must-have-google-chrome-extensions.html)
- Use [The Great Suspender](https://chrome.google.com/webstore/detail/the-great-suspender/klbibkeccnjlkjkiokjodocebajanakg/) together with [Chrome Vimium](/2019/04/awesome-tips-about-chrome-vimium.html), the Suspender reduces the memory usage, use [Chrome Vimium](/2019/04/awesome-tips-about-chrome-vimium.html) to find and go to specific tab quickly. 

### [How to Speed up Google Chrome]((/2019/03/how-to-speed-up-google-chrome.html))
- Read the [How to Speed up Google Chrome](/2019/03/how-to-speed-up-google-chrome.html)

### Chrome Urls
- chrome://flags/
- chrome://restart/

### Settings
#### Block notification requests
- go to chrome://settings/content/notifications
- toggle Ask before sending (recommended) to Blocked

#### Print
- Hide headers and footers

#### Close Download Bar
- ⌘ + Shift + j then ⌘ + W
<!-- - [Disable Download Bar](https://chrome.google.com/webstore/detail/disable-download-bar/epnnapjdpplekmodajomjojfpeicclep/related) -->

---

### Dark Mode
- [Dark Reader](https://chrome.google.com/webstore/detail/dark-reader/eimadpbcbfnmbkopoojfekhnkhdbieeh/related)
- Enable Mac's dark mode at Preferences -> General

### Task Manager
- Find memory(CPU) usage by tabs, extensions, and kill them.
- [Find all tabs opened](https://superuser.com/questions/290758/ways-to-see-a-list-of-all-the-tabs-open-in-chrome)

### Tips

|                                  |                                             |
| -------------------------------- | ------------------------------------------- |
| Drag multiple tabs to new window | hold the Command key                        |
| Open a Search in New Tab         | Hold down the Command button and hit return |
| Cmd+click                        | Open link in new tab                        |
- [How to Merge Multiple Tabs from Two Windows](http://interactivelogic.net/wp/2017/05/google-chrome-pro-tip-how-to-merge-multiple-tabs-from-two-google-chrome-windows-2/)
  - Left-click the first tab in the window you want to merge. While holding the shift key, left-click the right most tab. All of tabs for the current window are now selected, so you can drag and drop them as as group on the other window.

  <!-- ### Misc -->
- [Print only the selection](https://wiki.millersville.edu/display/instructdocs/Print+from+a+Selection+-+Mac+OSX+-+Chrome+and+Firefox)
  - Check "Selection only" in "More Settings" in the Print Dialog
  - Choose whether to include background graphics, default false
- [One line browser notepad](https://coderwall.com/p/lhsrcq/one-line-browser-notepad)
```html
data:text/html, <html contenteditable>
```
- Copy tooltip text: search the context in the Sources panel in dev tools
- [NET::ERR_CERTIFICATE_TRANSPARENCY_REQUIRED for known safe (intranet) sites](https://kurttappe.com/2017/05/15/whitelisting-unsecure-websites-in-recent-versions-of-chrome-for-macos/)
- edit /Library/Preferences/com.google.chrome.plist

<br/>

#### Auto Sync
<!-- - Turn on sync at chrome://settings/syncSetup -->
- [How Do Websites Disable Password Saving?](https://www.maketecheasier.com/remember-username-password-chrome/)
  - autocomplete=off
- [**Chrome sync keeps pausing and asking me to re-sign-in1**](https://support.google.com/chrome/thread/2320112?msgid=2402417)
  - chrome://settings/ and scroll down to the "Privacy and security" section and turn "Allow Chrome sign-in" off 
  <!-- - or on? -->
  - chrome://flags/#account-consistency: Default
  - Alt: Don't quit Chrome (until you have to), instead use  `The Great Suspender` to  `Ctrl+Shift+K` to `Suspend all tabs in all windows`


#### Chrome in Mobile/iPhone
- [Read it later (only) in iPhone/iPad](https://support.google.com/chrome/answer/7343019?co=GENIE.Platform%3DiOS&hl=en&oco=2)
- Long press the history button(<-, ->) to show history of current tab to quickly go to the specific page

### DevTools
- [DevTools Keyboard Shortcuts](https://developers.google.com/web/tools/chrome-devtools/shortcuts)

|                  |                                   |
|:---------------- |:--------------------------------- |
| Command+Option+I | Open whatever panel you used last |
| Command+[(or ])  | Focus the previous(next) panel    |
- Use **`Cmd+Shift+i`** and type partial of `Task Manager`, `Console`, `Inspect` to quickly open them. It also preserve your last search!
- Check `Enable Ctrl + 1-9 shortcut to switch panels` at DevTools Settings -> Appearance
- [We can search all response bodies in network tab](https://bugs.chromium.org/p/chromium/issues/detail?id=468416)
- [Copy XPath or selector from Elements panel](https://yizeng.me/2014/03/23/evaluate-and-validate-xpath-css-selectors-in-chrome-developer-tools/)

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

---
#### [Related Posts](/search?q=label:Chrome|label:Google)
<script src="/feeds/posts/default?q=label:Chrome|label:Google?orderby=updated&amp;alt=json-in-script&amp;callback=weightedRandomRelatedPosts&amp;max-results=20"></script>