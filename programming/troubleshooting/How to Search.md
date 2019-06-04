

### Search to find info
Before you tried search:
- Don't scroll


- **archive.org** to find page deleted
  - `https://web.archive.org/web/*/%s`
- Google Cache
  - http://webcache.googleusercontent.com/search?q=cache:%s

- Feeling lucky:
  - https://www.google.com/search?btnI=1&q=%s site:$the_site
    - [Google will sometimes chicken out and go to a regular search results page rather than going directly to the top hit](https://webapps.stackexchange.com/questions/86132/url-for-im-feeling-lucky-within-specific-site)
  - https://duckduckgo.com/?q=!ducky $search_term site:$the_site
    - [This always work](https://travishorn.com/link-directly-to-googles-i-m-feeling-lucky-feature-65ebe7b552bd)

### [Custom Search Engines](https://github.com/philc/vimium/wiki/Search-Engines)
- chrome://settings/searchEngines

| Name                   | keyword | URL                                                                                                 |
|:---------------------- |:------- | --------------------------------------------------------------------------------------------------- |
| Site Search            | site    | javascript:location='https://www.google.com/search?num=100&q=site:'+escape(location.hostname)+'+%s' |
| Lucky Site Search      | sl      | javascript:location='https://duckduckgo.com/?q=!ducky+'+'%s+site:'+escape(location.hostname)        |
| YouTube Search         | y       | https://www.youtube.com/results?search_query=%s                                                     |
| **Google maps Search** | gm      | https://www.google.com/maps?q=%s                                                                    |
| Google Maps - Home     | gh      | https://www.google.com/maps/dir/home/%s                                                             |
| Leave Address bar      | l       | javascript:                                                                                         | 

### Google Maps Search
- Add the custom search engine listed above
- Query: here to home, home to the_place