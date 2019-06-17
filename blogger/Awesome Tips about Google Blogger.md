### TL;DR
- How to use Google Blogger efficiently.
- [Change Date And Time To Promote/Move Posts.](#change_date_time)
- [Manage/Use Labels Effectively.](#labels)
- [Tips about SEO and Promote Posts.](#seo_tips)

---

### [Awesome Tips Series about Google Products](https://lifelongprogrammer.blogspot.com/search/label/Google_Series){target="blank"}
<script src="/feeds/posts/default/-/Google_Series?orderby=updated&amp;alt=json-in-script&amp;callback=series&amp;max-results=20"></script>

---

### [Awesome Tips Series about Blogger](https://lifelongprogrammer.blogspot.com/search/label/Blogger_Series){target="blank"}
<script src="/feeds/posts/default/-/Blogger_Series?orderby=updated&amp;alt=json-in-script&amp;callback=series&amp;max-results=20"></script>

---

### Change Date And Time To Promote/Move Posts<a name="change_date_time"></a>
Chrome uses `published data` to decide where the post is shown in `Blog Archive` or feed, we can change the `published data` after publish to move the post.

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
  - and query: [/search/label/Dev Tips+Chrome](https://lifelongprogrammer.blogspot.com/search/label/Dev Tips+Chrome)
  - Or Query: [/search/?q=label:"Problem Solving"|label:Troubleshooting](https://lifelongprogrammer.blogspot.com/search/?q=label:"Problem Solving"|label:Troubleshooting)
  - Search a keyword within a Label: add q=%s
    - [/search/label/Dev Tips+Chrome?q=Markdown](https://lifelongprogrammer.blogspot.com/search/label/Dev Tips+Chrome?q=Markdown)
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
- max-results: the maximum number of results to be retrieved
- orderby: updated, published
- [Search Multiple Labels(AND) in Blogger Feeds](http://waltz.blogspot.com/2007/07/search-multiple-labels-in-blogger-feeds.html)
  - and query: [feeds/posts/default/-/<label1>/<label2>/.../<labelN>](https://lifelongprogrammer.blogspot.com/feeds/posts/default/-/Dev Tips/Chrome?orderby=updated)
  - or query: [/feeds/posts/default?q=label:label1|label:label2](https://lifelongprogrammer.blogspot.com/feeds/posts/default?q=label:Chrome|label:Markdown)

### Tips about SEO and Promote Posts<a name="seo_tips"></a>
- Custom the url at `Links -> Permalink` to make it more readable
- [Show Post Title Before Blog Title](https://masterblogging.com/post-title-before-blog-title/)
- [Add `search description`](https://xomisse.com/blog/enable-search-description-blogger)
  - [It appears in Google Search or when we share it to Linkedin, Facebook, Twitter](https://www.techprevue.com/post-search-description-blogger-seo/)
  - You have to add content to the box, if it's empty or you delete the description in the future, the `search description` function will be gone.
- Add ads at the before of `<data:post.body/>`{.xml} in the template.

#### [Create an Archive List/Page](https://www.sarwrites.com/2015/09/create-archive-listpage-for-blogger.html)
- Add the archive link to near the home button

#### Add `Custom Redirects` after changed the url
- ex: [/2018/06/chrome-tips-and-tricks.html](https://lifelongprogrammer.blogspot.com/2018/06/chrome-tips-and-tricks.html) will be redirected to [/2018/06/awesome-tips-about-chrome.html](https://lifelongprogrammer.blogspot.com/2018/06/awesome-tips-about-chrome.html)

#### [Create a Custom "Page Not Found"](https://lifelongprogrammer.blogspot.com/2019/05/how-to-promote-your-content-by-creating-sticking-index-page-in-blogger.html#page_not_found)
- ex: [N/A](https://lifelongprogrammer.blogspot.com/na)

#### [Promote your Content by Creating and Sticking Index Page](https://lifelongprogrammer.blogspot.com/2019/05/how-to-promote-your-content-by-creating-sticking-index-page-in-blogger.html)
- Publish the post first then change date to a future date
- ex: [home](https://lifelongprogrammer.blogspot.com/2019/05/home.html)

#### [How To Promote Posts Based On Labels And Recency](https://lifelongprogrammer.blogspot.com/2019/03/how-to-promote-posts-based-on-label-and-recency-in-blogger.html)

### Tips
- [Remove Header and ]
  - In **Edit Html** -> **Jump to Widget** -> then change **locked** to false
  - Then go to **Layout**, we can remove these widgets now.
- [Remove the automatically added code: Dir="Ltr" Trbidi="On"](https://www.howbloggerz.com/2016/07/remove-ltr-trbidi-code-from-blogger-posts.html)
  - Disable this by turn off "Enable transliteration" in **Language and formatting settings**
  - If "Enable transliteration" is on, blogger will automatically add this code whenever it detects it's not there
  - if you have custom javascript code in your post, this behavior will break the js code.
- [Hide or Remove Blogger Attribution Gadget](https://ultimatebloggerguide.blogspot.com/2016/06/remove-powered-by-blogger-attribution-widget.html)
- [Open external links in new tabs automatically](https://yihui.name/en/2018/09/target-blank/)
- [Add anchor links to section headings](https://yihui.name/en/2018/11/md-js-tricks/)
- [Create a page to list all posts](https://www.toptip.ca/2012/03/blogger-retrieve-list-of-all-posts.html)
- [Left/Right key to go to older/newer post](http://theblogtrickz.blogspot.com/2015/03/navigate-through-blogger-posts-using.html)
  - Use a widget to add javascript instead of update the template directly: it's easier, and will still work even when change the template.
- [Reset widget template](https://blogging.nitecruzr.net/2010/05/resetting-widget-templates.html) when [show share buttons not work](https://blogging.nitecruzr.net/2010/07/show-share-buttons-not-working-for-all.html)
  - Backup your template file first, as this will revert your change like custom redirect, search description. You will have to readd them.

#### Sitemap web pages
- [Generate Sitemap html page including all labels](https://www.howbloggerz.com/2017/03/generate-html-sitemap-page-blogger.html)
- [Generate Sitemap html page including (multiple) specific labels](https://mybloggeraide.blogspot.com/2017/07/create-html-sitemap-for-specific-label.html)

### [search-console](search.google.com/search-console)
- Add your post to [search-console](search.google.com/search-console) by manually requesting indexing
- Check `Coverage -> Excluded` and request indexing posts for `Discovered - currently not indexed` and `Crawled - currently not indexed`

<!-- ### Advanced
#### XML Code -->

### CSS
<style>

.columns-inner { margin-left: -20px }
</style>
<!-- .main-inner .column-left-outer { margin-left: -180px } -->

---
#### [Related Posts](https://lifelongprogrammer.blogspot.com/search?q=label:Blogger|label:Google){target="blank"}
<script src="/feeds/posts/default/-/Blogger?orderby=updated&amp;alt=json-in-script&amp;callback=weightedRandomRelatedPosts&amp;max-results=20"></script>
<script src="/feeds/posts/default/-/Google?orderby=updated&amp;alt=json-in-script&amp;callback=weightedRandomRelatedPosts&amp;max-results=20"></script>

