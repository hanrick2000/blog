---
baseurl: https://lifelongprogrammer.blogspot.com/2019/07/how-to-show-post-excerpts-on-blogger-when-writing-with-markdown-pandoc-and-minify.html
---

##### [Awesome Tips Series about Blogger](https://lifelongprogrammer.blogspot.com/search/label/Blogger_Series){target="blank"}
<details><summary>CLICK ME to EXPAND</summary>
<script src="/feeds/posts/default/-/Blogger_Series?orderby=updated&amp;alt=json-in-script&amp;callback=series&amp;max-results=20"></script>
</details>
---

#### The Problem
I want to show partial posts in homepage, label page, search page or index pages.

I write posts with [Markdown](https://lifelongprogrammer.blogspot.com/2018/05/awesome-tips-about-markdown.html){target="blank"} using [Atom Editor], then use [Pandoc](https://lifelongprogrammer.blogspot.com/2019/01/awesome-tips-about-pandoc.html){target="blank"} to convert it to HTML, then use [minify] to remove commented draft content and minified the html and CSS to reduce the html size.

#### [How to Add a Read More Link in Blogger](https://support.google.com/blogger/answer/154172?hl=en&visit_id=636976000454748450-3484624752&rd=1)

We can do this by add **insert jump break** button in Blogger:\
![](https://lh3.googleusercontent.com/C4s6ErlSQwAhFQni2n9mimN8zHv7GKQulU-RL6ACSkUQMZ4T_z9rXgpzg-eQCIbO7v-EMnEoVwY63Clj-ZYwDlrNWAtyCSGf7BO7PKuzkL9hPafRJ1etQo4JYnrUlngAOkX52CSrcQ=w2400)

It's equivalent to add `<!--more-->` in the html code in the Markdown file.

#### How to Keep the Jump Break(Read More) block in Minify
By default [minify] removes all comments, so it will also remove the `<!--more-->`.

Luckily, we can use [minify]'s [--html-keep-conditional-comments](https://github.com/tdewolff/minify/blob/master/cmd/minify/README.md#usage) feature to keep the `<!--more-->`.

We can create the following [conditional comments](https://ourcodeworld.com/articles/read/139/all-you-need-to-know-about-conditional-html-comments) that will actually exist in all browser:(if browser's type is not XYZ) \
```markdown
<!--[if !XYZ]><!--more-->
<!--<![endif]-->
```

##### Bonus: Add a Snippet in Atom Editor
<details><summary>CLICK ME to EXPAND</summary>
To add this easily in [Atom Editor], we can define the following snippet by **Applications: Open Your Snippets** in the command palette (cmd+shift+p):
```cson
'read more':
  'prefix': 'l_read_more'
  'body': '<!--[if !XYZ]><!--more--><!--<![endif]-->'
```
</details>
---

#### Add Read More Block Automatically After TOC
It's a good place to add **Read More** after TOC(table of contents).

We can use `pandoc --toc  --toc-depth=4`{.bash} to generate TOC for all h1, h2, h3 and h4 headers.\
We can add `toc:true(false)` in the Markdown [yaml-meta-block](https://pandoc.org/MANUAL.html#metadata-variables) to control whether add TOC or not.
```
---
toc: true
---
```

To make it Pandoc automatically **Read More** after TOC, we can generate our own template based on default template: `pandoc -D html >$HOME/.pandoc/templates/default.html`{.bash}.\
Then update default.html to change the **if(toc)** block like below:

```html
$if(toc)$
<nav id="$idprefix$TOC" role="doc-toc">
<h4>Table of Contents</h4>
$table-of-contents$
</nav>
<!--[if !XYZ]><!--more-->
<!--<![endif]-->
$endif$
```

#### Add Base Tag in Pandoc Template
Last but not least, there is one problem in the generate TOC, it uses relative url: `<a href=#the_anchor_id>the_text</a>`, but it will not work when it shows in  label page, search page etc, as the base url is (for example <https://lifelongprogrammer.blogspot.com/2019/07>), not the url of the post.

Simply adding the base tag in the Markdown file: `<base href = "the_post_url" />`{.html} would not work, as TOC is generated first, the then body content.

Luckily we can change Pandoc template to add base tag before TOC:
```html
$if(baseurl)$
<base href="$baseurl$" />
$endif$
$if(toc)$
<nav id="$idprefix$TOC" role="doc-toc">
<h4>Table of Contents</h4>
$table-of-contents$
</nav>
<!--[if !XYZ]><!--more-->
<!--<![endif]-->
$endif$
```
- If **baseurl** variable exists, create a base tag with **href="$baseurl$"**
- We add the baseurl tag in the yaml meta block in the Markdown file.
---
baseurl: the_url
---

#### Bonus: [Blogger Conditional Tags for different page types](https://ultimatebloggerguide.blogspot.com/2016/07/blogger-conditional-tags-for-page-types.html)
```html
<b:if cond='data:blog.pageType == "item"'>
</b:if>
```

[minify]: https://github.com/tdewolff/minify
[Atom Editor]: https://lifelongprogrammer.blogspot.com/2017/10/awesome-tips-about-atom-editor.html