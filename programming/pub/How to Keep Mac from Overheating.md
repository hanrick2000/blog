---
description: How to save energy and keep your mac from overheating.
---

---

### [Series: Awesome Tips about Mac](https://lifelongprogrammer.blogspot.com/search/label/Mac_Series){target="blank"}
<script src="/feeds/posts/default/-/Mac_Series?orderby=updated&amp;alt=json-in-script&amp;callback=series&amp;max-results=20"></script>

---

### How to Keep Your Mac from Overheating
- Don't wait to charge your mac till its power is too low.
- Close the lid to make Mac sleep as often as possible.
  - Enable and use [Touch ID](https://support.apple.com/en-us/HT207054) to quickly sign in again.
- Configure Mac to **"Turn display off after x minutes"** and **"Put disk to sleep when possible"** at **Preferences -> Energy Saver**
- Run less applications
  - Turn off auto startup programs at **System Preferences -> Users & Groups-> Login Items**
  - For some services like **Docker**, **Jetbrains Toolbox**, go to their preferences to uncheck **Run at login**
- Disable Siri
- [Disable Dictation](https://apple.stackexchange.com/questions/176582/disable-speechrecognitioncore)
  - `com.apple.SpeechRecognitionCore.speechrecognitiond` uses 960M+ memory.
- Delete Apps that you are not using nay more
  - As they may still start at login and run silently
- Configure the app to restore last session and kill apps aggressively
  - e.g. kill [iTerm2](https://lifelongprogrammer.blogspot.com/2018/06/working-effectively-with-iterm.html) if not going to use it in next 5 mins.
  - In [iTerm2](https://lifelongprogrammer.blogspot.com/2018/06/working-effectively-with-iterm.html): check `Restore last windows after restart`, same for Chrome etc.
- `Don't put it Mac directly upon your lap, put a book underneath, as MacBooks vent from the back edge`

#### [How to Reduce Chrome Memory Usage](https://lifelongprogrammer.blogspot.com/2019/03/how-to-speed-up-google-chrome.html){target="blank"}
- Read [here](https://lifelongprogrammer.blogspot.com/2019/03/how-to-speed-up-google-chrome.html){target="blank"} to learn how to free up Chrome's memory usage and still stay productivity.
  - Use [The Great Suspender, Chrome Vimium and Reader View](https://lifelongprogrammer.blogspot.com/2019/03/how-to-speed-up-google-chrome.html){target="blank"}
  - <kbd>Cdm</kbd>+<kbd>Shift</kbd>+<kbd>A</kbd> to suspend all tabs in current window, <kbd>Cdm</kbd>+<kbd>Shift</kbd>+<kbd>R</kbd> to open the current tab in **Reader View**.

#### Use Chrome Search History to find recently read or closed pages
- Try to reopen one specific page (not the last one) after close the window, or multiple pages, don't use <kbd>Ctrl</kbd>+<kbd>Shift</kbd>+<kbd>T</kbd> to reopen them then try to find it: reopening them would cause a lot of memory spike and may cause disk spin etc.
- Directly use Chrome Search history to find the page: search or scan last several pages.

> Read more [awesome tips about chrome](https://lifelongprogrammer.blogspot.com/2018/06/awesome-tips-about-chrome.html){target="blank"}

---

#### [Related Posts](https://lifelongprogrammer.blogspot.com/search/label/Mac)<a name="related"></a>
<script src="/feeds/posts/default/-/Mac?orderby=updated&amp;alt=json-in-script&amp;callback=weightedRandomRelatedPosts&amp;max-results=20"></script>
<script src="/feeds/posts/default/-/Dev Tips?orderby=updated&amp;alt=json-in-script&amp;callback=weightedRandomRelatedPosts&amp;max-results=20"></script>