---
description: How to add Google Custom Search to your website anywhere.
---

---

<details open><summary>
[Awesome Tips Series about Blogger](https://lifelongprogrammer.blogspot.com/search/label/Blogger_Series){target="blank"}
</summary>
<script src="https://lifelongprogrammer.blogspot.com/feeds/posts/default/-/Blogger_Series?orderby=updated&amp;alt=json-in-script&amp;callback=series&amp;max-results=20"></script>
</details>

#### Add Custom Search in Google Custom Search
Visit [cse.google.com/cse](https://cse.google.com/cse/all) to create a new custom search engine for our website.\

- We can also choose to only search specific pages by choosing: "Include just this specific page or  URL pattern  I have entered"
  - `THE_BLOGGER_URL/*.html`: this will exclude pages for labels, year, months pages.
- Then go to **look and feel** on the left side, in the layout panel, choose "Results only", as we are going to add search box on our own.
- Now click "Save and Get code".


We can add the search function anywhere: [the home page](https://lifelongprogrammer.blogspot.com/2019/06/archives.html), search box at sidebar, or [a specific page](https://lifelongprogrammer.blogspot.com/p/search.html) for search.

#### Add Search Box to a Page{#search_box}

```html
<meta name="viewport" content="width=device-width, initial-scale=1">
<div class='cse'>
<form action='#' id='cse-search-box'>
  <table>
    <tr>
    <td><input id="searchInput" type='text' name='q' size='80' /></td>
    <td><input type="submit" name="submit" value="Search" /></td>
    </tr>
  </table>
<input name='cx' type='hidden' value='000071145641082027410:THE_CSE_ID'/>
<input name='ie' type='hidden' value='ISO-8859-1'/>
</form>
<script type="text/javascript" src="https://www.google.com/cse/brand?form=cse-search-box&amp;lang=en"></script>
</div>
```

#### Add a Blogger Gadget
We can also add a blogger gadget: Add a "HTML/Javascript" gadget, [put the above code](#search_box), but change the searchInput size, change the form action to the url of search result page.

#### Add Search Result to a Page
```html
<script async src="https://cse.google.com/cse.js?cx=THE_CSE_ID"></script>
<div class="gcse-searchresults-only"></div>
```

#### Remove Ads from Google Custom Search
We can remove ads from search results if we don't have Google Adsense account.
```javascript
function removeGSCAds() {
  var ads = document.querySelector(".gsc-adBlock");
  ads.parentNode.removeChild(ads);
};

window.addEventListener?window.addEventListener("load",removeGSCAds,false) :
window.attachEvent && window.attachEvent("onload",removeGSCAds);
```

#### The Complete Code
<details><summary>
The following is the complete code to add search box and search result.
</summary>
``` {.html .numberLines .lineAnchors}
<meta name="viewport" content="width=device-width, initial-scale=1">
<div class='cse'>
<form action='#' id='cse-search-box'>
  <table>
    <tr>
    <td><input id="searchInput" type='text' name='q' size='80' /></td>
    <td><input type="submit" name="submit" value="Search" /></td>
    </tr>
  </table>
<input name='cx' type='hidden' value='THE_CSE_ID'/>
<input name='ie' type='hidden' value='ISO-8859-1'/>
</form>
<script type="text/javascript" src="https://www.google.com/cse/brand?form=cse-search-box&amp;lang=en"></script>
</div>
<script>
  var urlParams = new URLSearchParams(window.location.search);
  var q = urlParams.get('q');
  if(q) {
    document.getElementById("searchInput").value = q;
  }
  function removeGSCAds() {
    var ads = document.querySelector(".gsc-adBlock");
    ads.parentNode.removeChild(ads);
  };

  window.addEventListener?window.addEventListener("load",removeGSCAds,false) :
  window.attachEvent && window.attachEvent("onload",removeGSCAds);

</script>

<script async src="https://cse.google.com/cse.js?cx=THE_CSE_ID"></script>
<div class="gcse-searchresults-only"></div>
```
</details>

