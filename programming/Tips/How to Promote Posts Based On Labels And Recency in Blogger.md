<!-- Boost in-depth posts based on Labels and recency: Weighted Random Sampling -->
#### The Goal
- `Popular Posts` in Blogger shows posts that are most viewed in last 7/30 days, last year or all time. But maybe some posts are popular because of its simplicity, or shared by you or others in stack-overflow or social media.
- As a tech blogger, We want to promote in-depth posts, and also consider their recency.

#### Randomly Promote Posts Based On Labels And Recency  
- Add Label `Promote` to posts that we want to promote.
- Add a `HTML/JavaScript gadget` with the following HTML/JavaScript code.
- We can have multiple gadgets to promote posts from different label.
- We can also add `Related Post` to current page to promote posts with same label.
  - We don't have to manually add or update the related posts.
  - [dDemo link](https://lifelongprogrammer.blogspot.com/2019/03/how-to-promote-posts-based-on-label-and-recency-in-blogger.html+related)
  - I use markdown to write post. 
```markdown
#### [Related Posts](https://lifelongprogrammer.blogspot.com/search/label/Blogger)
<script src="https://lifelongprogrammer.blogspot.com/feeds/posts/default/-/Blogger?orderby=updated&amp;alt=json-in-script&amp;callback=weightedRandomRelatedPosts&amp;max-results=20"></script> 
```

#### The Implementation Randomly Pick N Items From Weighted List
- Use feeds API to get top 50 latest updated posts from label: `Promo` and give each item a weight based on updated time.
- We can use [HTML minifier](http://minifycode.com/html-minifier/) to minify the code.
- As this code may be used by different widgets or places, we can add the code into a "HTML/JavaScript gadget" and put it right below `header` at Layout. 
```javascript
<script type="text/javascript">
  var relatedPostsCount = 10;
  function weightedRandomPopularPosts(json) {
    weightedRandomImpl(json, 15);
  }
  function weightedRandomRelatedPosts(json) {
    weightedRandomImpl(json, relatedPostsCount);
  }  
  function weightedRandomImpl(json, maxPromotedCount) {
    var weightedPosts = getPosts(json);
    for (var count = 0; count < maxPromotedCount; count++) {
      var picked = pickOne(weightedPosts);
      if (picked == null) break;
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
</script>
<script src="https://lifelongprogrammer.blogspot.com/feeds/posts/default/-/Promo?orderby=updated&amp;alt=json-in-script&amp;callback=weightedRandomPopular&amp;max-results=60"></script>
```

#### [Demo link](https://lifelongprogrammer.blogspot.com/2019/03/how-to-promote-posts-based-on-label-and-recency-in-blogger.html)
- [ex2](https://lifelongprogrammer.blogspot.com/2019/03/how-to-promote-posts-based-on-label-and-recency-in-blogger.html+related)
---

#### [Related Posts](https://lifelongprogrammer.blogspot.com/search/label/Blogger)<a name="related"></a>
<script src="https://lifelongprogrammer.blogspot.com/feeds/posts/default/-/Blogger?orderby=updated&amp;alt=json-in-script&amp;callback=weightedRandomRelatedPosts&amp;max-results=20"></script> 