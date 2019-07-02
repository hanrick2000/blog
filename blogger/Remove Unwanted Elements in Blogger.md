---
baseurl: https://lifelongprogrammer.blogspot.com/2018/06/remove-unwanted-elements-in-blogger.html
description: Remove Unwanted Elements in Blogger Such as Attribution, Header, Navbar and Etc to Reduce Page Load Time and Boot Performance
---

##### [Awesome Tips Series about Blogger](https://lifelongprogrammer.blogspot.com/search/label/Blogger_Series){target="blank"}
<script src="/feeds/posts/default/-/Blogger_Series?orderby=updated&amp;alt=json-in-script&amp;callback=series&amp;max-results=20"></script>

---

#### Remove Unwanted Elements in Blogger to Boost Performance
To improve the performance (page load speed) of the blogger, we can remove all elements we don't want like: Attribution, Header, Navbar and etc.

#### Remove Attribution and Header
1. Change locked to false in **Edit HTML**
  - By default we can't remove Attribution and Header widget in **Layout**, as they are locked. So the first step is go to **Theme -> Edit HTML**, then in the **Jump to widget**, select **Attribution1**, change **locked** to false: `<b:widget id='Attribution1' locked='true' title='' type='Attribution'>`{.xml}
2. Now we can go to **Layout** and remove them.

#### Remove Navbar
We can turn the Navbar off in **Layout**. Blogger will not load Navbar related code at all.

<!-- #### Remove "Subscribe to: Posts (Atom)"
- Find `<b:include data='feedLinks' name='feedLinksBody'/>` in the template and remove the block -->

<script>inlineAds=true</script>
<script src="//ap.lijit.com/www/delivery/fpi.js?z=332935&width=728&height=90"></script>

#### Bonus
##### Minify CSS and HTML
To reduce the page size, we can use the following tools to minify HTML and CSS.
- [Minify your HTML](https://html-minifier.com/)
- [Minify your JavaScript](https://javascript-minifier.com/)
- [Online Html Minifier](https://www.willpeavy.com/tools/minifier/)
  - Minify HTML and any CSS or JS included in your markup
  - Not always work
- Command Line: [HTML Minifier](http://minifycode.com/html-minifier/)

##### [Speed Test](https://www.keycdn.com/blog/website-speed-test-tools)
- [Page Speed](https://developers.google.com/speed/pagespeed/insights/)
  - both mobile and desktop test results
- [Pingdom Website Speed Test](https://tools.pingdom.com/)
