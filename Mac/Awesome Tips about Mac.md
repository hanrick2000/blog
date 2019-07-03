##### [Series: Awesome Tips about Mac](https://lifelongprogrammer.blogspot.com/search/label/Mac_Series){target="blank"}
<script src="https://lifelongprogrammer.blogspot.com/feeds/posts/default/-/Mac_Series?orderby=updated&amp;alt=json-in-script&amp;callback=series&amp;max-results=20"></script>


<!-- SD:
Most frequently used shortcuts in Mac, tips for finder, spotlight etc, and how to prevent Mac form overheating
 -->
#### [Shortcuts](https://lifelongprogrammer.blogspot.com/2018/05/keyboard-shortcuts-for-developers.html#mac-shortcuts)
|                                |                                                                     |
| ------------------------------ | ------------------------------------------------------------------- |
| / or Command+Shift+G           | Go to Folder                                                        |
| **F11**                        | **Show Desktop**                                                    |
| Command+Shift+3                | Capture the entire screen                                           |
| Command+Shift+4                | Capture a selected area                                             |
| Control + a/e                  | Got to head/end - work in Terminal, Chrome, Atom                    |
| Command+\`                     | cycle between open windows in selected application                  |
| Command+Option+D               | show or hide dock                                                   |
| Command + Option + Escape      | Force Quit Applications                                             |<kbd></kbd>
| **Ctrl+F2**                    | **Access menu, enable it at Keyboard -> Shortcuts -> Keyboard**     |
| **Cmd+Shift+?**                | **Open Help menu and navigate**                                     |
| ^+F3                           | Move focus to dock                                                  |
| **^+F8**                       | **Move focus to status menu, search all actions in menu**           |
| Command+q                      | Quit the app                                                        |
| Command+shift+w                | Close the window                                                    |
| Command + ,                    | Open Preferences                                                    |
| Command+~                      | Switch windows for same application(Command-Shift-~, reverse order) |
| Command + X                    | Cut the highlighted text                                            |
| **Shift+Alt+Command+V**        | paste the highlighted text and matches the destination style        |
| **Cmd+Shift++(-)**             | Zoom in(out) text                                                   |
| Command + B/I/U                | make text bold/italic/underlined                                    |
| Shift+Arrow                    | Select text                                                         |
| **(Shift+)Option+Left(Right)** | **(Select)Jump by word**                                            |
| **Cmd+Shift+Z**                | **Redo**                                                            |
| **Fn + up(down)**              | **Page up(down)**                                                   |
| **Fn + Left(right)**           | Home(end)                                                           |
| **Cmd+1..8**                   | **Move tab**                                                        |
| **Cmd+9**                      | **Move to last tab**                                                |
| **Cmd++(-)**                   | **Increase(Decrease) Font Size**                                    |
| **Cmd+Shift+F**                | **Enter full screen mode**                                          |
| **Cmd+Space bar**              | **Open Spotlight**                                                  |

---

#### Tips
- Enable dark mode at Preferences -> General
- [maximize the window without going full screen](https://www.cultofmac.com/410346/how-to-maximize-your-el-capitan-windows-without-going-full-screen/)
  - **⌥ + Click** on green icon

##### Change Notification type
- Preferences > Notifications
- None: no notification at all
- Banners: go away automatically
- Alters: stay until user dismisses it

##### Use AriDrops to copy files between Mac/iPhone/iPad
##### Prevent a Mac from Sleeping
- pmset noidle
- caffeine

##### [Remove Siri from the Touch Bar](https://howchoo.com/g/zjbimjyxztr/how-to-remove-siri-from-the-touch-bar-on-the-macbook-pro#customize-the-control-strip)
- Preferences > Keyboard > Customize Control Strip
- Highlight the Siri button, click, and drag the Siri button upward and out of the Touch Bar
- Disable Siri at Preferences -> Siri

##### Siri
- By default `HOLD Command Space` to activate Siri
- [How to enable "Hey Siri" in Macos](https://www.youtube.com/watch?v=ZFOG01CgKNA)
- Click the `plus(+)` button to pin a Siri result which will show in the `Today View`.
- Open my desktop folder in Finder
- `Volume up/down, mute/unmute`
  - unmute works even the Mac is muted.
- Turn on/off Night Shift
- Show me what I was working on today
- Show me files I worked on yesterday
- How much free disk space do I have?
- Show me privacy settings
- Put my Computer to sleep
- `Ask how to do things:`
  - `How to take a screenshot`
- Reminder:
  - Remind me xxx in x minutes
  - Show me my reminder
  - Cancel my reminder
- Add xx to Calendar
- Read my messages
- Latest news
<!-- - Use google to search: `Search Google for`, `Google xx` -->


##### [Enable Touch ID](https://support.apple.com/en-us/HT207054)
- Preferences > Touch ID
- Then we can use touch id instead of manually type password
- [Use Touch ID for sudo](http://osxdaily.com/2017/11/22/use-touch-id-sudo-mac/)
    - vi nano /etc/pam.d/sudo
    - add "auth sufficient pam_tid.so" to the top

##### [Change default application for a file type](http://teohm.com/blog/mac-tips-change-default-application-for-a-file-type/)
- right-click the file, select Get Info and change the application in Open With section.
- click Change All… button to apply the changes to all files

#### Finder
- We can lock a file by right clicking a file -> **Get info** -> select **Locked**.
###### [Option click EVERYTHING](https://medium.com/productivity-freak/using-mac-os-x-productivity-enhancements-b7ca30ad38ee)
- in Finder, Option+Click will show menu: "copy items as pathnames", and "show inspector"

###### [Show the Current Path in the Finder Title Bar](https://www.tekrevue.com/tip/show-path-finder-title-bar/)
- Go to View > Show Path Bar

---

##### Spotlight Search
- Shortcut: Command+space
- [Reveal the Location with command key](https://www.tekrevue.com/tip/show-spotlight-results-in-finder/)
    - Preview location: with Command key
    - Open the location in Finder: hold the Command key, and press Return
- as a calculator, check stock prices, currency conversion

---

#### Safari
- [safari-extensions](https://safari-extensions.apple.com)
- [Enable develop menu](https://www.igeeksblog.com/how-to-enable-develop-menu-in-safari-on-mac/)
- [Reader mode to hide ads](https://support.apple.com/guide/safari/hide-ads-when-reading-articles-sfri32632/mac)
  - Click the Reader button ![](https://help.apple.com/assets/5C1032DB680CE2007DE76758/5C1032DD680CE2007DE76760/en_US/594456e7f5024afe01e5b4da627339f9.png){.class height=20px width=20} at beginning of the address bar.

##### Shortcut
|                        |                             |
| ---------------------- | --------------------------- |
| Switch to Next Tab     | Control+Tab                 |
| Switch to Previous Tab | Control+Shift+Tab           |
| Duplicating a Tab      | Command + L and then Return |
- [Don't reopen windows from the last session](https://www.markandersononline.com/blog/open-safari-without-opening-windows-last-session/)
  * defaults write com.apple.Safari NSQuitAlwaysKeepsWindows -bool false

---

#### Mail
- Cmd+Shift+: for Spell Check
- [Smart Mailbox vs Mailbox](https://www.howtogeek.com/252635/how-to-organize-your-email-with-smart-mailboxes-in-apple-mail/)

##### [Get notification from important messages only](https://www.lifewire.com/vip-email-alerts-os-x-mail-1172746)
- Only works for Smart Mailbox
- Preferences > General > New message notifications

##### [Add users to VIP](https://www.imore.com/how-quickly-add-contact-your-vip-list-mac-mail)
##### [Shortcuts](https://lifelongprogrammer.blogspot.com/2018/05/keyboard-shortcuts-for-developers.html#mac-mail)

---

#### Chinese Input Tools: Sougou
- Assign `中英文` to `右Shift`
- Disable shortcuts for `简繁体`, `中英文标点`, `表情符号`, `斗图` and all others not used.

---

#### [How to Keep Your Mac from Overheating](https://lifelongprogrammer.blogspot.com/2019/02/how-to-keep-mac-from-overheating.html){target="blank"}

---

##### [How to Reduce Chrome Memory Usage](https://lifelongprogrammer.blogspot.com/2019/03/how-to-speed-up-google-chrome.html){target="blank"}
- Read [here](https://lifelongprogrammer.blogspot.com/2019/03/how-to-speed-up-google-chrome.html){target="blank"} to learn how to free up Chrome's memory usage and still stay productivity.
  - Use [The Great Suspender, Chrome Vimium and Reader View](https://lifelongprogrammer.blogspot.com/2019/03/how-to-speed-up-google-chrome.html){target="blank"}
- Read more [awesome tips about chrome](https://lifelongprogrammer.blogspot.com/2018/06/awesome-tips-about-chrome.html){target="blank"}

---

#### Misc
- Remove auto startup programs at `System Preferences -> Users & Groups-> Login Items`
- For some services like **Docker**, **Jetbrains Toolbox**, go to their preferences to uncheck `Run at login`
- Text replacement
  - Preferences > Keyboard > Text
  - not work with Atom or Chrome

##### brew
```bash
brew list -l
brew cask list
brew update/upgrade
brew cleanup
```

<!-- ##### Xcode from App Store -->

##### Commands
- `pbcopy` and `pbpaste` to copy data to clipboard or pbpaste from clipboard
  - `pbcopy < file.txt; echo $(pbpaste)`{.bash}

##### Tools
###### [Voice Memos](https://www.idownloadblog.com/2018/08/14/howto-voice-memos-mac/)
- click and hold a memo in the list, then drag it to a folder.
- [The app is also available in iPhone/Pad](https://www.imore.com/voice-memos)

###### [the-unarchiver](https://theunarchiver.com/)
- brew cask install the-unarchiver
- open its preferences and select all the file format

###### [grammarly](https://app.grammarly.com/)

##### Print
- Standard paper size in US
  - Letter, Legal
- Don't print correct size
  - Check the default tray settings in printer

<!-- ##### Feature Suggestions
- Quick Access in OS level
  - like "Quick Access" function in Eclipse
  - we can type commands like "show desktop" etc, or with some prefix: `commands: capture screen`
  - It's hard to remember those commands that are not used often. -->

##### [Related Posts](https://lifelongprogrammer.blogspot.com/search/label/Mac)<a name="related"></a>
<script src="https://lifelongprogrammer.blogspot.com/feeds/posts/default/-/Mac?orderby=updated&amp;alt=json-in-script&amp;callback=weightedRandomRelatedPosts&amp;max-results=20"></script>
<script src="https://lifelongprogrammer.blogspot.com/feeds/posts/default/-/Dev Tips?orderby=updated&amp;alt=json-in-script&amp;callback=weightedRandomRelatedPosts&amp;max-results=20"></script>