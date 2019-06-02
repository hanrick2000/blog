### TL;DR
- How to use Google Blogger efficiently.
- [Change Date And Time To Promote/Move Posts.](#change_date_time)
- [Manage/Use Labels Effectively.](#labels)
- [Tips about SEO and Promote Posts.](#seo_tips)

### Change Date And Time To Promote/Move Posts<a name="change_date_time"></a>
- when set published date to future:
  - Update the exiting one: this will not change the date and time in the url but will change where it's put at `Blog Archive`
  - Publish a new one or again: this will schedule the post to publish it in the future
- We can change an old post to a newer date to move and promote it
  - ex: [Keyboard Shortcuts for Developers](https://lifelongprogrammer.blogspot.com/2018/05/keyboard-shortcuts-for-developers.html) was move from 2018/05 to 2019/04
- We can move similar posts together or distribute them into different months/years.

#### Add a post to the past
- Publish a post first (using Automatic time)
- Revert it to draft
- Change date time to past then publish it again
- ex: [Awesome Tips about Chrome Vimium](https://lifelongprogrammer.blogspot.com/2019/04/awesome-tips-about-chrome-vimium.html) was added on 5/30/2019 and changed its date time to `April 08, 2019`

### Manage/Use Labels Effectively<a name="labels"></a>
- [Multiple Labels Search](https://exde601e.blogspot.com/2012/12/search-operators-for-Blogger-labels.html)
  - and query: search/label/LABEL1+LABEL2
  - Or Query: search/?q=label:LABEL1|label:LABEL2
- [Add more Labels to an Existing Post](http://9jaonpointed.blogspot.com/2015/06/how-to-add-more-labels-to-existing-post.html)
- [Bulk remove labels](https://www.makingdifferent.com/how-to-change-remove-labels-at-once-in-blogger/)
  - [Just click the label to be removed at the label action](https://www.youtube.com/watch?v=PfNJRTadzMI)
- [Hide Labels count < X from Label Widget](https://lifelongprogrammer.blogspot.com/2014/05/blogger-hide-labels-of-small-amount-of-posts.html)
```xml
<b:loop values='data:labels' var='label'>
  <b:if cond='data:label.count &gt;= 10'>
    <!-- ....  -->
  </b:if>
</b:loop>
```
- Exclude labels at `Configure Labels`

#### [Blogger Feeds API](https://www.exeideas.com/2016/02/parameters-in-blogspot-feed.html)
- feeds/posts/default/feeds/posts/default/-/THE_LABLE
- orderby: updated, published
- [Search Multiple Labels(AND) in Blogger Feeds](http://waltz.blogspot.com/2007/07/search-multiple-labels-in-blogger-feeds.html)
  - feeds/posts/default/-/<label1>/<label2>/.../<labelN>

### Tips about SEO and Promote Posts<a name="seo_tips"></a>
- [Add `search description`](https://makingamark.blogspot.com/2012/05/how-to-create-search-description-for.html)
  - [It appears in Google Search or when we share it to Linkedin, Facebook, Twitter](https://www.techprevue.com/post-search-description-blogger-seo/)
- Custom the url at `Links -> Permalink`

#### Add `Custom Redirects` after changed the url
- ex: [/2018/06/chrome-tips-and-tricks.html](https://lifelongprogrammer.blogspot.com/2018/06/chrome-tips-and-tricks.html) will be redirected to [/2018/06/awesome-tips-about-chrome.html](https://lifelongprogrammer.blogspot.com/2018/06/awesome-tips-about-chrome.html)

#### [Create a Custom "Page Not Found"](https://lifelongprogrammer.blogspot.com/2019/05/how-to-promote-your-content-by-creating-sticking-index-page-in-blogger.html#page_not_found)
- ex: [N/A](https://lifelongprogrammer.blogspot.com/na)

#### [Promote your Content by Creating and Sticking Index Page](https://lifelongprogrammer.blogspot.com/2019/05/how-to-promote-your-content-by-creating-sticking-index-page-in-blogger.html)
- Publish the post first then change date to a future date
- ex: [home](http://lifelongprogrammer.blogspot.com/2019/05/home.html)

#### [How To Promote Posts Based On Labels And Recency](https://lifelongprogrammer.blogspot.com/2019/03/how-to-promote-posts-based-on-label-and-recency-in-blogger.html)

### Tips
- [Remove the automatically added code: Dir="Ltr" Trbidi="On"](https://www.howbloggerz.com/2016/07/remove-ltr-trbidi-code-from-blogger-posts.html)
  - Disable this by turn off "Enable transliteration" in **Language and formatting settings**
  - If "Enable transliteration" is on, blogger will automatically add this code whenever it detects it's not there
  - if you have custom javascript code in your post, this behavior will break the js code.
- [Hide or Remove Blogger Attribution Gadget](https://ultimatebloggerguide.blogspot.com/2016/06/remove-powered-by-blogger-attribution-widget.html)

#### Sitemap web pages
- [Generate Sitemap html page including all labels](https://www.howbloggerz.com/2017/03/generate-html-sitemap-page-blogger.html)
- [Generate Sitemap html page including (multiple) specific labels](https://mybloggeraide.blogspot.com/2017/07/create-html-sitemap-for-specific-label.html)

### [search-console](search.google.com/search-console)
- Add your post to [search-console](search.google.com/search-console) by manually requesting indexing
- Check `Coverage -> Excluded` and request indexing posts for `Discovered - currently not indexed` and `Crawled - currently not indexed`

<!-- ### Advanced
#### XML Code -->

---
#### [Related Posts](https://lifelongprogrammer.blogspot.com/search/label/Blogger)<a name="related"></a>
<script src="https://lifelongprogrammer.blogspot.com/feeds/posts/default/-/Blogger?orderby=updated&amp;alt=json-in-script&amp;callback=weightedRandomRelatedPosts&amp;max-results=20"></script> 