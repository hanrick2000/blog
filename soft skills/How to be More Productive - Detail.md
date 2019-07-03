#### Make it easier to find
- Put frequently used apps (like Google Keep) in first screen, etc
- Add bookmark with short and easy to remember name in Chrome to make it easier to find
- Delete history in Chrome to make search/autocompletion in Address bar work better
  - Check here for [how to google search like a pro](https://lifelongprogrammer.blogspot.com/2019/06/how-to-google-search-like-pro.html){target="blank"}
- Minimize(or kill) windows that are not going to be used recently

#### How to Save Context
- Compile error
- TODO tag
- Put the web page into a new window
  - When we find something online that we should read or search later, we can <kbd>shift</kbd>+<kbd>w</kbd> to put this page into a new window so we can go back to it later.
  - We can also use [The Great Suspender](https://lifelongprogrammer.blogspot.com/2019/04/must-have-google-chrome-extensions.html#suspender){target="blank"} to suspend the new tab or window so these pages don't consume a lot of RAM.
- Git diff
- Undo then redo in editor
  - Use Case: After search, or move pointer, we would like to go back to last edit position.

##### Pin
- Use Atom [pinned-tabs](https://atom.io/packages/pinned-tabs){target="blank"} to pin files that you are constantly working on recently
- "PINNED-TABS: CLOSE UNPINNED" if needed.

#### Preserve Last Session
- Set [Chrome](https://lifelongprogrammer.blogspot.com/2018/06/awesome-tips-about-chrome.html){target="blank"}, [iTerm2](https://lifelongprogrammer.blogspot.com/2018/06/working-effectively-with-iterm.html){target="blank"}, [Atom](https://lifelongprogrammer.blogspot.com/2017/10/awesome-tips-about-atom-editor.html){target="blank"} to restore last session.
- In [Atom](https://lifelongprogrammer.blogspot.com/2017/10/awesome-tips-about-atom-editor.html){target="blank"}, select `Preserve Last Search` for `Command Palette` and `Fuzzy Finder`

#### 2X player
- `Shift+>(<)` to increase/decrease speed in Youtube
- for [pan.baidu](https://lifelongprogrammer.blogspot.com/2018/10/user-scripts-to-change-html5-video-player-speed.html){target="blank"}
  - `videojs.getPlayers("video-player").html5player.tech_.setPlaybackRate(2)`{.javascript}
  - [user scripts to change html5 video player speed](https://lifelongprogrammer.blogspot.com/2018/10/user-scripts-to-change-html5-video-player-speed.html){target="blank"}
- `X movie in 10 minutes` etc

#### What to do at Spare Time (<5)
- Clear things in Gmail(delete emails or draft), Google Keep

#### What else we can do
- During development, the depended service is down, before they fix it, we can still clean the code or create the PR.


#### Example
- Need a pr to test branch in another remote to make some experiment -> directly push to the test branch
- Run multiple long-time(>2+ seconds) commands together: `delete.sh && build.sh && deploy.sh`
- During development/test, don't make change in the build output,
  - When we apply the change back to source, we may forget what change we have made, or waste some time to figure it out.