---
description: How to promote posts based on labels and recency to recommend popular posts, related posts, series.
---

### [Awesome Tips Series about Google Products](https://lifelongprogrammer.blogspot.com/search/label/Google_Series){target="blank"}
<script src="/feeds/posts/default/-/Google_Series?orderby=updated&amp;alt=json-in-script&amp;callback=series&amp;max-results=20"></script>

---

<!-- Boost in-depth posts based on Labels and recency: Weighted Random Sampling -->
#### The Goal
- In [previous post](/2019/03/how-to-promote-posts-based-on-label-and-recency-in-blogger.html){target="blank"}, we have talked about how to promote posts based on labels and recency: `Popular Posts`, `Related Posts`, `Series`.
- For `Related Posts`, we need manually specific what labels are most related with the current post and add the JavaScript code in Markdown.
  - Check [here about how to write post with Markdown](/2019/06/writing-blog-with-markdown-atom-editor-pandoc-and-github.html)
- In this post, we will talk how to automatically promote posts based on labels of current posts when it doesn't have a related post section. This would be useful when we have a lot of old posts.


#### The Implementation
- Check if `related-posts` exists, if not, add the header and add script src which calls [Blogger posts api](/2019/06/awesome-tips-about-google-blogger.html){target="blank"}, the callback will append the links into `related-posts`.
- When we choose labels, we ignore series (as if this series is related with the current one, its very likely we already explicitly add the `series` section.)
- Add a "HTML/JavaScript gadget" at the footer section (after the post body), and put the following JavaScript code there.
- Check [here for the Implementation of weightedRandomRelatedPostsAddToParent](/2019/03/how-to-promote-posts-based-on-label-and-recency-in-blogger.html){target="blank"}.
- We can use [HTML minifier](http://minifycode.com/html-minifier/) to minify the code.

```{.javascript .numberLines .lineAnchors}
<script type="text/javascript">
  //<![CDATA[

  window.onload = function () {
    // use left/right key to go to newer/older post
    document.onkeyup = function (e) {
      if (document.activeElement.nodeName == "TEXTAREA" || document.activeElement.nodeName == "INPUT") return;
      e = e || window.event;
      switch (e.keyCode) {
      case 37:
        var t = document.getElementById("Blog1_blog-pager-newer-link");
        if (t != null) window.location.href = t.href;
        break;
      case 39:
        var n = document.getElementById("Blog1_blog-pager-older-link");
        if (n != null) window.location.href = n.href
      }
    }
  }

  if (!document.getElementById("related-posts") && (!document.title.toLowerCase().startsWith("home page") && document.location.pathname!= "/p/archives.html")) {
    var labels = document.querySelectorAll(".post-labels a");
    var candidates = new Array();
    for (var i = 0; i < labels.length; i++) {
      var innerText = labels[i].innerText;
      if (innerText == 'From_Github') continue;
      if (innerText.toLowerCase().endsWith("series")) continue;
      candidates.push(innerText);
    }
    var pos = Math.floor(Math.random() * candidates.length);
    var finalLabel = candidates[pos];

    var postBody = document.getElementsByClassName("post hentry")[0];
    var postFooter = document.getElementsByClassName("post-footer")[0];
    var relatedPostsHeader = document.createElement("h4");
    relatedPostsHeader.id = "related-posts";
    relatedPostsHeader.innerHTML = "<br><a href='/search/label/" + finalLabel + "' target='blank'>Related Posts</a>"
    postFooter.before(relatedPostsHeader)

    var related_posts_content = document.createElement("div");
    related_posts_content.id = "related_posts_content";
    postFooter.before(related_posts_content)

    document.write('<script type="text/javascript" src="/feeds/posts/default/-/' + finalLabel + '?orderby=updated&amp;alt=json-in-script&amp;callback=weightedRandomRelatedPostsAddToParent&amp;max-results=20"><\/script>');

    document.write('<script type="text/javascript" src="/feeds/posts/default/-/Trending?orderby=updated&amp;alt=json-in-script&amp;callback=weightedRandomRelatedPostsAddToParent&amp;max-results=20"><\/script>');
  }

  publisedPopulars.clear();
  publisedRelateds.clear();
  publisedTrednings.clear();
  <!-- seriesDedup.clear(); -->
  //]]>
</script>
```

---

#### [Related Posts](/search/label/Blogger)<a name="related"></a>
<script src="/feeds/posts/default/-/Blogger?orderby=updated&amp;alt=json-in-script&amp;callback=weightedRandomRelatedPosts&amp;max-results=20"></script>
<script src="/feeds/posts/default/-/Google?orderby=updated&amp;alt=json-in-script&amp;callback=weightedRandomRelatedPosts&amp;max-results=20"></script>