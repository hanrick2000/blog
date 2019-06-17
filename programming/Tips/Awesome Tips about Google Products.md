<!-- SD:
Tips about how to effectively use Google products: like Chrome, Gmail, GBoard, Youtube, Blogger, Google Maps.
-->

<!-- ### What's New in Google
#### 06/2019
- [faster, on-device voice dictation](https://www.xda-developers.com/gboard-on-device-voice-dictation-pixel-phones/)
  - also in iOs, pretty amazing -->

### [Awesome Tips Series about Google Products](https://lifelongprogrammer.blogspot.com/search/label/Google_Series){target="blank"}
<script src="/feeds/posts/default/-/Google_Series?orderby=updated&amp;alt=json-in-script&amp;callback=series&amp;max-results=20"></script>

---

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


### Voice Typing
- [Punctuation Commands for Dictation](http://thedroidlawyer.com/2018/02/punctuation-commands-for-dictation-in-voice-to-text-for-android/)
  - Support: period, comma, question mark, exclamation point, apostrophe, enter or new line, new paragraph, tab key, colon, dash, ellipsis or dot dot dot, ampersand, asterisk, at sign, backslash, forward slash, open/close bracket, open(close) parenthesis.

---

### Google Photos
- Add photos to a shared album or an existing album
  - Select (multiple) photo(s) -> choose the `+(add to or create new)` button at top right
    - Choose `Shared album` to add to a shared album
    - Choose `Album` to add to an existing album
- Label the people to make it easier to search and integrate with other systems like Google Assistant.
- Merge two faces
  - Give the first one a name, then go to the other face group, click `add a name`, choose the already existing one, Google Photos will suggest you to merge them.
- [Create live album including old photos or not](https://www.pcmag.com/feature/345998/30-tricks-to-master-google-photos/27)
- Archive an image: it doesn't show but we can still check it at /archive
- [Create an album from search result](https://webapps.stackexchange.com/questions/97647/how-do-i-turn-a-google-photos-search-result-into-an-album)
  - Select all images (select the first one, hold the shift key then choose the last one), then click `+` at the top right to create an album.
- Quick Urls: /unsaved, /people, /archive, /albums

#### Search at Google Photos
- Explore what Photos can search by clicking the `Show more` at search page
- by name, place, time: (last week/year)
- Specific Day Search: 2019-01-01
- Specific Month Search: January(Jan) 2019
- #videos, #AutoAwesome, #mobile
- pano,
- `The_Kid_Name year_when_he/she_is_a_baby`

#### Embed Google Photo into Website
- Create a shareable link of that image and paste the link to [ctrlq.org/google/photos](https://ctrlq.org/google/photos/). It will download the page and parse it to get the direct link from google.
- The link would be `https://lh3.googleusercontent.com/the_big_id=w2400`, we can change the width and height by change it to something like: `=w$the_width-h$the_height`

### Google Drive/Docs
- use **Ctrl+Option+Z or Option+/(in compact mode)** to search and execute command
- Click ![](https://lh3.googleusercontent.com/vvhIoImkCw8IkwaKXKWIiYiCUlYihV-c-Igd6GLdeaYBBumgtolgE42VnVXbM_KYAA=w18-h18) or `Cmd+Option+X` in the top left toolbar.
- Install and enable Grammarly on Google Docs

#### Compact: Hide the menu mode
- Click **Hide the menu mode** at top right
  - Ctrl+Shift+F seems not work
- How to exit **Hide the menu mode**
  - Click it again,
  - but some cases, that menu is not visible (bug here)
    1. we can click the explore button at bottom right, then we will be able to see the **Hide the menu mode** icon.
    2. Or type "Full screen" at top left **search the menu** to enter full screen mode, then press **esc** to exit the full screen mode

#### [Embedding a PDF From Drive into a Blog](http://www.benschersten.com/blog/2014/04/embedding-a-pdf-from-drive-into-a-blog/)
```markdown
<iframe src="https://docs.google.com/viewer?srcid=[put your file id here]&pid=explorer&efh=false&a=v&chrome=false&embedded=true" width="580px" height="480px"></iframe>
```

#### [Embedding a DPF from internet into a Blog]
```Markdown
<iframe src="https://drive.google.com/viewerng/viewer?url=https%3A//www.crackingthecodinginterview.com/uploads/6/5/2/8/6528028/cracking_the_coding_skills_-_v6.pdf&amp;embedded=true" allowfullscreen="" frameborder="0" scrolling="no"></iframe>
```

#### Embed Images from Google Drive into Website
- Get a shareable link from the image in Google drive and replace the id `https://drive.google.com/uc?export=view&id={fileId}`
- [This link seems to be subject to quotas. So not ideal for public/massive sharing.](https://stackoverflow.com/questions/10311092/displaying-files-e-g-images-stored-in-google-drive-on-a-website)

![](http://drive.google.com/uc?export=view&id=1HfeI-lL69kP9gexkV3VoajLLWDp_riCu)

#### Related:
- [Embedding PDFs without using JavaScript with embed, iframe, object](https://pdfobject.com/static/)

---

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
  - Costco near home

---

#### Tips, Tricks about More Google Products
- [How to Google Search Like a Pro](https://lifelongprogrammer.blogspot.com/2019/06/how-to-google-search-like-pro.html){target="blank"}
- [Awesome Tips about Chrome](https://lifelongprogrammer.blogspot.com/2018/06/awesome-tips-about-chrome.html){target="blank"}
- [Tips, Tricks about Youtube](https://lifelongprogrammer.blogspot.com/2019/06/tips-tricks-about-youtube.html){target="blank"}
- [Awesome Tips, Tricks about Gmail](https://lifelongprogrammer.blogspot.com/2019/06/awesome-tips-tricks-about-gmail.html){target="blank"}
- [Awesome Tips About Google Blogger](https://lifelongprogrammer.blogspot.com/2019/06/awesome-tips-about-google-blogger.html){target="blank"}

---

### Keep
- Remind based on place
  - `Store address` for the shopping list
  - It only support one address, it would be great to support multiple address as we go shopping to different stores even for same brand(like Costco)
- How to add new items to the top?
  - Uncheck the Settings: `Add new items to the bottom`
- Checked items will be moved to the bottom by default.
- `Pin a note`
- Grab image text from attached image or drawing
<!-- - Turn any note into a list by -->
- Use list view to show all content
- Use Card view to have a overview and move notes
- Share with others
- Make `Google Keep` easier to find in mobile.

### Google Contacts
- [Sync Google Contacts in iPhone](https://www.scrubly.com/blog/how-to-google-contacts/how-to-sync-google-contacts-with-the-iphone/)
  - Add your Gmail account at Settings -> **Passwords & Accounts**
  - Change to your Gmail account at Settings -> Contacts -> Default Account
  - So now every time you create an account at Phone app in iPhone, it will be synced to Google Contacts.

### Other Google Products
#### [Goole Lens](https://lens.google.com/)
- [Google Tasks](https://support.google.com/a/users/answer/9310341)

### Google Music
- Select the genres that you like
- Select the artists that you like

- Search by music type, musician, add it to library.

### Misc
- Report bugs: [issuetracker](https://issuetracker.google.com/)
- <https://support.google.com>

### Feature Requests
#### Google Photos
- Create a slideshow from search result
- Create live album that must contain all of the people

---

#### [Related Posts](https://lifelongprogrammer.blogspot.com/search/label/Google)<a name="related"></a>
<script src="/feeds/posts/default/-/Google?orderby=updated&amp;alt=json-in-script&amp;callback=weightedRandomRelatedPosts&amp;max-results=20"></script>
<script src="/feeds/posts/default/-/Dev Tips?orderby=updated&amp;alt=json-in-script&amp;callback=weightedRandomRelatedPosts&amp;max-results=20"></script>