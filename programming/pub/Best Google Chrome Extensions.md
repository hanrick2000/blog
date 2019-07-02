---
toc-depth: 4
---

---

##### [Awesome Tips Series about Chrome](https://lifelongprogrammer.blogspot.com/search/label/Chrome_Series){target="blank"}
<script src="/feeds/posts/default/-/Chrome_Series?orderby=updated&amp;alt=json-in-script&amp;callback=series&amp;max-results=20"></script>

---

<!-- SD:
The Must Have Chrome Extensions for Reading, Writing, Youtube, Productivity and Tab Management, and How to Reduce the Memory Usage.
-->

### Must-Have Chrome Extensions
- Use [The Great Suspender](https://chrome.google.com/webstore/detail/the-great-suspender/klbibkeccnjlkjkiokjodocebajanakg/) together with [Chrome Vimium](https://lifelongprogrammer.blogspot.com/2019/04/awesome-tips-about-chrome-vimium.html), the Suspender reduces the memory usage, use [Chrome Vimium](https://lifelongprogrammer.blogspot.com/2019/04/awesome-tips-about-chrome-vimium.html) to find and go to specific tab quickly.
<!-- - [The Great Suspender](https://chrome.google.com/webstore/detail/the-great-suspender/klbibkeccnjlkjkiokjodocebajanakg/)
- [Chrome Vimium](https://chrome.google.com/webstore/search/Vimium?_category=extensions) -->

### Chrome Extensions for Tabs
- [The Great Suspender](https://chrome.google.com/webstore/detail/the-great-suspender/klbibkeccnjlkjkiokjodocebajanakg/){#suspender target="blank"}
  - Force suspend all other tabs in this window
  - Restore session
    - [if tabs are lost: this may happen when make some permission changes in chrome://extensions or upgrade](https://github.com/deanoemcke/thegreatsuspender/issues/526)
  - Assign shortcut at chrome://extensions/shortcuts
    - `Ctrl+Shift+S` to `Suspend/Unsuspend active tabs`
    - `Ctrl+Shift+A` to `Suspend all other tabs in active window`
    - `Ctrl+Shift+K` to `Suspend all tabs in all windows`

- **[Tab Position Customizer 2](https://chrome.google.com/webstore/detail/tab-position-customizer-2/jglbflnkbgbklegdblkohbbbheeeklej)**
  - Open new tab/link on the right of the current tabs
  - Activate Tab After Tab Closing: Left tab
  - Open pop-up window as new tab
    - This can be useful when you want to take a screenshot of the pop-up window
    - We can also set exceptions for some website (if it doesn't work for them)
- [Tab Scissors - split tabs into 2 windows](https://chrome.google.com/webstore/detail/tab-scissors/cdochbecpfdpjobpgnacnbepkgcfhoek/related)
- [Tab Modifier](https://chrome.google.com/webstore/detail/tab-modifier/hcbgadmbdkiilgpifjgcakjehmafcjai)
- [OneTab - save memory](https://chrome.google.com/webstore/detail/onetab/chphlpgkkbolifaimnlloiipkdnihall/)

### Chrome Extensions for Reading<a name="read"></a>
#### [Dark Reader](https://chrome.google.com/webstore/detail/dark-reader/eimadpbcbfnmbkopoojfekhnkhdbieeh)
- Also enable Mac's dark mode at Preferences -> General

#### Ad Blocker
- [Adblock Plus](https://chrome.google.com/webstore/detail/adblock-plus-free-ad-bloc/cfhdojbkjhnklbpkdaibdccddilifddb)
  - Able to enable/disable on sit
- [AdBlock](https://chrome.google.com/webstore/detail/adblock/gighmmpiobklfepjocnamgkkbiglidom)
- [BlockAdblock](https://blockadblock.com/)

#### [Reader View](https://chrome.google.com/webstore/detail/reader-view/ecabifbgmdmgdllomnfinbmaellmclnh)<a name="reader_view"></a>
- This opens the page in chrome-extension:// and we have to wait until (at least) the main content of the page is loaded.
- The greatest thing is it **reduces the memory usage a LOT** for pages that load a lot of flashes, ads.
  - e.g. reduces this [page](https://www.macworld.co.uk/how-to/mac/should-i-log-out-my-mac-or-just-shut-down-3623615/){target="blank"} from around 450+ mb to 87mb.
- This also works well together with `The Great Suspender`: the page in reader view will not be suspended as it runs in extension mode.
- Assign shortcut `Ctrl+Shift+R` to `Toggle the Reader View`
- Print and save the reader mode version, show or hide image.
- Able to change the speed of `text-to-speech`
- The Cron is it doesn't work with other extensions, e.g., [Chrome Vimium](https://lifelongprogrammer.blogspot.com/2019/04/awesome-tips-about-chrome-vimium.html)
  - as It opens the page in chrome-extension.

##### Tips
- Before `Ctrl+Shift+R` to enter reader view:
  - Copy the url `Ctrl+l then Ctrl+c` or `yy` from [Chrome Vimium](https://lifelongprogrammer.blogspot.com/2019/04/awesome-tips-about-chrome-vimium.html){target="blank"}
  - `Cmd+down` to scroll to the end of page first to make sure the page load completes.
- **[It adds the page url to the first line from there we can copy the page url](https://github.com/rNeomy/reader-view/issues/41)**


#### [Just Read](https://chrome.google.com/webstore/detail/just-read/dgmanlpmmkibanfdgjocnabmcaclkmod)
- Able to change theme(dark or light), width, font size and save the config.
- [Assign `Ctrl+Shift+L` to `Open the Just Read format for the current page`](https://github.com/ZachSaucier/Just-Read/blob/master/manifest.json)
- Assign `Ctrl+Shift+K` to `Enable user text selection mode using Just Read`, then choose which part you want to select then enter (it will automatically try best to choose), it will show the section in read mode.
<!-- (it will automatically choose the best area) -->
- When it doesn't work(e.g. in quip), use `View this selection in Just Read`.
- Works with [Chrome Vimium](https://lifelongprogrammer.blogspot.com/2019/04/awesome-tips-about-chrome-vimium.html)
<!-- - Cron:
  - The upgrade remainder is a little annoying (frequently). -->
  <!-- - Doesn't work in some websites. -->

#### [Clearly](https://chrome.google.com/webstore/detail/clearly/odfonlkabodgbolnmmkdijkaeggofoop)
- Assign shortcut `Ctrl+Shift+C` to `Toggle Clearly`
- Make `not easy to copy text` easier to copy
- Support outline, different themes, fullscreen, text-to-voice
- Cron: Can't change the width
- [Distill Page from Chrome](https://lifehacker.com/how-to-install-google-chrome-s-experimental-reader-mode-1834171339)
- the result is not that good, and hard to run the command.

#### [Mercury Reader](https://chrome.google.com/webstore/detail/mercury-reader/oknpjjbmpnndlpmnhmekjpocelpnlfdi/)
- can't change width

##### Summary
- Use [Reader View](https://chrome.google.com/webstore/detail/reader-view/ecabifbgmdmgdllomnfinbmaellmclnh) when the page(website) is slow: load lots of ads, flash, uses a lot of memory and you will take time(2+ mins) to read it.
- Use [Just Read](https://chrome.google.com/webstore/detail/just-read/dgmanlpmmkibanfdgjocnabmcaclkmod) in other case.
- Use [Clearly](https://chrome.google.com/webstore/detail/clearly/odfonlkabodgbolnmmkdijkaeggofoop) to check the outline.

### Chrome Extensions for Writing
- [Grammarly](https://chrome.google.com/webstore/detail/grammarly-for-chrome/kbfnbcaeplbcioakkpcpgfkobkghlhen)
    - Add `contenteditable="true"` to div(`div class="post-outer" in blogger`) to make Grammarly work anywhere.
    - [Also a standalone Mac App](https://app.grammarly.com/)
    - Use this together with Chrome's native spell checker
    - Check on demand: Change "Site access" to "On Click" (to reduce memory usage)
- [Make Google Images Great Again](https://chrome.google.com/webstore/detail/make-google-images-great/kjlaimldplcbblpgenlhfjpobmolcblj)
- [Markdown Here](https://chrome.google.com/webstore/detail/markdown-here/elifhakcjgalahccnjkneoccemfahfoa)
  - Write Email with Markdown.

### Chrome Extensions for Sharing
- [Buffer](https://chrome.google.com/webstore/detail/buffer/noojglkidnpfjbincgijbaiedldjfbhh/)
  - Assign shortcut `Ctrl+Shift+B` to `Buffer -> Activate the extension` at chrome://extensions/shortcuts
- [Save to Pocket](https://chrome.google.com/webstore/detail/save-to-pocket/niloccemoadcdkdjlinkgdfekeahmflj)
  - Also install the mobile apps, so we can save to pocket everywhere.
- [Evernote Web Clipper](https://chrome.google.com/webstore/detail/evernote-web-clipper/pioclpoplcdbaefihamjohnefbikjilc)

### Chrome Extensions For Developer
- [Chrome Regex Search](https://chrome.google.com/webstore/detail/chrome-regex-search/bpelaihoicobbkgmhcbikncnpacdbknn)
- [Sight - Syntax Highlighter](https://chrome.google.com/webstore/search/Sight?_category=extensions)
- [ModHeader](https://chrome.google.com/webstore/detail/modheader/idgpnmonknjnojddfkpgkljpfnnfcklj)
    - Example: Set "Content-Type" in response to application/json

### Chrome Extensions for Productivity
- [**Chrome Vimium**](https://chrome.google.com/webstore/search/Vimium?_category=extensions)
  - [Awesome Tips About Chrome Vimium](https://lifelongprogrammer.blogspot.com/2019/04/awesome-tips-about-chrome-vimium.html){target="blank"}
- [Tampermonkey](https://chrome.google.com/webstore/detail/tampermonkey/dhdgffkkebhmkfjojejmpbldmpobfkfo)
  * [Auto Close YouTube Ads](https://greasyfork.org/en/scripts/9165-auto-close-youtube-ads)
  * [Wide Github]([Wide Github](https://openuserjs.org/scripts/xthexder/Wide_Github)
  * Find user scrips at [openuserjs](https://openuserjs.org/) or [greasyfork](https://greasyfork.org/en/scripts)
- [Search Plus](https://chrome.google.com/webstore/detail/search-plus/cdpohbejnbclggljmoijjcpdhbaaijfm)
  - Search tabs contains specific words
  - Move these tabs into one window
- [Shortkeys (Custom Keyboard Shortcuts)](https://chrome.google.com/webstore/detail/shortkeys-custom-keyboard/logpjaacgmcbpdkdchjiaagddngobkck/reviews)
  * [Disable command+shift+i(send email), command+shift+f(Always show toolbar in full screen)](https://apple.stackexchange.com/questions/108060/how-to-prevent-command-i-command-shift-i-from-opening-mac-mail-when-in-browser)
    - Activation Settings -> All Sites
- [Click to Remove Element](https://chrome.google.com/webstore/detail/click-to-remove-element/jcgpghgjhhahcefnfpbncdmhhddedhnk)
- [Simple Allow Copy](https://chrome.google.com/webstore/detail/simple-allow-copy/aefehdhdciieocakfobpaaolhipkcpgc)
- [Proxy SwitchyOmega](https://chrome.google.com/webstore/detail/proxy-switchyomega/padekgcemlokbadohgkifijomclgjgif)
- [Google Translate](https://chrome.google.com/webstore/detail/google-translate/aapbdbdomjkkjkaonfhkkikfgjllcleb)
- [Awesome Screenshot: Screen Video Recorder](https://chrome.google.com/webstore/detail/awesome-screenshot-screen/nlipoenfbbikpbjkfpfillcgkoblgpmj)
- [Picture-in-Picture Extension](https://chrome.google.com/webstore/detail/picture-in-picture-extens/hkgfoiooedgoejojocmhlaklaeopbecg)

<!-- - [Close download bar: Option+W](https://chrome.google.com/webstore/detail/close-download-bar/bkfclmjddajodogcbpohgfpdkgdecgmg) -->
<!-- - [Just Read](https://chrome.google.com/webstore/detail/just-read/dgmanlpmmkibanfdgjocnabmcaclkmod) -->
<!-- - **[Weava Highlighter - PDF & Web](https://chrome.google.com/webstore/detail/weava-highlighter-pdf-web/cbnaodkpfinfiipjblikofhlhlcickei/related)** -->

- [Video Speed Controller](https://chrome.google.com/webstore/detail/video-speed-controller/nffaoalbilbmmfgbnbgppjihopabppdk)
  - Change speed up to 16x
  - S - decrease playback speed.
  - D - increase playback speed.
  - R - reset playback speed.
  - V - show/hide controller.


### Chrome Extensions for Youtube
- [Video Adblocker for Youtube™ Extension](https://chrome.google.com/webstore/detail/video-adblocker-for-youtu/hflefjhkfeiaignkclmphmokmmbhbhik)

#### Always on top Floating Mini Player for YouTube™.
- [Floating for YouTube™ Extension](https://chrome.google.com/webstore/detail/floating-for-youtube/jjphmlaoffndcnecccgemfdaaoighkel)
- [Floating for YouTube™ Extension](https://chrome.google.com/webstore/detail/floating-for-youtube-exte/egncdnniomonjgpjbapalkckojhkfddk)

### Hacking
#### [Unblock Youku](https://chrome.google.com/webstore/detail/unblock-youku/pdnfnkhpgegpcingjbfihlkjeighnddk)
- Helps users access their web services while traveling outside mainland China.

#### [Tampermonkey](https://chrome.google.com/webstore/detail/tampermonkey/dhdgffkkebhmkfjojejmpbldmpobfkfo)
* Find user scrips at [openuserjs](https://openuserjs.org/) or [greasyfork](https://greasyfork.org/en/scripts)
* [Auto Close YouTube Ads](https://greasyfork.org/en/scripts/9165-auto-close-youtube-ads)
* [Wide Github]([Wide Github](https://openuserjs.org/scripts/xthexder/Wide_Github)
* [Endless Google](https://openuserjs.org/scripts/tumpio/Endless_Google)
* [bye-flash-hello-html5](https://greasyfork.org/en/scripts/30879-bye-flash-hello-html5-%E5%86%8D%E8%A7%81flash-%E4%BD%A0%E5%A5%BDhtml5)
  - Use HTML5 Player instead of flash player

<!-- * [破解VIP会员视频集合](https://greasyfork.org/zh-CN/scripts/27530-%E7%A0%B4%E8%A7%A3vip%E4%BC%9A%E5%91%98%E8%A7%86%E9%A2%91%E9%9B%86%E5%90%88)
* [百度网盘直链下载助手](https://greasyfork.org/zh-CN/scripts/39504-%E7%99%BE%E5%BA%A6%E7%BD%91%E7%9B%98%E7%9B%B4%E9%93%BE%E4%B8%8B%E8%BD%BD%E5%8A%A9%E6%89%8B)

-->

---

### [Chrome Vimium](https://lifelongprogrammer.blogspot.com/2019/04/awesome-tips-about-chrome-vimium.html)
- [Awesome Tips About Chrome Vimium](https://lifelongprogrammer.blogspot.com/2019/04/awesome-tips-about-chrome-vimium.html){target="blank"}

---

<!-- ### [Tampermonkey](https://chrome.google.com/webstore/detail/tampermonkey/dhdgffkkebhmkfjojejmpbldmpobfkfo)
- [Auto Close YouTube Ads](https://greasyfork.org/en/scripts/9165-auto-close-youtube-ads) -->

##### Change/Assign extension's shortcuts
- chrome://extensions/shortcuts
- `Ctrl+Shift+S` to `The Great Suspender > Suspend selected tabs`
- `Ctrl+Shift+A` to `The Great Suspender > Suspend all other tabs in active window`
- Assign `Ctrl+Shift+R` to `Toggle the Reader View`
- Assign `Ctrl+Shift+C` to `Toggle Clearly`
- [Assign `Ctrl+Shift+L` to `Open the Just Read format for the current page`](https://github.com/ZachSaucier/Just-Read/blob/master/manifest.json)
- Assign `Cmd+Shift+C` to `Open the Just Read format for the current page`
- Assign `Ctrl+Shift+B` to `Buffer -> Activate the extension`

---

### [How To Reduce Chrome Memory Usage](https://lifelongprogrammer.blogspot.com/2019/03/how-to-speed-up-google-chrome.html){target="blank"}

---

##### [Related Posts](https://lifelongprogrammer.blogspot.com/search/label/Chrome)
<script src="/feeds/posts/default/-/Chrome?orderby=updated&amp;alt=json-in-script&amp;callback=weightedRandomRelatedPosts&amp;max-results=20"></script>
