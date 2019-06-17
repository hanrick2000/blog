---

### [Series: Awesome Tips about Markdown](https://lifelongprogrammer.blogspot.com/search/label/Markdown_Series){target="blank"}
<script src="/feeds/posts/default/-/Markdown_Series?orderby=updated&amp;alt=json-in-script&amp;callback=series&amp;max-results=20"></script>

---

<!-- SD:
Frequently used markdown syntax.
-->

### Syntax
- Strikethrough: `~~your text~~`
  - ~~your text~~
- Inline code: surround your text with backtick symbols **\`**
  - `you code`

#### Links
- Inline Link
- Reference links
- [Automatic links](https://daringfireball.net/projects/markdown/syntax#autolink)
  - Link without text
```markdown
[an inline-style link](http://lifelongprogrammer.blogspot.com)
[a reference-style link][lifelongprogrammer]
[lifelongprogrammer]

[lifelongprogrammer]: http://lifelongprogrammer.blogspot.com

<http://example.com/>
<address@example.com>
```
#### Named anchor
- [Pandoc: https://pandoc.org/MANUAL.html#heading-identifiers](https://pandoc.org/MANUAL.html#heading-identifiers)
  - `{#identifier .class .class key=value key=value}`
  - This approach is easier to use.
- we can use html in markdown
```html
<a name="mac-mail"></a>
```
- Reference the anchor
```markdown
[Mail's Shortcuts](https://lifelongprogrammer.blogspot.com/2018/05/keyboard-shortcuts-for-developers.html#mac-mail)
```

#### Images
- A link immediately preceded by a ! will be treated as an image.
- [Prefer ![]\(\) over img tag](https://tex.stackexchange.com/questions/253262/pandoc-markdown-to-pdf-doesnt-show-images)
  - The raw HTML is passed through unchanged in HTML, S5, Slidy, Slideous, DZSlides, EPUB, Markdown, and Textile output, and suppressed in other formats.
- [Center image](https://gist.github.com/DavidWells/7d2e0e1bc78f4ac59a123ddf8b74932d)
  1. html: p align
  ```markdown
  <p align="center">
    <img src="https://media.giphy.com/media/e1BxgoFxAOmbK/giphy.gif" alt="Wonder Woman Happy Dance"/>
  </p>
  ```
  <p align="center">
    <img src="https://media.giphy.com/media/e1BxgoFxAOmbK/giphy.gif" alt="Wonder Woman Happy Dance"/>
  </p>
  2. center css
  ```markdown
  <style>
  .center {
    display: block;
    margin-left: auto;
    margin-right: auto;
  }
  </style>
  ![](https://media.giphy.com/media/l0Iy8OYsxXo4PlCIU/giphy.gif){.center}
  ```
<style>
.center {
  display: block;
  margin-left: auto;
  margin-right: auto;
}
</style>
  ![](https://media.giphy.com/media/l0Iy8OYsxXo4PlCIU/giphy.gif){.center}
- [side by side images](https://stackoverflow.com/questions/24319505/how-can-one-display-images-side-by-side-in-a-github-readme-md)
```markdown
![alt text](the_image "Logo Title Text 1")

<!-- Side by Side Images -->
Header Left |  Header Right
:--------:|:-------:
![](image_link)  |  ![](image_link)
```
- Change image destination
  - wrap the image in another link

```markdown
[![Build Status](https://travis-ci.org/philc/vimium.svg?branch=master)]
(https://travis-ci.org/philc/vimium)
```
[![Build Status](https://travis-ci.org/philc/vimium.svg?branch=master)](https://travis-ci.org/philc/vimium)

#### [Table without header](https://stackoverflow.com/questions/17536216/create-table-without-header-in-markdown/39322697)
- pipe_tables
```markdown
| | |
|-|-|
Normal Key|Value1øøøøø
```

#### Alignment Table Columns
- [align text in the columns to the left, right, or center by adding a colon (:) to the left, right, or on both side of the hyphens within the header row](https://www.markdownguide.org/extended-syntax/)
```markdown
| Left Align |   Center   | Right Align |
|:---------- |:----------:| -----------:|
| Left Align | Center `|` | Right Align |
```

#### Formatting Text in Tables
- We can use markdown syntax for link, inline code block, bold, emphasis etc in table content.

##### Misc
- Escape the pipe **|** using inline code block `|`


#### List
- by default, it creates a compact list.
- put spaces or comments between the items to create a loose list
- subsequent paragraphs and code block must be indented.
- [Nested list](https://stackoverflow.com/questions/37575916/how-to-markdown-nested-list-items-in-bitbucket)
```markdown
- Item 1
    - Item 1a
```

##### [automatically numbered list](https://stackoverflow.com/questions/12145232/create-an-automatically-numbered-list)
```markdown
1. test 1
1. test 2
```

##### [Checklist or task list](https://blog.github.com/2014-04-28-task-lists-in-all-markdown-documents/)
```markdown
- [] item incomplete
- [x] item done
```
- [] item incomplete
- [x] item done

##### Definition Lists
- Markdown's syntax for [HTML Definition Lists](https://www.w3schools.com/tags/tag_dd.asp): dl, dt
```markdown
The Term
: This is the definition of the the term.
```
The Term
: This is the definition of the the term.


#### Special Characters
- @
  - `[@TODO title](link)` this will not work, we need either escape the @ or remove it

```markdown
\  backslash
`  backtick
*  asterisk
_  underscore
{} curly braces
[] square brackets
() parentheses
#  hash mark
>  greater than
+  plus sign
-  minus sign (hyphen)
.  dot
!  exclamation mark
```

#### [Backslash Escape](https://golem.ph.utexas.edu/~distler/maruku/markdown_syntax.html#autoescape)
```markdown
[\@com.carrotsearch.randomizedtesting.annotations.Repeat(iterations = 5)]
(https://github.com/randomizedtesting/randomizedtesting/wiki)
```

#### Line breaks in markdown
```markdown
<br/>
\
<!-- Two or more spaces at the end of the line -->
  (<-- two spaces)
```

#### [Supported Languages](http://www.rubycoloredglasses.com/2013/04/languages-supported-by-github-flavored-markdown/)
- markdown, java, json,html, javascript, shell, yaml, xml etc

#### [Footnotes](https://www.markdownguide.org/extended-syntax/#footnotes)
- [Inline Notes](https://pandoc.org/MANUAL.html#extension-inline_notes)

```md
Here's a simple footnote,[^1] and here's a longer one.[^bignote]

Here is an inline note.^[Inlines notes...]
[^1]: This is the first footnote.
[^bignote]: Here's one with multiple paragraphs and code.
```

#### [Open link in a new window](https://stackoverflow.com/a/50499778/753352)
  - ex: [How to Improve Problem Solving Skills: the Developer Guide](https://lifelongprogrammer.blogspot.com/2019/06/how-to-improve-problem-solving-skills-developer-guide.html){target="blank"}
  - use "blank" instead of `_blank` due to the bug at atom: [Wrong syntax highlighting when one line contains a single `*` or `_` ](https://github.com/atom/language-gfm/issues/44)
```md
[How to Improve Problem Solving Skills: the Developer Guide](https://lifelongprogrammer.blogspot.com/2019/06/how-to-improve-problem-solving-skills-developer-guide.html){target="blank"}
```

#### Emoji
- Check [emoji-cheat-sheet](http://emoji-cheat-sheet.com/) for a full list of available emoji.
- [`-f markdown+emoji` when use Pandoc](https://pandoc.org/MANUAL.html#extension-emoji)
```markdown
:cat:  :smile: :bear:
```
:cat:  :smile: :bear:

#### Collapsible Markdown?
```markdown
<details><summary>CLICK ME</summary>
hidden by default
</details>
```
<details><summary>CLICK ME</summary>
hidden by default
</details>

---

#### [Add CSS Style to Markdown](https://lifelongprogrammer.blogspot.com/2019/01/best-way-to-style-markdown-with-pandoc.html)

---

#### Basic Syntax
```text
Header 1
========

Header 2
--------

~~crossed out~~
_italic_
__bold__
_You **can** combine them_

# kbd tag
<kbd>Ctrl</kbd>

> This is a blockquote
// horizontal rule tag (<hr />)
---
// Code span - use `and`
Type `echo 'Hello World'`
```

#### [Pandoc Markdown Syntax](https://lifelongprogrammer.blogspot.com/2019/01/awesome-tips-about-pandoc.html){target="blank"}
- Check here for [more awesome tips about Pandoc](https://lifelongprogrammer.blogspot.com/2019/01/awesome-tips-about-pandoc.html)
- fenced_code_attributes
```text
~~~~ {#mycode .haskell .numberLines startFrom="100"}

```
- line_blocks: beginning with a vertical bar (|) followed by a space
  - useful for verse, addresses, resume
- pandoc_title_block
- yaml_metadata_block
  - when use `---` as line break, better put a new line after it, otherwise it may be confused with yaml_metadata_block
- attributes
  - inline_code_attributes
  - `{.smallcaps}`
  - raw_attribute: `{=html}`
- tex_math_dollars

#### Advanced Markdown Syntax
```markdown
### My Great Heading {#custom-id}
[Heading IDs](#heading-ids)
```

### [Slides Syntax](https://opensource.com/article/18/5/markdown-slide-generators)
- [Pandoc Syntax](https://pandoc.org/MANUAL.html#producing-slide-shows-with-pandoc)

<!-- #### pandoc
- brew install pandoc
- Add **eval "$(pandoc --bash-completion)"** to ${HOME}/.bash_profile
- generate pdf: -o output.df
    - install this first: brew cask install mactex
- generate ppt: -o output.pptx
- pandoc --list-extensions
- pandoc --list-output-formats

#### [remark](https://github.com/gnab/remark)
- in-browser, markdown-driven slideshow tool -->

#### Gotcha
- Space matters:
    - for link, no space between [] and (), for header, need space between ### and the words
    - check the colors in atom
- Empty line matters
    - when not sure, add empty line
- It doesn't wrap in code block

#### Tips
- Add html(javascript, css) directly in Markdown.
- Embed tweet, facebook, youtube videos by directly copying the embed html code.

<!-- #### [Write email with markdown](https://markdown-here.com/)
- [Markdown Here](https://chrome.google.com/webstore/detail/markdown-here/elifhakcjgalahccnjkneoccemfahfoa/related) -->


### [Writing in Atom with Markdown](https://lifelongprogrammer.blogspot.com/2019/03/must-have-atom-editor-packages.html){target="blank"}
- Check [here](https://lifelongprogrammer.blogspot.com/2019/03/must-have-atom-editor-packages.html){target="blank"} for [must-have atom editor packages](https://lifelongprogrammer.blogspot.com/2019/03/must-have-atom-editor-packages.html){target="blank"}
- [Writing Blog with Markdown, Atom Editor, Pandoc and Github](https://lifelongprogrammer.blogspot.com/2019/06/writing-blog-with-markdown-atom-editor-pandoc-and-github.html){target="blank"}
- [building presentations with reveal.js, markdown and github pages](https://lifelongprogrammer.blogspot.com/2019/03/building-presentations-with-reveal-js-markdown-and-github-pages.html){target="blank"}

#### Markdown and Mind Map
- [MarkRemap](http://www.markremap.com/)
- [Atom Markdown Mindmap](https://atom.io/packages/markdown-mindmap)

#### Other Markdown Tools
- Online markdown editor: [StackEdit](https://StackEdit.io/app#)
  - Functions: export as html, save to google drive, blogger, github, dropbox etc
  - alternatives: <https://dillinger.io/>
- [Share markdown with socrates](http://socrates.io/)
- Mac Apps:
  - [Atom Editor](https://lifelongprogrammer.blogspot.com/2017/10/awesome-tips-about-atom-editor.html){target="blank"}
  - [Typora](https://typora.io)
- Visual Studio Code with Markdown Preview Enhanced
- [Use Wordpress Markdown Editor](https://en.support.wordpress.com/wordpress-editor/blocks/markdown-block/#writing-with-markdown)
- Write posts in Markdown and post there in [dev.to](https://dev.to)
  - Add Canonical URL to refer to your original post.

##### Markdown for Email
- Use Markdown to write email.
  - Write Markdown directly in Chrome by using [Markdown Here](https://chrome.google.com/webstore/detail/markdown-here/elifhakcjgalahccnjkneoccemfahfoa)
- Use Markdown Preview to read long email (that roughly )
- Not used syntax: self anchor link, summary, detail.


#### Troubleshooting
- When the output is not same as expected, start from the first place and fix it.
- Usually we can fix it by add new line, or put the text in \`the_text\`.
- check broken headers by searching `##` or \`\`\`

#### More Elements to Use
- quote >
- [It will start a new list each time a different type of list marker is used](https://pandoc.org/MANUAL.html#ordered-lists)




---
#### [Related Posts](https://lifelongprogrammer.blogspot.com/search?q=label:Markdown|label:"Atom Editor")
<script src="/feeds/posts/default/-/Atom Editor?orderby=updated&amp;alt=json-in-script&amp;callback=weightedRandomRelatedPosts&amp;max-results=20"></script>
<script src="/feeds/posts/default/-/Markdown?orderby=updated&amp;alt=json-in-script&amp;callback=weightedRandomRelatedPosts&amp;max-results=20"></script>
<script src="/feeds/posts/default/-/Dev Tips?orderby=updated&amp;alt=json-in-script&amp;callback=weightedRandomRelatedPosts&amp;max-results=20"></script>
