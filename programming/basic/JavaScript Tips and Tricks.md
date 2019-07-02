### Run the Code
- Console at Chrome DevTools

### IDE
- [Atom Editor](https://lifelongprogrammer.blogspot.com/2017/10/awesome-tips-about-atom-editor.html){target="blank"} with [packages](https://lifelongprogrammer.blogspot.com/2019/03/must-have-atom-editor-packages.html){target="blank"}
  - [atom-runner: run javascript, python, go, bash etc directly in atom](https://atom.io/packages/atom-runner)
  - [atom-ternjs: JavaScript code intelligence](https://atom.io/packages/atom-ternjs)

### Data Structures
```javascript
var myMap = new Map();
var array = new Array();
```

### Check undefined
- [How to set defaults values](https://www.codereadability.com/javascript-default-parameters-with-or-operator/)
```javascript
if (typeof variableA === "undefined") { variableA = defaultValue}
if(typeof variableA !== "undefined") {}
```

#### [JavaScript Window Location](https://www.w3schools.com/js/js_window_location.asp){target="blank"}
- window.location.href/pathname/hostname
- window.location.assign loads a new document
- [Set location.pathname and location.search together?](https://stackoverflow.com/questions/33938178/set-location-pathname-and-location-search-together)
  - Just set the location (or location.href): `location = "/abc?name=test";`{.javascript}
- [Get last part of URI](https://stackoverflow.com/questions/16237780/get-last-part-of-uri/16237825)
  - `var action = window.location.pathname.split("/").slice(-1)[0];`{.javascript}

```JavaScript
var urlParams = new URLSearchParams(window.location.search);
urlParams.get('page')
```

### iframe
- [Access a variable of iframe from parent](https://stackoverflow.com/questions/13757943/access-a-variable-of-iframe-from-parent){target="blank"}
  - `var variableA = document.getElementById("iframeid").contentWindow.variableA;`{.javascript}
- Remove iframe
  ```javascript
  var iframeA = document.getElementById("iframeA");
  iframeA.parentNode.removeChild(iframeA);
  ```

#### CDATA in script tag
- when the doc is parsed as xml: like in blogspot editor.
```javascript
<script type="text/javascript">
//<![CDATA[
  code_here
//]]>
</script>
```

#### createElement
##### [Create a TextNode and add new line](https://stackoverflow.com/questions/8147376/how-to-insert-a-javascript-textnode-element-on-a-newline)
```js
var textNode = document.createTextNode("Node on line 1");
element.appendChild(textNode);

var linebreak = document.createElement('br');
element.appendChild(linebreak);
```

##### [document.createElement("script")](https://unixpapa.com/js/dyna.html)
```javascript
var head= document.getElementsByTagName('head')[0];
var script= document.createElement('script');
script.type= 'text/javascript';
script.src= 'helper.js';
head.appendChild(script);
```

#### document.write
- [write new line](https://www.sitepoint.com/community/t/new-line-in-document-write/1704)
  ```javascript
  document.write('line1' ,'<br />' ,'line2');
  ```
- [write script src tag](https://stackoverflow.com/questions/17542595/how-to-include-a-script-with-document-write)
  ```javascript
  document.write('<script type="text/javascript" src="..."><\/script>');
  ```
- [How to display document.write in a specific div with specific id?](https://stackoverflow.com/questions/29130271/how-to-display-document-write-in-a-specific-div-with-specific-id)
  ```javascript
  document.getElementById('id').innerHTML = "something";
  ```

### [JavaScript that executes after page load](https://stackoverflow.com/questions/807878/javascript-that-executes-after-page-load)
- `document.addEventListener("DOMContentLoaded", function(){});`{.js}
- `window.addEventListener("load", function(){});`{.js}

### [Create/Read/Delete Cookie](https://www.tutorialrepublic.com/javascript-tutorial/javascript-cookies.php)

### Timer
```javascript
setTimeout(function(){window.location.pathname='/p/archives.html' }, 5000);
```

### Misc
- [query string of url](https://davidwalsh.name/query-string-javascript)
```javascript
window.location.search
var urlParams = new URLSearchParams(window.location.search);
```

<!-- == is a loose or abstract equality comparison
=== is a strict equality comparison -->

