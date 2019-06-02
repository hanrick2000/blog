<!-- Awesome Tips about Google Products -->
### [Chrome](https://lifelongprogrammer.blogspot.com/2018/06/awesome-tips-about-chrome.html)

### Gmail
- [Write Email Now And Send It Later](https://www.cnet.com/how-to/gmails-scheduling-tool-to-send-emails-later-keeps-you-from-being-an-enormous-jackass/)
  - `Schedule Send`
- [Create an event directly from Gmail](https://www.lifewire.com/create-a-google-calendar-event-from-a-message-in-gmail-1172093)
  - Click 3dot icon then click "Create Event"
  - to track deadline, follow up etc
- [Create an account or schedule an event directly from Gmail](https://webapps.stackexchange.com/questions/11699/in-gmail-how-do-i-create-a-contact-from-a-recipient-of-an-email)
  - Hover the mouse cursor over the recipient's name until a pop-up card appears
  - Click **Add to contacts** or **schedule an event**
- **Smart Compose**
  - Enable `Enable experimental access` in Settings.
  - **Autocomplete the recipient name to avoid embarrassing typo**
    - `Hi` then space, it will autocomplete the name, but `Hi,` then space will not (disappointedly).
- [Snooze emails until later](https://support.google.com/mail/answer/7622010)
  - We can find all snoozed emails at `Snoozed folder`
- [Confidential mode: self destructing and require sms code](https://techcrunch.com/2018/04/13/google-is-testing-self-destructing-emails-in-new-gmail/)
- Move emails to other categories and "Do this for future messages"
- [Create email signature](https://webapp.wisestamp.com)
- **Desktop notifications** at Settings: "Important mail notifications on"

### Delete emails
- delete all old emails in promotions: `category:promotions older_than:3m`
- unsubscribe from email directly or change the notification in its service
- **Select all conversations that match this search**
  - this will show after you select all in current page
- **Filter message like this**
  - it will filter message based on sender or `Has the words`
- unwatch git repo if not interested

### Youtube
- Use different accounts for work/skills, entertainment
- Click **Switch account** in the top right corner
  - Not easy/intuitive as other google apps
- [Auto Close YouTube Ads](https://greasyfork.org/en/scripts/9165-auto-close-youtube-ads), install [Tampermonkey](https://chrome.google.com/webstore/detail/tampermonkey/dhdgffkkebhmkfjojejmpbldmpobfkfo) first

### GBoard
- [**Use the Spacebar as a Trackpad to move pointer faster**](https://ios.gadgethacks.com/how-to/20-tips-help-you-master-gboard-for-iphone-0182301/)
  - slide your finger back and forth on the spacebar (till the end of the screen)

#### Quick Typing
- To type capitalize words by `long press the Cap key`  till the icon changes
- The space bar is a trackpad
  - Add period and space to the previous sentence by simply double tapping the space bar.
- [Quickly enter symbols by tap on the "123" button and swipe upward](https://www.hongkiat.com/blog/new-gboard-features/)

##### punctuation key(.)
- Type other punctuations quickly by holding the period key.
- Type `?` by just holding the period key.
- [Swipe to delete: not supported in iOS](https://www.reddit.com/r/Android/comments/7aammm/gboards_quick_delete_swipe_gesture_for_typed/)

#### Misc
- Long press the first row characters to type numbers.
- Translate remembers the frequently used languages, so we can easily switch ex: between English and Chinese
- [One-Handed mode](https://www.iphoneincanada.ca/app-store/gboard-ios-one-handed-keyboard-ios-11/)
  - tap and hold on the `globe` then then tap the left or right keyboard indentation.
- [Voice-to-text: Long press on the space bar](https://mashtips.com/best-google-keyboard-iphone-features/)
- Search Emoji/Gif by name
- Share search/location/youtube

### Google Contacts
- [Sync Google Contacts in iPhone](https://www.scrubly.com/blog/how-to-google-contacts/how-to-sync-google-contacts-with-the-iphone/)
  - Add your Gmail account at Settings -> **Passwords & Accounts**
  - Change to your Gmail account at Settings -> Contacts -> Default Account
  - So now every time you create an account at Phone app in iPhone, it will be synced to Google Contacts.

### Google Docs
#### Compact: Hide the menu mode
- Click **Hide the menu mode** at top right
  - Ctrl+Shift+F seems not work
- use **Option+/** to search and execute command
- How to exit **Hide the menu mode**
  - Click it again, 
  - but some cases, that menu is not visible (bug here)
    1. we can click the explore button at bottom right, then we will be able to see the **Hide the menu mode** icon.
    2. Or type "Full screen" at top left **search the menu** to enter full screen mode, then press **esc** to exit the full screen mode


### [Goole Lens](https://lens.google.com/)
- [Google Tasks](https://support.google.com/a/users/answer/9310341)

### Blogger
- Add `Custom Redirects` after changed the url
- [Promote your Content by Creating Index Page and a Custom "Page Not Found"](https://lifelongprogrammer.blogspot.com/2019/05/how-to-promote-your-content-by-creating-sticking-index-page-in-blogger.html)
- [Make a Sticky Post in Blogger](https://www.wikihow.com/Make-a-Sticky-Post-in-Blogger)
  - Publish it first then change date to a future date
- [Multiple Labels Search](https://exde601e.blogspot.com/2012/12/search-operators-for-Blogger-labels.html)
  - and query: search/label/LABEL1+LABEL2
  - Or Query: search/?q=label:LABEL1|label:LABEL2
- [Add more Labels to an Existing Post](http://9jaonpointed.blogspot.com/2015/06/how-to-add-more-labels-to-existing-post.html)
- [Bulk remove labels](https://www.makingdifferent.com/how-to-change-remove-labels-at-once-in-blogger/)
  - [Just click the label to be removed at the label action](https://www.youtube.com/watch?v=PfNJRTadzMI)
- [Remove the automatically added code: Dir="Ltr" Trbidi="On"](https://www.howbloggerz.com/2016/07/remove-ltr-trbidi-code-from-blogger-posts.html)
  - Disable this by turn off "Enable transliteration" in **Language and formatting settings**
  - If "Enable transliteration" is on, blogger will automatically add this code whenever it detects it's not there
  - if you have custom javascript code in your post, this behavior will break the js code.

#### Sitemap web pages
- [Generate Sitemap html page including all labels](https://www.howbloggerz.com/2017/03/generate-html-sitemap-page-blogger.html)
- [Generate Sitemap html page including (multiple) specific labels](https://mybloggeraide.blogspot.com/2017/07/create-html-sitemap-for-specific-label.html)

#### [Blogger Feeds API](https://www.exeideas.com/2016/02/parameters-in-blogspot-feed.html)
- feeds/posts/default/feeds/posts/default/-/THE_LABLE
- orderby: updated, published
- [Search Multiple Labels(AND) in Blogger Feeds](http://waltz.blogspot.com/2007/07/search-multiple-labels-in-blogger-feeds.html)
  - feeds/posts/default/-/<label1>/<label2>/.../<labelN>

### Google Maps<a name="google_maps"></a>
- [Share a map or directions with others by using the `share` function](https://support.google.com/maps/answer/144361?co=GENIE.Platform%3DiOS)
- [Show others where you are directly within iMessage](https://support.google.com/maps/answer/7300880)
- Add custom search engine to Chrome
  - Go to chrome://settings/searchEngines and add the following
| Name                   | keyword | URL                                                                                                 |
|:---------------------- |:------- | --------------------------------------------------------------------------------------------------- |
| **Google maps Search** | gm      | https://www.google.com/maps?q=%s                                                                    |
- Type `gm` in Chrome address bar, then `type home to here` etc
- Query:
  - here, home, 
  - costco near home

#### Keep
- Remind based on place
  - `Store address` for the shopping list
  - It only support one address, it would be great to support multiple address as we go shopping to different stores even for same brand(like Costco)
- Pin a note
- Grab image text from attached image or drawing
- Turn any note into a list by 
- Use list view to show all content
- Use Card view to have a overview and move notes
- Share with others


#### Misc
- Report bugs: [issuetracker](https://issuetracker.google.com/)
- <https://support.google.com>