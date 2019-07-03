---
description: Best Chrome Reader Extensions to Optimize Reading Experience: Dark Reader, Reader View, Just Read, Clearly.
---

##### [Awesome Tips about Chrome Series](https://lifelongprogrammer.blogspot.com/search/label/Chrome_Series){target="blank"}
<script src="https://lifelongprogrammer.blogspot.com/feeds/posts/default/-/Chrome_Series?orderby=updated&amp;alt=json-in-script&amp;callback=series&amp;max-results=20"></script>
---

### Why Use Chrome Reader Extension for Reading?
- Declutter: remove ads, left/right sidebar, header, footer and focus on content
- Make the content much easier to read
- Reduce memory and other resources (network, CPU)
  - [Reader View](https://chrome.google.com/webstore/detail/reader-view/ecabifbgmdmgdllomnfinbmaellmclnh) opens the webpage in extension mode, so javascript and ads in original webpage will not be loaded and running.

#### Copy Text
- Copy text from copy-protected webpages
  - Some websites disabled copy completely, or in some websites, the copied text only includes raw text (no formatting, no images) and add extra texts. There are many ways to fix it, one simple way is to just open it in reader view mode using extensions mentioned here.
  - For example: [techiedelight](https://www.techiedelight.com)
- Copy text when it's not easy to copy
  - For example, we need copy text of the links repeatedly and don't want to click the url by accidental, or want to copy part of text of the url
- When the original copied text is not good
  <!-- - For example, -->
<!--  - For example, to copy text from title  -->

### Chrome Extensions for Reading
Read here for more [must-have google chrome extensions](https://lifelongprogrammer.blogspot.com/2019/05/best-google-chrome-extensions.html ){target="blank"}

#### [Dark Reader](https://chrome.google.com/webstore/detail/dark-reader/eimadpbcbfnmbkopoojfekhnkhdbieeh)
- Also enable Mac's dark mode at Preferences -> General

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

#### Summary
- Use [Reader View](https://chrome.google.com/webstore/detail/reader-view/ecabifbgmdmgdllomnfinbmaellmclnh) when the page(website) is slow: load lots of ads, flash, uses a lot of memory and you will take time(2+ mins) to read it.
- Use [Just Read](https://chrome.google.com/webstore/detail/just-read/dgmanlpmmkibanfdgjocnabmcaclkmod) in other case.
- Use [Clearly](https://chrome.google.com/webstore/detail/clearly/odfonlkabodgbolnmmkdijkaeggofoop) to check the outline.
