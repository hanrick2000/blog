<!-- How to Promote your Content by Creating and Sticking Index Page  -->
#### Requirements
- Create a page which includes posts you would like to promote
- Stick it in your blogger
- Create a Custom "Page Not Found" to promote Posts
#### Create an automatically updated index page 
- Include Sections about **New Posts**, **Recently Updated Posts**, **New Posts based on Labels**

##### The Implementation
- Based on the code from [here](https://www.howbloggerz.com/2017/03/generate-html-sitemap-page-blogger.html)
```html
<script type="text/javascript">
  //<![CDATA[  
  const newPublishedPosts = new Set();
  function showNewPosts(json) {
    var toIgnoreSet = new Set();
    showPostsImpl(json, 20, toIgnoreSet, newPublishedPosts)
  }
  function showUpdatedPosts(json) {
    var toIgnoreSet = newPublishedPosts;
    showPostsImpl(json, 10, toIgnoreSet);
  }
  function showPosts(json, totalposts, toIgnoreSet, addedSet) {
    showPostsImpl(json, 1000);
  }  
  function showPostsImpl(json, totalposts, toIgnoreSet, addedSet) {
    for (var count = 0, publishedCount=0; publishedCount < totalposts && count<= json.feed.entry.length ; count++) {
      var entry = json.feed.entry[count];
      var postTitle = entry.title.$t;
      var posturl;
      // if (count == json.feed.entry.length) break;
      for (var b = 0; b < entry.link.length; b++) {
        if (entry.link[b].rel == 'alternate') {
          posturl = entry.link[b].href;
          break;
        }
      }
      // 
      if(postTitle == "home") continue;
      if(toIgnoreSet && toIgnoreSet.has(postTitle)) continue;
      if(addedSet) addedSet.add(postTitle)
      publishedCount++;
      document.write('<li>');
      document.write(postTitle.link(posturl));        
      document.write('</li>');
    }
  }
  //]]>    
</script>

<br />
<h3>New Posts</h3>
<script src="https://lifelongprogrammer.blogspot.com/feeds/posts/default/?orderby=published&amp;alt=json-in-script&amp;callback=showNewPosts&amp;max-results=21"></script>

<br />
<h3>Updated Posts</h3>
<script src="https://lifelongprogrammer.blogspot.com/feeds/posts/default/?orderby=updated&amp;alt=json-in-script&amp;callback=showUpdatedPosts&amp;max-results=31"></script>

<br />
<h2>Development</h2>
<h3><a href="https://lifelongprogrammer.blogspot.com/search/label/Dev%20Tips">Dev Tips</a></h3>
<script src="https://lifelongprogrammer.blogspot.com/feeds/posts/default/-/Dev Tips?orderby=updated&amp;alt=json-in-script&amp;callback=showPosts&amp;max-results=20"></script>
```

#### [Make a Sticky Post in Blogger](https://www.wikihow.com/Make-a-Sticky-Post-in-Blogger)
- Publish the post first then change date to a future date

#### Create a Custom "Page Not Found" to promote Posts
- At Settings -> Search Preferences -> Under "Errors and Redirections" click the option to "Edit" Custom Page Not Found
- Paste the above HTML code and add the following text before **New Posts**
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

#### Resources
- [How To Generate HTML Sitemap Page On Blogger](https://www.howbloggerz.com/2017/03/generate-html-sitemap-page-blogger.html)