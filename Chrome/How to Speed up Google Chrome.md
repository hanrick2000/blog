---
toc-depth: 5
description: How to Speed up Google Chrome, free up its memory usage and stay productivity at same time. Use The Great Suspender, Chrome Vimium and Reader View.
---

###### [Awesome Tips about Chrome Series](https://lifelongprogrammer.blogspot.com/search/label/Chrome_Series){target="blank"}
<script src="https://lifelongprogrammer.blogspot.com/feeds/posts/default/-/Chrome_Series?orderby=updated&amp;alt=json-in-script&amp;callback=series&amp;max-results=20"></script>

#### Chrome Extensions to Speed up Chrome
##### Ad Blocker
- [Adblock Plus](https://chrome.google.com/webstore/detail/adblock-plus-free-ad-bloc/cfhdojbkjhnklbpkdaibdccddilifddb)
  - Able to enable/disable ads on specific sites
- [AdBlock](https://chrome.google.com/webstore/detail/adblock/gighmmpiobklfepjocnamgkkbiglidom)

##### [The Great Suspender](https://chrome.google.com/webstore/detail/the-great-suspender/klbibkeccnjlkjkiokjodocebajanakg/){target="blank"}
- Use [The Great Suspender](https://chrome.google.com/webstore/detail/the-great-suspender/klbibkeccnjlkjkiokjodocebajanakg/) together with [Chrome Vimium](https://lifelongprogrammer.blogspot.com/2019/04/awesome-tips-about-chrome-vimium.html), the Suspender reduces the memory usage, use [Chrome Vimium](https://lifelongprogrammer.blogspot.com/2019/04/awesome-tips-about-chrome-vimium.html) to find and go to specific tab quickly.
- After restart Chrome, the suspended pages remain suspended, Great!
- Automatically suspend tabs after: `5 mins`
- Uncheck `Never suspend active tab in each window`
- Uncheck `Never suspend tabs that are playing audio`
- Use `Suspend/Unsuspend active tab` and `Suspend all tabs in all windows` to suspend all pages not working on now.

<!-- -Text Mode or doesn't works
 [This webpage's](https://www.zdnet.com/pictures/free-must-have-google-chrome-extensions) is reduced from 250(max 400mx) to  -->

##### [Reader View](https://chrome.google.com/webstore/detail/reader-view/ecabifbgmdmgdllomnfinbmaellmclnh)
- it **reduces the memory usage a LOT** for pages that load a lot of flashes, ads.
- e.g. reduces this [page](https://www.macworld.co.uk/how-to/mac/should-i-log-out-my-mac-or-just-shut-down-3623615/){target="blank"} from around 450+ mb to 87mb.
- read [here](https://lifelongprogrammer.blogspot.com/2019/04/must-have-google-chrome-extensions.html ){target="blank"} for more info about Reader View.
  - The pros and crons, when to use it and the alternatives and other [must-have google chrome extensions](https://lifelongprogrammer.blogspot.com/2019/04/must-have-google-chrome-extensions.html ){target="blank"}


Use `Cmd+Shift+A` to suspend all tabs in current window, `Cmd+Shift+R` to open the current tab in `Reader View`.

#### Manage Tabs to Speed up Chrome
- Kill tabs that uses a lot of memory at `More Tools -> Task Manager`, reload then if needed.
- **Kill tabs not needed more aggressively**
  - Install [Chrome Vimium](https://lifelongprogrammer.blogspot.com/2019/04/awesome-tips-about-chrome-vimium.html)
  - `cl` to close left tabs, `cr` to kill right tabs, `co` to kill other tabs
  - `count + x` to kill right x tabs
- Use `The Great Suspender` to suspend pages aggressively

##### Reuse Existing Tabs
- In Chrome search tabs, click `Switch to this tab`
  - Unfortunately this doesn't work with suspended tabs
- Use `Shift+t` the [Chrome Vimium Vomnibar](https://lifelongprogrammer.blogspot.com/2019/04/awesome-tips-about-chrome-vimium.html) to search and go to existing tabs instead open a new one
  - Works well with suspended tabs

##### Don't Command+Shift+T to Search Recently Closed Pages, Use Chrome Search History Instead
- Try to reopen one specific page (not the last one) after close the window, or multiple pages, don't use <kbd>Ctrl</kbd>+<kbd>Shift</kbd>+<kbd>T</kbd> to reopen them then try to find it: reopening them would cause a lot of memory spike and may cause disk spin etc.
- Directly use Chrome Search history to find the page: search or scan last several pages.

##### Open Less Tabs
When you are Google search a topic, you know you are going to take times to read these pages: don't open too many search results at once. Read the first few first, if still need, open more search results.

#### Manage Installed Extensions to Speed up Chrome
- Check memory used at `More Tools -> Task Manager`
- Uninstall extensions that are not used any more
- Temporarily disable  that uses occasionally
  - like ModHeader, Search Plus, Screenshot
- Change "Allow this extension to read and change all your data on websites you visit:" to `On click` or `On specific sites`
- Kill the extensions that uses a lot of memory then reload them
  - Sometimes, Google Translate uses 600+ memory, just kill and reload it


<!-- ###### Chrome Settings
- [chrome://flags/#disable-best-effort-tasks](https://www.digitaltrends.com/computing/google-chrome-finally-reduce-memory-usage/) -->

---

#### Bonus Tips: [How to Keep Your Mac from Overheating](https://lifelongprogrammer.blogspot.com/2019/02/awesome-tips-about-mac.html)
- Don't wait to charge your mac till its power is too low.
- Close the lid to make Mac sleep as often as possible.
  - Enable and use [Touch ID](https://support.apple.com/en-us/HT207054) to quickly sign in again.
- Kill apps aggressively
  - e.g. kill [iTerm](https://lifelongprogrammer.blogspot.com/2018/06/working-effectively-with-iterm.html) if not going to use it in next 5 mins.
  - Configure the app to restore last session: like `Restore last windows after restart` for [iTerm](https://lifelongprogrammer.blogspot.com/2018/06/working-effectively-with-iterm.html).
- Don't put it Mac directly your lap, put a book underneath, as MacBooks vent from the back edge,

###### [Related Posts](https://lifelongprogrammer.blogspot.com/search?q=label:Chrome|label:Google){target="blank"}
<script src="https://lifelongprogrammer.blogspot.com/feeds/posts/default/-/Chrome?orderby=updated&amp;alt=json-in-script&amp;callback=weightedRandomRelatedPosts&amp;max-results=20"></script>
<script src="https://lifelongprogrammer.blogspot.com/feeds/posts/default/-/Google?orderby=updated&amp;alt=json-in-script&amp;callback=weightedRandomRelatedPosts&amp;max-results=20"></script>
