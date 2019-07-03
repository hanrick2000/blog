
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
<script src="https://lifelongprogrammer.blogspot.com/feeds/posts/default/-/From_Github?orderby=updated&alt=json-in-script&callback=outputMarkdown&max-results=60"></script>
```
