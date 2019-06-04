### TL;DR
- How to use Chrome Vimium's shortcuts regex search, to navigate the web and Chrome faster.
- How to customize Vimium's shortcuts and make it work better with other ecosystems like reveal.js.

---

### [Awesome Tips about Chrome Series](/search/label/Chrome_Series){target="blank"}
<script src="/feeds/posts/default/-/Chrome_Series?orderby=updated&amp;alt=json-in-script&amp;callback=series&amp;max-results=20"></script>

---

### Install
- [Install from Chrome Webstore](https://chrome.google.com/webstore/detail/vimium/dbepggeogbaibhgnhhndojpepiihcmeb?hl=en)
- [How to use Vimium](https://github.com/philc/vimium/wiki)

### [Shortcuts](/2018/05/keyboard-shortcuts-for-developers.html#vimium)
- [All commands and shortcuts](https://github.com/philc/vimium/blob/master/background_scripts/commands.coffee)

|                     |                                                                                                 |
| ------------------- | ----------------------------------------------------------------------------------------------- |
| **(number+)W**      | **move tabs(s) to new window**                                                                  |
| **(number+)<<(>>)** | **Move tab to the left(right)**                                                                 |
| **T**               | **search through your open tabs**                                                               |
| B                   | Bookmark search                                                                                 |
| **(number+)r**      | **reload tab(s)**                                                                               |
| **(number+)f(F)**   | **open/click multiple links in the current(or new) tab or execute multiple actions in same tab** |
| **(number+)x**      | **close tabs(s)**                                                                               |
| **^**               | **Go to previously-visited tab**                                                                |
| **yt**              | **duplicate current tab**                                                                       |
| gE                  | Edit the current URL and open in a new tab                                                      |
| X                   | restore closed tab (i.e. unwind the 'x' command)                                                |
| **gi**              | **focus the first (or n-th) text input box on the page**                                        |
| h/j/k/l             | scroll left/down/up/right                                                                       |
| **(number+)d(u)**   | **half page down(up)**                                                                          |
| yy                  | copy the current url to the clipboard                                                           |
| yf                  | copy a link url to the clipboard                                                                |
| p/P                 | search the text in clipboard using search engine                                                |
| **[[ or ]]**        | **Go to next previous(next) page**                                                              |
| **gu(or U)**        | **Go up the URL hierarchy or Go to root of current URL hierarchy**                              |
| ?                   | help                                                                                            |

### Count + Command
- number+x-close multiple tabs
- number+r-reload multiple tabs
- number+W-move multiple tabs to new window
- number+<<(>>) move multiple tabs
- (number+)f(F)-open multiple links
- (number+)d(u)- multiple half page(up) down

### Find Mode (/): regex search
- Support Regex
- Make Regex search as default by checking `Treat find queries as JavaScript regular expressions` at Options.
  - As people can just use chrome's builtin search for non regex search.
  - Switch back to plain find mode by using the \R escape sequence.
- Find queries are global and persistent
- Use <Up> and <Down> to re-use previous queries
- Smartcase: /test is case-insensitive, and /Test is case-sensitive

### [Vomnibar search](https://github.com/philc/vimium/wiki/Search-Engines)
- Type `o Or O` to open URL, bookmark or history entry
- Add `Custom search engines` at Options
- Useful: `y` for Youtube, `m` for Google Maps, 

<!-- - [Visual Mode](https://github.com/philc/vimium/wiki/Visual-Mode)
    - v or V (line mode)
    - o to swap the anchor and the focus
    - c to enter caret mode from a visual mode
    - vi-like movements: $ -->

### Customize keys
- [source 1](https://avilpage.com/2014/04/useful-custom-key-maps-for-vimium-to.html)
- [All commands and shortcuts](https://github.com/philc/vimium/blob/master/background_scripts/commands.coffee)
```text
map i focusInput
map .. nextTab
map ,, previousTab
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

---

### Tips
#### Customize Previous(Next) patterns	
- We can use **[[ or ]]** to to go to next previous(next) page
- It may not work for some web sites such as <blogger></blogger>
- But we can easily customize it at **options**
- Add "Older Posts,下一章" to **Next patterns**
  - Usually users land in home page, click next button/shortcut to go older posts. 
- Add "Newer Posts,上一章" to **Previous patterns**
  - Space matters.

### Excluded URLs and keys
- [reveal.js uses F for Fullscreen and some other shortcuts which conflict with Vimium](https://github.com/hakimel/reveal.js/wiki/Keyboard-Shortcuts)
- Some shortcuts from Github conflicts with [Chrome Vimium](/2019/04/awesome-tips-about-chrome-vimium.html){target="blank"}
- So add the following at `Excluded URLs and keys` at `Vimium Options`.

| Patterns                         | Keys          |
|:-------------------------------- |:------------- |
| https?://jefferyyuan.github.io/* | f,F,?,O,o,b,B |
| https?://github.com/*            | b,l,c,g,n,h,p |

### Misc
#### Go Back History Doesn't Work (In Blogger Blog Management Page)
- When we click `cmd+left` or back history button, sometimes it doesn't work.
- When this happens, try `2h`: go back 2 pages

### [Related Posts](/search/label/Chrome)<a name="related"></a>
<script src="/feeds/posts/default/-/Chrome?orderby=updated&amp;alt=json-in-script&amp;callback=weightedRandomRelatedPosts&amp;max-results=20"></script> 