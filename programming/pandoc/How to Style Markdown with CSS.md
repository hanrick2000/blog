<!-- SD:
How to make come text red, add custom css style to elements in Markdown.
-->

#### [Series: Awesome Tips about Pandoc and Markdown](https://lifelongprogrammer.blogspot.com/search?q=label:Pandoc_Series|label:Markdown_Series){target="blank"}
<script src='/feeds/posts/default?q=label:Pandoc_Series|label:Markdown_Series&orderby=updated&alt=json-in-script&callback=series&max-results=20'></script>
---

#### The Problem
- How can we make come text red in Markdown?
- How Can we add custom CSS style to elements in Markdown?
- The default CSS has no border, how can we add border to table?

#### Defining the CSS
We can define the following CSS in markdown itself, or for example add it into template in Blogger.
```html
<style>
.red {color: red}
</style>
```

#### Embedding HTML Code
We can use any valid HTML code directly in Markdown.
```html
<p class="red">red text</p>
```
>>> <p class="red">red text</p>

One of the reason to choose Markdown for writing is to focus on the content, not format.

The drawback of this approach is too much html code: prefix, suffix, attributes etc.


In Pandoc, we can easily use attributes to add CSS style to headers, fenced code, div, inline code, bracketed spans, link etc.

#### [Heading Identifiers](https://pandoc.org/MANUAL.html#heading-identifiers)
```markdown
###### Red text title {#identifier .red}
```
>>> ###### Red text title {#identifier .red}

#### [Fenced Code Attributes](https://pandoc.org/MANUAL.html#extension-fenced_code_attributes)
    ```{.red .numberLines startFrom="1"}
    Here is a paragraph.

    And another.
    ```


```{.red .numberLines startFrom="1"}
Here is a paragraph.

And another.
```

#### [Divs and Spans](https://pandoc.org/MANUAL.html#divs-and-spans)
```markdown
::::: {#special .red}
Here is a paragraph.

And another.
:::::
```
::::: {#special .red}
Here is a paragraph.

And another.
:::::

#### [Inline Code Attributes](https://pandoc.org/MANUAL.html#extension-inline_code_attributes)
```markdown
`red text`{.red}
```
>>> `red text`{.red}

#### [Bracketed Spans](https://pandoc.org/MANUAL.html#extension-bracketed_spans)
```markdown
[This is *some red text*]{.red}
```
>>> [This is *some red text*]{.red}

#### [Link Attributes](https://pandoc.org/MANUAL.html#extension-link_attributes)
- We can css class, width, height
```markdown
<style>
.center {
  display: block;
  margin-left: auto;
  margin-right: auto;
}
</style>
![DNCE’s Waving Pug](https://media.giphy.com/media/3oKIPsx2VAYAgEHC12/giphy.gif){.center}
```

<style>
.center {
display: block;
margin-left: auto;
margin-right: auto;
}
</style>
![DNCE’s Waving Pug](https://media.giphy.com/media/3oKIPsx2VAYAgEHC12/giphy.gif){.center}

#### Custom CSS for Markdown
##### [Blockquotes CSS](https://css-tricks.com/examples/Blockquotes/)
- [alt](https://css-tricks.com/snippets/css/simple-and-nice-blockquote-styling/)
```css
blockquote {
 margin: 0;
 border-left: 3px solid #ccc;
}
blockquote p {
 padding: 15px;
 background: #eee;
 border-radius: 5px;
}
/* blockquote p::before {content: '\201C';}
blockquote p::after {content: '\201D';} */
```

##### [Table CSS](https://www.w3schools.com/css/css_table.asp)
- Pandoc's default CSS has no border, we can add the following CSS to add border.
```css
.post-body table {
  border-collapse: collapse;
}
.post-body table, th, td {
  border: 1px solid black;
}
```

#### [Themes](https://github.com/jgm/pandoc/wiki/User-contributed-templates#html){target="blank"}
- We can also add our own css or change the existing one.
- We can edit blogger's theme and add the css there so the theme applies to all posts.
- [Create truly standalone html files](https://devilgate.org/blog/2012/07/02/tip-using-pandoc-to-create-truly-standalone-html-files/)
  - -H fullpath_pandoc.css or --include-in-header=FILE
- Themes to use
  - [pandoc.css](https://pandoc.org/demo/pandoc.css)