
Amazon Affiliate Program provides different kinds of ads.

### Native Shopping Ads
- amzn_assoc_placement should be unique.
- amzn_assoc_search_bar: false/true to whetehr show the search bar.

### Custom Ads
Custom Ads allows us to curate specific products from Amazon that you would like to recommend and place the ad unit into your webpage. All we need is find a list ASINs of products and add them into amzn_assoc_asins.

```js
<script type="text/javascript">
amzn_assoc_placement = "adunit0";
amzn_assoc_search_bar = "false";
amzn_assoc_tracking_id = "the_tracking_id";
amzn_assoc_ad_mode = "manual";
amzn_assoc_ad_type = "smart";
amzn_assoc_marketplace = "amazon";
amzn_assoc_region = "US";
amzn_assoc_title = "Best books for algorithms interview";
amzn_assoc_linkid = "the_amzn_assoc_linkid";
amzn_assoc_asins = "0984782850,1517671272,1617292230,032157351X,1537713949,0262033844,111941847X,819324527X";
</script>
<script src="//z-na.amazon-adsystem.com/widgets/onejs?MarketPlace=US"></script>

<div id="amzn-assoc-ad-19c89cc6-6f8f-485d-a31a-7bc49e98e831"></div><script async src="//z-na.amazon-adsystem.com/widgets/onejs?MarketPlace=US&adInstanceId=19c89cc6-6f8f-485d-a31a-7bc49e98e831"></script>
```

<script type="text/javascript">
amzn_assoc_placement = "adunit0";
amzn_assoc_search_bar = "false";
amzn_assoc_tracking_id = "jeffery06-20";
amzn_assoc_ad_mode = "manual";
amzn_assoc_ad_type = "smart";
amzn_assoc_marketplace = "amazon";
amzn_assoc_region = "US";
amzn_assoc_title = "Best books for algorithms interview";
amzn_assoc_linkid = "595ccbf639e3d3215212481e02dc6909";
amzn_assoc_asins = "0984782850,1517671272,1617292230,032157351X,1537713949,0262033844,111941847X,819324527X";
</script>
<script src="//z-na.amazon-adsystem.com/widgets/onejs?MarketPlace=US"></script>

### Recommendation Ads
- Displays products related to your page content and visitors
- We can choose "Emphasize Categories".

<div id="amzn-assoc-ad-33a4b9dd-dd31-4110-93a9-49d82ca69927"></div><script async src="//z-na.amazon-adsystem.com/widgets/onejs?MarketPlace=US&adInstanceId=33a4b9dd-dd31-4110-93a9-49d82ca69927"></script>

### Search Ads
- Display search results from Amazon.com by specifying a search phrase and selecting a relevant category to your page content in a responsive ad unit that works across screen sizes.

- We can specify a list of search phrases and sort them by priority, random pick one search phrase and stick to it in the X(10) days.

``` {.html .numberLines .lineAnchors}
<script type="text/javascript">
  function createCookie(name, value, days) {
    if (days) {
      var date = new Date();
      date.setTime(date.getTime() + (days * 24 * 60 * 60 * 1000));
      var expires = "; expires=" + date.toGMTString();
    } else var expires = "";
    document.cookie = name + "=" + value + expires + "; path=/";
  }

  function readCookie(name) {
    var nameEQ = name + "=";
    var ca = document.cookie.split(";");
    for (var i = 0; i < ca.length; i++) {
      var c = ca[i];
      while (c.charAt(0) == " ") c = c.substring(1, c.length);
      if (c.indexOf(nameEQ) == 0) return c.substring(nameEQ.length, c.length);
    }
    return null;
  }

  function deleteCookie(name, path, domain) {
    if (readCookie(name)) createCookie(name, "", -1, path, domain);
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

<script type="text/javascript">
var pos = readCookie("amazonItemPos")
var products = Array("iphone",  "iPad Pro", "iPad Mini", "apple watch series 4", "MacBook Pro", "MacBook Air", "google pixel 3", "chromebook", "Amazon Echo");

var items = new Set();
var totalCount = products.length;
for (var i = 0; i < products.length; i++) {
  items.add(
    {
      product: products[i],
      weight: totalCount - i,
      pos: i
    }
  );
}
// var item = items[Math.floor(Math.random() * items.length)];
if (pos == null || pos <0 || pos > products.length) {
  // pos = Math.floor(Math.random() * items.length);
  pos = pickOne(items).pos
  createCookie("amazonItemPos", pos, 10);  
}

var item = products[pos];
amzn_assoc_placement = "adunit3";
amzn_assoc_search_bar = "true";
amzn_assoc_tracking_id = "the_tracking_id";
amzn_assoc_search_bar_position = "bottom";
amzn_assoc_ad_mode = "search";
amzn_assoc_ad_type = "smart";
amzn_assoc_marketplace = "amazon";
amzn_assoc_region = "US";
amzn_assoc_title = "";
amzn_assoc_default_search_phrase = item;
amzn_assoc_default_category = "All";
amzn_assoc_linkid = "the_amzn_assoc_linkid";
</script>
<script src="//z-na.amazon-adsystem.com/widgets/onejs?MarketPlace=US"></script>
```
<script type="text/javascript">
  function createCookie(name, value, days) {
    if (days) {
      var date = new Date();
      date.setTime(date.getTime() + (days * 24 * 60 * 60 * 1000));
      var expires = "; expires=" + date.toGMTString();
    } else var expires = "";
    document.cookie = name + "=" + value + expires + "; path=/";
  }

  function readCookie(name) {
    var nameEQ = name + "=";
    var ca = document.cookie.split(";");
    for (var i = 0; i < ca.length; i++) {
      var c = ca[i];
      while (c.charAt(0) == " ") c = c.substring(1, c.length);
      if (c.indexOf(nameEQ) == 0) return c.substring(nameEQ.length, c.length);
    }
    return null;
  }

  function deleteCookie(name, path, domain) {
    if (readCookie(name)) createCookie(name, "", -1, path, domain);
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

<script type="text/javascript">
var pos = readCookie("amazonItemPos")
var products = Array("iphone",  "iPad Pro", "iPad Mini", "apple watch series 4", "MacBook Pro", "MacBook Air", "google pixel 3", "chromebook", "Amazon Echo");

var items = new Set();
var totalCount = products.length;
for (var i = 0; i < products.length; i++) {
  items.add(
    {
      product: products[i],
      weight: totalCount - i,
      pos: i
    }
  );
}
// var item = items[Math.floor(Math.random() * items.length)];
if (pos == null || pos <0 || pos > products.length) {
  // pos = Math.floor(Math.random() * items.length);
  pos = pickOne(items).pos
  createCookie("amazonItemPos", pos, 10);  
}

var item = products[pos];
amzn_assoc_placement = "adunit3";
amzn_assoc_search_bar = "true";
amzn_assoc_tracking_id = "jeffery06-20";
amzn_assoc_search_bar_position = "bottom";
amzn_assoc_ad_mode = "search";
amzn_assoc_ad_type = "smart";
amzn_assoc_marketplace = "amazon";
amzn_assoc_region = "US";
amzn_assoc_title = "";
amzn_assoc_default_search_phrase = item;
amzn_assoc_default_category = "All";
amzn_assoc_linkid = "679bebb9e6bcfd8a84ab66d04b8b6ddb";
</script>
<script src="//z-na.amazon-adsystem.com/widgets/onejs?MarketPlace=US"></script>

### Tips
- [The 90 Day Amazon Affiliate Cookie – Frequently Asked Questions](http://www.authorityazon.com/90-day-amazon-affiliate-cookie-frequently-asked-questions/){target="blank"}





