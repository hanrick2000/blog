<!-- Boost in-depth posts based on Labels and recency: Weighted Random Sampling -->
#### The Goal
- `Popular Posts` in Blogger shows posts that are most viewed in last 7/30 days, last year or all time. But maybe some posts are popular because of its simplicity, or shared by you or others in stack-overflow or social media.
- As a tech blogger, We want to promote in-depth posts, and also consider their recency.

---

#### When to Use It
##### Randomly Promote Posts Based On Labels And Recency 
- Add Label `Must Read` to posts that we want to promote.
- Add a `HTML/JavaScript gadget` with the following HTML/JavaScript code.
- We can have multiple gadgets to promote posts from different label.

##### Related Post
- We can also add `Related Post` to current page to promote posts with same label.
  - We don't have to manually add or update the related posts.
  - [demo link](/2019/03/how-to-promote-posts-based-on-label-and-recency-in-blogger.html#related){target="blank"}
  - I use markdown to write post. 
```markdown
#### [Related Posts](/search/label/Blogger)
<script src="/feeds/posts/default/-/Blogger?orderby=updated&amp;alt=json-in-script&amp;callback=weightedRandomRelatedPosts&amp;max-results=20"></script> 
```

##### Series
- We may continue to write multiple articles about same topic.
- We can use the script to automatically pull new posts from this series and show them in old posts.

---

#### The Implementation Randomly Pick N Items From Weighted List
- Use feeds API to get top 50 latest updated posts from label: `Promo` and give each item a weight based on updated time.
- We can use [HTML minifier](http://minifycode.com/html-minifier/) to minify the code.
- As these functions may be used by different widgets or places, we can add the code into a "HTML/JavaScript gadget" and put it right below `header` at Layout.
```javascript
<script type="text/javascript">
var maxRelatedPostsCount = 10;
var maxPopularPostsCount = 20;
var publisedPopulars = new Set();
var publisedRelateds = new Set();
var maxPopularTrendingCount = 20;
var publisedTrednings = new Set();

function weightedRandomPopularPosts(json) {
  weightedRandomImpl(json, publisedPopulars, maxPopularPostsCount);
}
function weightedRandomRelatedPosts(json) {
  weightedRandomImpl(json, publisedRelateds, maxRelatedPostsCount);
}
function weightedRandomTredningPosts(json) {
  weightedRandomImpl(json, publisedTrednings, maxPopularTrendingCount);
}
// TODO random or order? get all or not
function weightedRandomImpl(json, publisedPosts, maxCount) {
  var weightedPosts = getPosts(json);
  while (publisedPosts.size < maxCount) {
    var picked = pickOne(weightedPosts);
    if (picked == null) break;
    if (publisedPosts.has(picked)) break;

    publisedPosts.add(picked);
    weightedPosts.delete(picked);
    document.write('<li>');
    document.write(picked.post);
    document.write('</li>');
  }
}

function getPosts(json) {
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
    if (window.location.href == posturl) continue;
    if (postTitle.toLowerCase().startsWith("draft")) continue;
    weightedPosts.add({
      post: postTitle.link(posturl),
      weight: totalCount - count
    });
  }
  return weightedPosts;
}

function pickOne(weightedPosts) {
  var totalWeight = 0;
  for (let post of weightedPosts) {
    totalWeight += post.weight;
  }
  var randomWeight = Math.random() * totalWeight;
  var currWeight = 0;
  for (let post of weightedPosts) {
    currWeight += post.weight;
    if (currWeight > randomWeight) {
      return post;
    }
  }
}

function series(json) {
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
    document.write('<li>', postTitle.link(posturl), '</li>');
  }
}
</script>
<script src="/feeds/posts/default/-/Must Read?orderby=updated&alt=json-in-script&callback=weightedRandomPopularPosts&max-results=60">
```

---

#### [Demo link](/2019/03/how-to-promote-posts-based-on-label-and-recency-in-blogger.html)
- the `Popular Posts` on the right sidebar.
- [ex2](/2017/10/awesome-tips-about-atom-editor.html#related){target="blank"}
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