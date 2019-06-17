### The Goal
I Would like to change the speed of HTML5 video player at pan.baidu.com, so I can spend less time on the video and finish it sooner.

### The Implementation
I found some user script at greasyfork for Chrome with [tampermonkey extension](/2019/04/must-have-google-chrome-extensions.html#chrome-extensions-for-productivity){target="blank"}

- [This one works but can only change the speed to 1.5X](https://greasyfork.org/en/scripts/382594-%E7%99%BE%E5%BA%A6%E7%BD%91%E7%9B%98%E8%A7%86%E9%A2%91%E5%80%8D%E9%80%9F)
- [The other one doesn't work, maybe due to the change of website](https://greasyfork.org/en/scripts/382913-%E7%99%BE%E5%BA%A6%E7%BD%91%E7%9B%98%E8%A7%86%E9%A2%91%E5%80%8D%E6%95%B0%E6%92%AD%E6%94%BE)

Based on these 2 script, I made the following simple user script that can change video speed to 1.5, 1.75, 2.0.

``` {.javascript .numberLines .lineAnchors}
// ==UserScript==
// @name         Change speed at pan.baidu
// @namespace    http://tampermonkey.net/
// @version      1.0
// @description  Add button to change to 1.5, 1.76, 2X speed
// @author       Jeffery Yuan
// @match        *://*.pan.baidu.com/*
// @require      https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js
// ==/UserScript==

(function() {
    'use strict';
    var $ = $ || window.$;

    function addSpeedButton(parentNode, speed){
      var cb = document.createElement("a");
      cb.innerHTML='<a class="g-button" href="javascript:;" title="' + speed + '">'+
      '<span class="g-button-right">'+
          '<em class="icon icon-appeal" title="' + speed +'"></em>'+
          '<span id="fps" class="text" style="width: auto;">' + speed + '</span></span></a>'
      cb.onclick=function(){
             videojs.getPlayers("video-player").html5player.tech_.setPlaybackRate(speed);
      };

      parentNode.after(cb);
    }
    var elms = document.getElementsByClassName("g-button");
    var toolbar = elms[0].parentNode;
    toolbar.removeChild(elms[1]);
    toolbar.removeChild(elms[1]);
    toolbar.removeChild(elms[1]);
    var tb = elms[0];

    addSpeedButton(tb, 2.0)
    addSpeedButton(tb, 1.75)
    addSpeedButton(tb, 1.5)
    addSpeedButton(tb, 1)
})();
```

### Other Ideas
- Able to resume playback of a video at the point in time it was left.

---
### [Related Posts](/search/label/JavaScript){target="blank"}
<script src="/feeds/posts/default/-/JavaScript?orderby=updated&amp;alt=json-in-script&amp;callback=weightedRandomRelatedPosts&amp;max-results=20"></script>