### [Awesome Tips Series about Google Products](https://lifelongprogrammer.blogspot.com/search/label/Google_Series){target="blank"}
<script src="https://lifelongprogrammer.blogspot.com/feeds/posts/default/-/Google_Series?orderby=updated&amp;alt=json-in-script&amp;callback=series&amp;max-results=20"></script>

---

<!-- SD:
Tips about Youtube, Shortcuts, Settings, Popular Channels
-->

### Chrome Extensions for Youtube
- [Auto Close YouTube Ads](https://greasyfork.org/en/scripts/9165-auto-close-youtube-ads), install [Tampermonkey](https://chrome.google.com/webstore/detail/tampermonkey/dhdgffkkebhmkfjojejmpbldmpobfkfo) first
- [Video Adblocker for Youtube™ Extension](https://chrome.google.com/webstore/detail/video-adblocker-for-youtu/hflefjhkfeiaignkclmphmokmmbhbhik)
- Check here for more [must have chrome extensions](https://lifelongprogrammer.blogspot.com/2019/05/best-google-chrome-extensions.html){target="blank"}

#### Always on top Floating Mini Player for YouTube™.
- [Floating for YouTube™](https://chrome.google.com/webstore/detail/floating-for-youtube/jjphmlaoffndcnecccgemfdaaoighkel)
- [Floating for YouTube™ Extension](https://chrome.google.com/webstore/detail/floating-for-youtube-exte/egncdnniomonjgpjbapalkckojhkfddk)

#### [Embed a video or playlist](https://support.google.com/youtube/answer/171780)
```html
<iframe width="560" height="315"
src="https://www.youtube.com/embed/videoseries?list=PLx0sYbCqOb8TBPRdmBHs5Iftvv9TPboYG"
frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>
```

##### Options
- autoplay=0/1: Whether starts playing the 1st video in the playlist automatically, when the page loads
- loop=0/1
- frameborder="0" allow="autoplay" allowfullscreen
- width, height

### Tips about Youtube
- Right click the video and choose **Loop** to loop a video infinitely
- Share a video at any point: Share -> Embedded -> Change **Start at** or in the script, change or add **start=30s** or any seconds.
- Search by music type, YouTube will show **Top Tracks**
- <http://deturl.com> to download youtube videos without any plugin
- <https://keepvid.com>

#### Switch account in Youtube
- Click **Switch account** in the top right corner
  - It's not same/consistent as other Google Apps for no specific good reason.


### Shortcuts
- These shortcuts also work when play videos in Google Drive or embedded videos from Youtube or Google Drive.
- When use together with [Chrome Vimium](https://lifelongprogrammer.blogspot.com/2019/04/awesome-tips-about-chrome-vimium.html), we need exclude keys like "<,>,1,2".

|                  |                                                                         |
|:---------------- |:----------------------------------------------------------------------- |
| /                | Go to search box.                                                       |
| f                | Activate full screen                                                    |
| **Shift+>(<)**   | **decrease/Increase the speed of video playback**                       |
| **0..9**         | **Seek to specific point in the video (7 advances to 70% of duration)** |
| **Shift+N(P)**   | **Move to the next(previous) video**                                    |
| **i**            | **Launch the Miniplayer.**                                              |
| j/l              | Seek backward/(forward) 10 seconds in player.                           |
| Left/Right arrow | Seek backward/forward 5 seconds.                                        |
| Up/Down arrow    | Increase/decrease the volume 5%                                         |
| **m**            | **mute on/off**                                                         |

#### Customize [Chrome Vimium](https://lifelongprogrammer.blogspot.com/2019/04/awesome-tips-about-chrome-vimium.html){target="blank"}
[Chrome Vimium](https://lifelongprogrammer.blogspot.com/2019/04/awesome-tips-about-chrome-vimium.html){target="blank"} provides a lot of shortcuts to make us easier to navigate in Chrome. Some shortcuts from [Chrome Vimium](https://lifelongprogrammer.blogspot.com/2019/04/awesome-tips-about-chrome-vimium.html){target="blank"} conflicts, we can add the following at `Excluded URLs and keys` at `Vimium Options`.

- Read here for [more awesome tips about chrome vimium](https://lifelongprogrammer.blogspot.com/2019/04/awesome-tips-about-chrome-vimium.html){target="blank"}

| Patterns                         | Keys            |
|:-------------------------------- |:--------------- |
| https?://www.youtube.com/*       | ?/f<>0123456789 |

#### Skipping
- add `start=30` this will skip the first 30 seconds of the video
- Click **0..9**  will **Seek to specific point in the video (7 advances to 70% of duration)**


#### Youtube Search Tips
Add ", HD" in the search query to show high quality videos, add ", week" to show videos uploaded in this week only.

- **Use commas to activate filters:**
  - Upload date: `hour, today, week, month, year`, no need this or last
  - Duration: `long, short`
  - **Features**: `live, HD`
  - Type `playlist, channel, movie, show, video`
- `-channel`: exclude channels
- intitle: to search terms in the name of the video
- `" "` to exact match, `+,-`
- sort by `relevance, view count, upload date, rating`

### Kids
- [Turn on Restricted Mode for Kids](https://support.google.com/youtube/answer/174084?co=GENIE.Platform%3DDesktop){target="blank"}
  - Go to [youtube.com/account](https://www.youtube.com/account), at the bottom, turn on **Restricted mode** or **Lock Restricted Mode on this browser**.
- Use **YouTube For Kids**

<!-- #### Transcripts
- We can watch video with Transcripts: `c` to **toggle captions ON/OFF**. -->

<!-- - Link to Any Part of a Video -->

<!-- - youtuberepeater to Loop a Video Infinitely
  - Just change youtube to youtuberepeater
  - `youtuberepeater.com/watch?v=_Yt9Xfo4VN4` -->
<!-- - gifyoutube.com/watch -->

### Youtube App Settings
- We can change the settings to turn on/off: **Dark mode**, **Restricted mode**, **Play HD on Wi-Fi only**, **Pause watch history**, **Pause search history**.
- Turn on Incognito mode
- **Double-Tap to Seek** on left or right to go back or forward 10 seconds, we can also customize it at Settings.

#### [Trending](https://www.youtube.com/feed/trending)
- <https://www.youtube.com/feed/trending>
- Types of trending: News, Music, Movies, Gaming
- Check trending in other part of the world:
  - add ?gl=COUNTRYCODE: US, HK, TW, IN

#### Frequently Accessed Urls
Know some frequently accessed urls, so we can easily type or choose in the address bar without having to find where the menu is, move the pointer there by mouse or trackpad then click.

- Live videos: https://www.youtube.com/live
- /feed/history
- [youtube.com/feed/subscriptions](https://www.youtube.com/feed/subscriptions){target="blank"}
- Show all subscriptions at [Subscription Manager](https://www.youtube.com/subscription_manager)

<!-- ### Music
- Search by music type, YouTube will show **Top Tracks** -->
<!-- > Folk music, New-Age Music, Jazz, Heavy metal, R&B, Reggae, -->

### How to Spend Less Time on Youtube
- `Shift+>(<)` to increase/decrease speed in Youtube
- Type **1 or 2** to skip the beginning.
- Save it for later
  - So we can watch it during dinner time with family instead now.

### Channels + Explore
- [Popular on YouTube](https://www.youtube.com/channel/UCF0pVplsI8R5kcAqgtoRqoA)
- [Most Viewed Videos of All Time • (Over 450M views)](https://www.youtube.com/playlist?list=PLirAqAtl_h2r5g8xGajEwdXd3x1sZh8hC)
  - <https://www.youtube.com/user/MyTop10Videos/playlists>
<iframe width="560" height="315" src="https://www.youtube.com/embed/videoseries?list=PLirAqAtl_h2r5g8xGajEwdXd3x1sZh8hC" frameborder="0" allow="autoplay" allowfullscreen></iframe>`

### Youtube for Developers
_will update this when I find more good channels for developers._

- [TED](https://www.youtube.com/user/TEDtalksDirector)
- [GoogleDevelopers](https://www.youtube.com/user/GoogleDevelopers) <!-- 1.8M -->
- [GoogleTechTalks](https://www.youtube.com/channel/UCtXKDgv1AVoG88PLl8nGXmw) <!-- : 307K -->
- [Talks at Google](https://www.youtube.com/user/AtGoogleTalks)
- [Java](https://www.youtube.com/channel/UCmRtPmgnQ04CMUpSUqPfhxQ) <!-- : 85K -->
- [InfoQ](https://www.youtube.com/user/MarakanaTechTV) <!-- : 152K -->
- [Facebook Developers](https://www.youtube.com/user/FacebookDevelopers) <!-- : 112K -->
- [NetflixOpenSource](https://www.youtube.com/channel/UCGGRRqAjPm6sL3-WGBDnKJA)
- [Netflix UI Engineering](https://www.youtube.com/channel/UCGGRRqAjPm6sL3-WGBDnKJA)
- [IBM Developer](https://www.youtube.com/user/developerworks)
- [GOTO Conferences](https://www.youtube.com/user/GotoConferences) <!-- : 122K -->
- [dotconferences](https://www.youtube.com/user/dotconferences)
- [Strange Loop](https://www.youtube.com/channel/UC_QIfHvN9auy2CoOdSfMWDw)
- [GeeksforGeeks](https://www.youtube.com/channel/UC0RhatS1pyxInC00YKjjBqQ)
- [Amazon Web Services](https://www.youtube.com/user/AmazonWebServices)
- [Twitter University](https://www.youtube.com/user/TwitterUniversity/videos)
- [Eclipse Foundation](https://www.youtube.com/user/EclipseFdn)
- [Art of the Problem](https://www.youtube.com/user/ArtOfTheProblem)
- [TechCrunch](https://www.youtube.com/user/techcrunch)

<!-- - TheApacheFoundation,
- No Update: LinkedInTechTalks,
- [@Scale - no-update](https://www.youtube.com/channel/UCd9I8ZkgoR1d7GeSj_wi_LQ) -->
<!-- - [ScaleConf](https://www.youtube.com/user/ScaleConf) -->
<!-- #### System Design or Algorithms
- [Success in Tech](https://www.youtube.com/channel/UC-vYrOAmtrx9sBzJAf3x_xw)
- [Tushar Roy - Coding Made Simple](https://www.youtube.com/user/tusharroy2525) -->
<!-- Algorithms Live!,  -->

<!-- ### Others
- Smithsonian Channel -->

<!-- a|b|c|d|e|f|g|h|i|j|k|l|m|n|o|p|q|r|s|t|u|v|w|x|y|z|1|1|2|3|4|5|6|7|8|9|0
a|b|c|d|e|f|g|h|i|j|k|l|m|n|o|p|q|r|s|t|u|v|w|x|y|z|A|B|C|D|E|F|G|H|I|J|K|L|M|N|O|P|Q|R|S|T|U|V|W|X|Y|Z|1|1|2|3|4|5|6|7|8|9|0 -->

<!-- ### For developers -->
<!-- tv.youtube.com -->

### [Different Profiles: how to separate videos work profession skills and entertainment in youtube](https://support.google.com/youtube/thread/8133309)
Youtube suggests videos based on view history and we watch a lot of music or entertainment videos, so Youtube suggests a lot of it. But we also care about our profession skills, want to watch more videos that may improve our soft skills, profession skills that make us think, but sometimes, we just don't know what to look for and what channels to follow in Youtube.

One workaround is:

- Two accounts, switch between them
- Two Chrome(One Canary), each Chrome with different account
- still difficult to use and sometimes forget to switch and use the wrong account
- It would be great if Youtube can build different profiles: one for work, one for life and entertainment, one for kids, user can easily switch between different profiles.

### Youtube Search Urls
- [results?search_query=movie+trailer&search_sort=video_view_count&filters=month](https://stackoverflow.com/questions/44320454/searching-youtube-for-videos-with-specific-range-of-views-eg-between-9-000-000)

### Support
- <https://support.google.com/youtube>
- <https://support.google.com/youtube/community>

#### [Related Posts](https://lifelongprogrammer.blogspot.com/search/label/Google)<a name="related"></a>
<script src="https://lifelongprogrammer.blogspot.com/feeds/posts/default/-/Google?orderby=updated&amp;alt=json-in-script&amp;callback=weightedRandomRelatedPosts&amp;max-results=20"></script>
<script src="https://lifelongprogrammer.blogspot.com/feeds/posts/default/-/Dev Tips?orderby=updated&amp;alt=json-in-script&amp;callback=weightedRandomRelatedPosts&amp;max-results=20"></script>