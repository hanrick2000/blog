
<style>
#outer-wrapper {
  width: 905%;
  margin:0 auto;
}
</style>

column-left-outer
column-center-outer
column-center-inner

#Label1,#PopularPosts3{width=180px}

<style>.red{color:red}.column-left-inner{margin-left:-10px}#TOC ul{margin:0}#TOC ul li{margin:0}#TOC>ul>li>a[href='#section']{display:none}</style>

```javascript

document.querySelector(".post-title").onclick = function() {
  window.location.href=window.location.href;
}

var titleEl = document.querySelector(".post-title");
var title = titleEl.innerHTML;
if(!title.startsWith("<a") {
  titleEl.innerHTML = "<a href='"+window.location.href+"'>"+title+"</a>";
}
```