<!-- TODOP -->
#### The Goal
- `Popular Posts` in Blogger shows posts that are most viewed in last 7/30 days, last year or all time. But maybe some posts are popular because of its simplicity, or shared by you or others in stack-overflow or social media.
- As a tech blogger, We want to promote in-depth posts, and also consider their recency.

#### Randomly Promote Posts Based On Labels And Recency  
- Add Label `Promote` to posts that we want to promote.
- Add a `HTML/JavaScript gadget` with the following HTML/JavaScript code.
- We can have multiple gadgets to promote posts from different label.
- We can also add `Related Post` to current page to promote posts with same label.
  - We don't have to manually add or update the related posts.
  - [demo link](/2019/03/how-to-promote-posts-based-on-label-and-recency-in-blogger.html+related)
  - I use markdown to write post. 
```markdown
#### [Related Posts](/search/label/Blogger)
<script src="/feeds/posts/default/-/Blogger?orderby=updated&amp;alt=json-in-script&amp;callback=weightedRandomRelatedPosts&amp;max-results=20"></script> 
```

#### The Implementation Randomly Pick N Items From Weighted List
- Use feeds API to get top 50 latest updated posts from label: `Promo` and give each item a weight based on updated time.
- We can use [HTML minifier](http://minifycode.com/html-minifier/) to minify the code.
- As these functions may be used by different widgets or places, we can add the code into a "HTML/JavaScript gadget" and put it right below `header` at Layout.
```javascript
<script type="text/javascript">
function outputMarkdown(json) {
  var weightedPosts = new Set();
  var totalCount = json.feed.entry.length;
  for (var count = 0; count < totalCount; count++) {
    var entry = json.feed.entry[count];
    var postTitle = entry.title.$t;
    var posturl;
    for (var b = 0; b < entry.link.length; b++) {
      if (entry.link[b].rel == 'alternate') {
        posturl = entry.link[b].href;
        break;
      }
    }
    if (postTitle.toLowerCase().startsWith("draft")) continue;
    document.write('- ['+postTitle+"]");
    document.write('('+posturl+")<br/>");
  }
}
</script>
<script src="/feeds/posts/default/-/From_Github?orderby=updated&alt=json-in-script&callback=outputMarkdown&max-results=60"></script>
```



#### [Demo link](/2019/03/how-to-promote-posts-based-on-label-and-recency-in-blogger.html)
- the `Popular Posts` on the right sidebar.
- [ex2](/2017/10/awesome-tips-about-atom-editor.html)
- Get posts randomly weighted from label Atom Editor first, then Markdown, Dev Tips, max: maxRelatedPostsCount=10
```js
// Get posts randomly weighted from label Atom Editor first, then Markdown, Dev Tips, max: maxRelatedPostsCount=10
<script src="/feeds/posts/default/-/Atom Editor?orderby=updated&amp;alt=json-in-script&amp;callback=weightedRandomRelatedPosts&amp;max-results=20"></script>
<script src="/feeds/posts/default/-/Markdown?orderby=updated&amp;alt=json-in-script&amp;callback=weightedRandomRelatedPosts&amp;max-results=20"></script>
<script src="/feeds/posts/default/-/Dev Tips?orderby=updated&amp;alt=json-in-script&amp;callback=weightedRandomRelatedPosts&amp;max-results=20"></script>
```
---

#### [Related Posts](/search/label/Blogger)<a name="related"></a>
<script src="/feeds/posts/default/-/Blogger?orderby=updated&amp;alt=json-in-script&amp;callback=weightedRandomRelatedPosts&amp;max-results=20"></script> 
<script src="/feeds/posts/default/-/Google?orderby=updated&amp;alt=json-in-script&amp;callback=weightedRandomRelatedPosts&amp;max-results=20"></script> 