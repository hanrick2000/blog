---
baseurl: https://lifelongprogrammer.blogspot.com/2019/06/promote-your-content-by-creating-a-custom-page-not-found-in-blogger.html
description: How to create a custom "Page Not Found" to promote posts and maintain our own custom redirects in Blogger.
---

##### [Awesome Tips Series about Blogger](https://lifelongprogrammer.blogspot.com/search/label/Blogger_Series){target="blank"}
<script src="/feeds/posts/default/-/Blogger_Series?orderby=updated&amp;alt=json-in-script&amp;callback=series&amp;max-results=20"></script>

---

#### Why Create a Custom Not Found Page?
We create a custom "Page Not Found" to promote posts when users land on not existing pages, also we can maintain our own custom redirects in Git.

#### Why not Use Custom Redirects in Search Preferences
We can add custom redirect at Settings -> Search Preferences -> Custom Redirects. But [when we reset template](https://blogging.nitecruzr.net/2010/07/show-share-buttons-not-working-for-all.html){target="blank"}, our custom redirects and other changes would be lost. When this happens, we have to re-add all redirects manually.

This happened to me once. So instead add these redirects again (a lot of click and typing), we would like to maintain the redirects in code and commit it into Git.

#### How to Create a Custom "Page Not Found"? in Blogger
There are different choices:
- We can At Settings -> Search Preferences -> Under "Errors and Redirections" click the option to "Edit" Custom Page Not Found
- Or we can create a normal web page. The benefit of this approach is that we can get the analytics of the 404 page, how many times visited ect, so we can decide whether and how to optimize it.


#### Maintain Custom Redirects in Code and Git
<!-- We can add custom redirect at Settings -> Search Preferences -> Custom Redirects. But [when we reset template](https://blogging.nitecruzr.net/2010/07/show-share-buttons-not-working-for-all.html){target="blank"}, our custom redirects and other changes would be lost,

This happened to me once. So instead add them again (a lot of click and typing), I created the following simple javascript code. -->
The advantage of this approach is that we can easily add or remove redirects.
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

-->
<script>inlineAds=true</script>
<script src="//ap.lijit.com/www/delivery/fpi.js?z=332935&width=728&height=90"></script>

#### Redirect to Archives Page
Be default, if there is no custom redirect defined for the missing page, it will redirect to the archives page. As we want
```html
<h3>Will jump to <a href="/p/archives.html">archives</a> after 10 seconds...</h3>
<script>
setTimeout(function(){window.location.pathname='/p/archives.html' }, 10000);
</script>
```

#### Search the Missing Page in Google
We can create one link in the 404 page to help the user to search the missing page in Google. When the user clicks the search link: we will get the last part of the path and search it in Google.\
The user may find the post where we forget to add the redirect or find similar posts: another opportunity to let user explore our website.

We can auto redirect the 404 page to Google search page by `window.location=the_url`, but we want to keep the user in our website.\
Notice that we can't do both: redirect to archives page and open a new page for the Google search by `window.open(url, '_blank')`{.JavaScript}: as the browser will block pop-up that are not caused by trusted events like user clicks.

```html
<script>
function googleSearch() {
  var fileName = redirectPath.split("/").slice(-1)[0];
  if (fileName.endsWith(".html")) {
    fileName = fileName.substr(0, fileName.length - ".html".length)
  }
  var googleUrl = "http://www.google.com/search?as_sitesearch=massivealgorithms.blogspot.com&as_oq=" + fileName.split('-').join(" ")
  window.open(googleUrl, '_blank');
  return false;
}
</script>
<h3><a href="#" target="_blank" onclick="googleSearch()">Click Here to Find the Lost Page in Google</a></h3>
```

#### Promote Posts
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

##### [Related Posts](/search/label/Blogger)<a name="related"></a>
<script src="/feeds/posts/default/-/Blogger?orderby=updated&amp;alt=json-in-script&amp;callback=weightedRandomRelatedPosts&amp;max-results=20"></script>
<script src="/feeds/posts/default/-/Google?orderby=updated&amp;alt=json-in-script&amp;callback=weightedRandomRelatedPosts&amp;max-results=20"></script>