#### [Shortcuts](http://lifelongprogrammer.blogspot.com/2018/05/keyboard-shortcuts.html#mac-shortcuts)
#### Change Notification type
- Preferences > Notifications
- None: no notification at all
- Banners: go away automatically
- Alters: stay until user dismisses it

##### [Option click EVERYTHING](https://medium.com/productivity-freak/using-mac-os-x-productivity-enhancements-b7ca30ad38ee)
- in Finder, Option+Click will show menu: "copy items as pathnames", and "show inspector"

#### Prevent a Mac from Sleeping
- pmset noidle

#### [Remove Siri from the Touch Bar](https://howchoo.com/g/zjbimjyxztr/how-to-remove-siri-from-the-touch-bar-on-the-macbook-pro#customize-the-control-strip)
- Preferences > Keyboard > Customize Control Strip
- Highlight the Siri button, click, and drag the Siri button upward and out of the Touch Bar

#### [Enable Touch ID](https://support.apple.com/en-us/HT207054)
- Preferences > Touch ID
- Then we can use touch id instead of manually type password
- [Use Touch ID for sudo](http://osxdaily.com/2017/11/22/use-touch-id-sudo-mac/)
    - vi nano /etc/pam.d/sudo
    - add "auth sufficient pam_tid.so" to the top

#### [Change default application for a file type](http://teohm.com/blog/mac-tips-change-default-application-for-a-file-type/)
- right-click the file, select Get Info and change the application in Open With section.
- click Change All… button to apply the changes to all files

#### Spotlight Search
- Shortcut: Command+space
- [Reveal the Location](https://www.tekrevue.com/tip/show-spotlight-results-in-finder/)
    - Preview location: with Command key
    - Open the location in Finder: hold the Command key, and press Return

### Mail
- [Smart Mailbox vs Mailbox](https://www.howtogeek.com/252635/how-to-organize-your-email-with-smart-mailboxes-in-apple-mail/)
#### [Get notification from important messages only](https://www.lifewire.com/vip-email-alerts-os-x-mail-1172746)
- Only works for Smart Mailbox
- Preferences > General > New message notifications
#### [Add users to VIP](https://www.imore.com/how-quickly-add-contact-your-vip-list-mac-mail)
#### [Shortcuts](http://lifelongprogrammer.blogspot.com/2018/05/keyboard-shortcuts.html#mac-mail)

<br/>

##### Messages App to send/receive SMS

### iPad
#### Manually manage music and videos
To manually copy videos from mac to iPad:
- Select Summary option from the device’s settings in iTunes, then enable the option

#### brew
```bash
brew list -l
brew cask list
brew update/upgrade
brew cleanup
```

#### Tools
##### [the-unarchiver](https://theunarchiver.com/)
- brew cask install the-unarchiver
- open its preferences and select all the file format

##### [grammarly](https://app.grammarly.com/)

<br/>

#### References
[Mac Tips & Tricks - 2016](http://lifelongprogrammer.blogspot.com/2016/04/mac-tips-tricks-2016.html)