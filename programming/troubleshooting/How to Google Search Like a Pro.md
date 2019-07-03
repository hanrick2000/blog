---
description: Google Search Tips, How to Create Custom Search Engines in Chrome, More Search Tips about Gmail, Youtube and More.
---

---

### [Awesome Tips Series about Google Products](https://lifelongprogrammer.blogspot.com/search/label/Google_Series){target="blank"}
<script src="https://lifelongprogrammer.blogspot.com/feeds/posts/default/-/Google_Series?orderby=updated&amp;alt=json-in-script&amp;callback=series&amp;max-results=20"></script>

---


<!-- ### Google Search Settings
- `Where results open`
  - Unselect `Open each selected result in a new browser window`
  - Previously , I choose yes, but now, I choose no, and use [chrome vimium extension](https://lifelongprogrammer.blogspot.com/2019/04/awesome-tips-about-chrome-vimium.html){target="blank"} to decide I want to open in new tab or current tab. -->

### Search to find info first
- Try search first instead of scroll or skew it first.

### Google Search Tips
- Use quotes for exact search
- `*` to match any word or phrase
- `+` to force include, `-` to eliminate results containing certain words
- search syntax: `OR, AND`
- `site:`, `intitle:`, `inurl:`, `intext:`, `allintext:`, `link:`, `related:`, `filetype:`
- `how to pronounce ` vs,
- `translate [keyword or sentence] to [language]`
- `tip calculator, mortgage calculator, timer, stopwatch, [length of time] timer, color picker`
- [search hashtag: #throwbackthursday](https://support.google.com/websearch/answer/2466433)
- Search for a price: `camera $400`
- Search within a range of numbers: `camera $50..$100`
- Use Google Search or chrome search address bar:
  - do math, check spelling, unit conversions(USD to Yuan), `weather`, `define:`
- flight/travel: `san jose to shanghai`

#### [How to restrict search by a date range](https://lifelongprogrammer.blogspot.com/2019/06/how-to-google-search-like-pro.html)
- In the UI, go to **Tools -> Any Time: then specify time range: past hour/week etc**
- **Query filter: before, after**
  - [after:2019-6-1 before:2019-6-19](https://www.seroundtable.com/google-drops-sort-by-date-before-and-after-commands-27393.html)
  - the date format must be: year-month-day or year/month/day
- sort by date for news search

##### [Use qdr: query day range as url parameter](https://support.google.com/websearch/thread/7860817)
- [**qdr: query day range as url parameter**](https://support.google.com/websearch/thread/7860817)
  - qdr:h(past hour), d(past day), w(past week), m(past month), y(past year), qdr:h12 (past 12 hours)
  - only works when pass it as url parameter, not as query string in the input box.
- Create custom search engine to easily search within date range, so we don't have to (use Trackpad) to move pointers and more clicks.
  - Useful to find new update about book, tv shows
  - https://www.google.com/search?tbs=qdr:d&q=%s
- Check here to know why I hate Trackpad and [how to use more keyboard, less trackpad](https://lifelongprogrammer.blogspot.com/2019/06/how-to-use-less-trackpad-more-key-board.html){target="blank"}


#### [Usage rights](https://support.google.com/websearch/answer/29508)
- In the advanced search, use the drop-down to choose what kind of license you want the content to have in the "Usage rights" section.

<!-- #### Parameters in Search URL -->

### [Custom Search Engines in Chrome](https://github.com/philc/vimium/wiki/Search-Engines)
- chrome://settings/searchEngines
- Chrome automatically add custom search engine for StackOverflow, Amazon etc; we can change the keyword shorter to make it even easier to use. For example change **stackoverflow.com** to **st**, **superuser.com** to **su**.

| Name                         | keyword | URL                                                                                                 |
|:---------------------------- |:------- | --------------------------------------------------------------------------------------------------- |
| **Site Search**              | site    | javascript:location='https://www.google.com/search?num=100&q=site:'+escape(location.hostname)+'+%s' |
| Lucky Search With google     | gl      | https://www.google.com/search?btnI=1&q=%s                                                           |
| Lucky Search with DuckDuckGo | dl      | https://duckduckgo.com/?q=!ducky %s                                                                 |
| YouTube Search               | y       | https://www.youtube.com/results?search_query=%s                                                     |
| **Google maps Search**       | gm      | https://www.google.com/maps?q=%s                                                                    |
| Google Maps - Home           | gh      | https://www.google.com/maps/dir/home/%s                                                             |
| **Last Day Search**          | lds     | https://www.google.com/search?tbs=qdr:d&q=%s                                                        |
| **Leave Address bar**        | l       | javascript:                                                                                         |

### Search the Chrome History
- Don't delete all chrome history (unless you have good reason)
  - search and delete specific pages instead.

#### Use Chrome History to find/reopen recently closed pages
- Try to reopen one specific page (not the last one) after close the window, or multiple pages, don't use `ctrl+shift+t` to reopen them then try to find it: reopening them would cause a lot of memory spike and may cause disk spin etc.
- Directly use Chrome Search history to find the page: search or scan last several pages.

### Remove History to Make Search Address Bar Work Better
- Sometime, our browser history may cause some inconvenience, type "ma", think the first would be "mail.google.com", but maybe you recently searched `mac xxx` which may be shown first.
- To fix it, we can `Cmd+y` to open search history, paste `mac xxx` then click the search result area and `Cmd+A` to select all then delete it by `delete` keyboard or the delete button.  

<!-- ### Google Maps Search
- Add the custom search engine listed above
- Query: here to home, home to the_place -->

### [Gmail Search Tips](https://support.google.com/mail/answer/7190)
- from, to, cc, bcc, subject, -, label:, filename:,
- OR or {}
- `category:`, possible values: promotions, update, primary, social, forums,
- after:, before:, older:, newer:
- `older_than: newer_than:`
  - delete all old emails older than 3 months in promotions: `category:promotions older_than:3m`
- has:attachment, has:presentation/document/spreadsheet/youtube
- has:yellow-star, has:blue-info/purple-star
- is:important, is:starred/read/unread/snoozed
- AROUND: `secret AROUND 25 birthday` or `holiday AROUND 10 vacation`
  - Find messages with words near each other. Use the number to say how many words apart the words can be
  - Add quotes to find messages in which the word you put first stays first.
- flight/travel: `san jose to shanghai`

### Youtube Search Tips
- **Use commas to activate filters:**
  - Upload date: `hour, today, week, month, year`, no need this or last
  - Duration: `long, short`
  - Features: `live, HD`
  - Type `playlist, channel, movie, show, video`
- `-channel`: exclude channels
- intitle: to search terms in the name of the video
- `" "` to exact match, `+,-`
- sort by `relevance, view count, upload date, rating`

#### Youtube Search Urls
- [results?search_query=movie+trailer&search_sort=video_view_count&filters=month](https://stackoverflow.com/questions/44320454/searching-youtube-for-videos-with-specific-range-of-views-eg-between-9-000-000)


### Misc
- **archive.org** to find page deleted
  - `https://web.archive.org/web/*/%s`
- Google Cache(cache:)
  - http://webcache.googleusercontent.com/search?q=cache:%s
- DuckDuckGo
  - !Bang syntax: `!a mac mini`

#### Feeling lucky:
- https://www.google.com/search?btnI=1&q=%s site:$the_site
  - [Google will sometimes chicken out and go to a regular search results page rather than going directly to the top hit](https://webapps.stackexchange.com/questions/86132/url-for-im-feeling-lucky-within-specific-site)
- https://duckduckgo.com/?q=!ducky $search_term site:$the_site
  - [This always work](https://travishorn.com/link-directly-to-googles-i-m-feeling-lucky-feature-65ebe7b552bd)

#### [Related Posts](https://lifelongprogrammer.blogspot.com/search?q=label:Blogger|label:Google){target="blank"}
<script src="https://lifelongprogrammer.blogspot.com/feeds/posts/default/-/Blogger?orderby=updated&amp;alt=json-in-script&amp;callback=weightedRandomRelatedPosts&amp;max-results=20"></script>
<script src="https://lifelongprogrammer.blogspot.com/feeds/posts/default/-/Google?orderby=updated&amp;alt=json-in-script&amp;callback=weightedRandomRelatedPosts&amp;max-results=20"></script>