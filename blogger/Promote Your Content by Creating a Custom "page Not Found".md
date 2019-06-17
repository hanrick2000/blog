<!-- How to create a custom "Page Not Found" to promote posts and maintain our own custom redirects in Blogger. -->

### [Awesome Tips Series about Blogger](https://lifelongprogrammer.blogspot.com/search/label/Blogger_Series){target="blank"}
<script src="/feeds/posts/default/-/Blogger_Series?orderby=updated&amp;alt=json-in-script&amp;callback=series&amp;max-results=20"></script>

---

#### Why?
- We create a custom "Page Not Found" to promote posts when users land on wrong page or maintain our own custom redirects.

#### How to Create a Custom "Page Not Found"? in Blogger
- At Settings -> Search Preferences -> Under "Errors and Redirections" click the option to "Edit" Custom Page Not Found

#### Custom Redirect
We can add custom redirect at Settings -> Search Preferences -> Custom Redirects. But [when we reset template](https://blogging.nitecruzr.net/2010/07/show-share-buttons-not-working-for-all.html){target="blank"}, our custom redirects and other changes would be lost,

This happened to me once. So instead add them again (a lot of click and typing), I created the following simple javascript code.

The advantage is that:
- I can easily add redirects.
- As I use [Atom Editor](https://lifelongprogrammer.blogspot.com/2017/10/awesome-tips-about-atom-editor.html){target="blank"} and [Markdown](https://lifelongprogrammer.blogspot.com/2018/05/awesome-tips-about-markdown.html){target="blank"} to [write posts](https://lifelongprogrammer.blogspot.com/2019/06/writing-blog-with-markdown-atom-editor-pandoc-and-github.html){target="blank"}, so I add the other redirects in this Markdown page, but **Command+/** to comment and hide them.
- the source code of the post is in [Github](https://lifelongprogrammer.blogspot.com/2019/06/writing-blog-with-markdown-atom-editor-pandoc-and-github.html){target="blank"}, I can easily put it back when the change is lost.

```js
function redirectIfNeeded() {
  var redirectMap = new Map();
  redirectMap.set("/2018/06/mac-tips-and-tricks.html", "/2019/02/awesome-tips-about-mac.html");

  var redirect = redirectMap.get(window.location.pathname);
  if (redirect) {
    window.location.pathname = redirect;
  }
}

redirectIfNeeded();
```

<!--
redirectMap.set("/2018/06/chrome-tips-and-tricks.html", "/2018/06/awesome-tips-about-chrome.html");
redirectMap.set("/2018/06/chrome-tips-and-tricks.html", "/2018/06/awesome-tips-about-chrome.html");
redirectMap.set("/2018/05/markdown-tips.html", "/2018/05/awesome-tips-about-markdown.html");
redirectMap.set("/2019/06/how-to-keep-mac-from-overheating.html", "/2019/02/how-to-keep-mac-from-overheating.html");
redirectMap.set("/2019/06/awesome-tips-about-pandoc.html", "/2019/01/awesome-tips-about-pandoc.html");
redirectMap.set("/2019/06/must-have-google-chrome-extensions.html", "/2019/04/must-have-google-chrome-extensions.html");
redirectMap.set("/2019/06/how-to-speed-up-google-chrome.html", "/2019/03/how-to-speed-up-google-chrome.html");
redirectMap.set("/2019/06/building-presentations-with-revealjs.html", "/2019/03/building-presentations-with-revealjs.html");
redirectMap.set("/2018/05/markdown-tips.html", "/2018/05/awesome-tips-about-markdown.html");
redirectMap.set("/2018/05/keyboard-shortcuts.html", "/2018/05/keyboard-shortcuts-for-developers.html");
redirectMap.set("/2016/10/system-design-learning-from-existing.html", "/2016/10/system-design-learning-from-existing-products.html");
redirectMap.set("/2019/04/must-have-google-chrome-extensions.html", "/2019/05/best-google-chrome-extensions.html");
redirectMap.set("/2008/10/iterators-algorithms.html", "/2018/02/implementing-iterator-how-to-succeed-in-algorithms-interview.html");
redirectMap.set("/2008/11/merge-sort-algorithms.html", "/2018/01/merge-sort-how-to-succeed-in-algorithms-interview.html");
redirectMap.set("/2008/07/using-trie-algorithm.html", "/2018/01/trie-how-to-succeed-in-algorithms-interview.html");
redirectMap.set("/2008/07/using-union-find-algorithm.html", "/2018/01/union-find-disjoint-set-how-to-succeed-in-algorithms-interview.html");
redirectMap.set("/2008/07/palindrome-algorithm.html", "/2018/02/palindrome-how-to-succeed-in-algorithms-interview.html");
redirectMap.set("/2008/07/graph-algorithms.html", "/2018/02/graph-algorithm-how-to-succeed-in-algorithms-interview.html");
redirectMap.set("/2008/07/bit-algorithm.html", "/2017/12/bit-algorithm-how-to-succeed-in-algorithms-interview-series.html");
redirectMap.set("/2019/01/best-way-to-style-markdown-with-pandoc.html", "/2019/01/how-to-style-markdown-with-css.html");
redirectMap.set("/2014/09/java-using-sublist.html", "/2018/08/java-sublist-tips-and-traps.html");

https://lifelongprogrammer.blogspot.com/2014/09/java-using-sublist.html
-->


#### Promote Posts<a name="page_not_found"></a>
We can promote popular posts if users land on wrong page (maybe the page is gone or user made a mistake). The code would be same as [the post here](https://lifelongprogrammer.blogspot.com/2019/03/how-to-promote-posts-based-on-label-and-recency-in-blogger.html){target="blank"}: promote posts based on labels.

Also fix css and add the title: paste the above HTML code and add the following text before **New Posts**
```html
<style>
.status-msg-body {
  text-align: left
}
</style>
<br /><br /><br />
<h3>Sorry, the page you were looking for in this blog does not exist. </h3>
<h3>Start exploring here:</h3>
```
- ex: [/2019/opps](https://lifelongprogrammer.blogspot.com/2019/opps){target="blank"}

#### Redirect to Archives Page
```html
<h3>Will jump to <a href="/p/archives.html">archives</a> after 10 seconds...</h3>
<script>
setTimeout(function(){window.location.pathname='/p/archives.html' }, 10000);
</script>
```

#### [Related Posts](/search/label/Blogger)<a name="related"></a>
<script src="/feeds/posts/default/-/Blogger?orderby=updated&amp;alt=json-in-script&amp;callback=weightedRandomRelatedPosts&amp;max-results=20"></script>
<script src="/feeds/posts/default/-/Google?orderby=updated&amp;alt=json-in-script&amp;callback=weightedRandomRelatedPosts&amp;max-results=20"></script>