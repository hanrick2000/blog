---

### [Series: Awesome Tips about Markdown](/search/label/Markdown_Series){target="blank"}
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

#### [Backslash Escape](https://golem.ph.utexas.edu/~distler/maruku/markdown_syntax.html#autoescape)
```markdown
[\@com.carrotsearch.randomizedtesting.annotations.Repeat(iterations = 5)]
(https://github.com/randomizedtesting/randomizedtesting/wiki)
```

#### [Automatic links](https://daringfireball.net/projects/markdown/syntax#autolink)
bad word
- Link without text
```markdown
<http://example.com/>
<address@example.com>
```

#### [Table without header](https://stackoverflow.com/questions/17536216/create-table-without-header-in-markdown/39322697)
```markdown
| | |
|-|-|
Normal Key|Value1øøøøø
```

#### [Nested list](https://stackoverflow.com/questions/37575916/how-to-markdown-nested-list-items-in-bitbucket)
```markdown
- Item 1
    - Item 1a
```

#### [automatically numbered list](https://stackoverflow.com/questions/12145232/create-an-automatically-numbered-list)
```markdown
1. test 1
1. test 2
```

##### [Task(Check) List](https://blog.github.com/2014-04-28-task-lists-in-all-markdown-documents/)
```markdown
- [] item incomplete
- [x] item done
```

#### [Line breaks in markdown]()
```markdown
<br/>
\
<!-- Two or more spaces at the end of the line -->
  (<-- two spaces)
```

#### Named anchor
- we can use html in markdown
```html
<a name="mac-mail"></a>
```
- Reference the anchor
```markdown
[Mail's Shortcuts](/2018/05/keyboard-shortcuts-for-developers.html#mac-mail)
```

#### Images
```markdown
![alt text](https://github.com/adam-p/markdown-here/raw/master/src/common/images/icon48.png "Logo Title Text 1")
<img src='https://github.com/adam-p/markdown-here/raw/master/src/common/images/icon48.png' alt='alt text' />
```

#### [Supported Languages](http://www.rubycoloredglasses.com/2013/04/languages-supported-by-github-flavored-markdown/)
- markdown, java, json,html, javascript, shell, yaml, xml etc

#### [Write email with markdown](https://markdown-here.com/)
- [Markdown Here](https://chrome.google.com/webstore/detail/markdown-here/elifhakcjgalahccnjkneoccemfahfoa/related)

#### [Open link in a new window](https://stackoverflow.com/a/50499778/753352)
  - ex: [How to Improve Problem Solving Skills: the Developer Guide](https://lifelongprogrammer.blogspot.com/2019/06/how-to-improve-problem-solving-skills-developer-guide.html){target="blank"}
  - use "blank" instead of `_blank` due to the bug at atom: [Wrong syntax highlighting when one line contains a single `*` or `_` ](https://github.com/atom/language-gfm/issues/44)
```md
[How to Improve Problem Solving Skills: the Developer Guide](https://lifelongprogrammer.blogspot.com/2019/06/how-to-improve-problem-solving-skills-developer-guide.html){target="blank"}
```

#### [Share markdown with socrates](http://socrates.io/)
- <http://socrates.io/>

#### [stackedit](https://stackedit.io/app#)
- Functions: export as html, save to google drive, blogger, github, dropbox etc
- alternatives: <https://dillinger.io/>

### [Writing in Atom with Markdown](/2019/03/must-have-atom-editor-packages.html){target="blank"}
- Check [here](/2019/03/must-have-atom-editor-packages.html){target="blank"} for [must-have atom editor packages](/2019/03/must-have-atom-editor-packages.html){target="blank"}
- [Writing Blog with Markdown, Atom Editor, Pandoc and Github](/2019/06/writing-blog-with-markdown-atom-editor-pandoc-and-github.html){target="blank"}
- [building presentations with reveal.js, markdown and github pages](/2019/03/building-presentations-with-reveal-js-markdown-and-github-pages.html){target="blank"}

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

#### Collapsible Markdown?
<details><summary>CLICK ME</summary>
hidden by default
</details>

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

<!-- #### Pandoc Markdown Syntax
```

``` -->

#### Tips
##### Markdown for Email
- Use Markdown to write email. 
  - Write Markdown directly in Chrome by using [Markdown Here](https://chrome.google.com/webstore/detail/markdown-here/elifhakcjgalahccnjkneoccemfahfoa)

- Use Markdown Preview to read long email (that roughly )
- Not used syntax: self anchor link, summary, detail.

#### Misc
- [Use Wordpress Markdown Editor](https://en.support.wordpress.com/wordpress-editor/blocks/markdown-block/#writing-with-markdown)

---
#### [Related Posts](/search?q=label:Markdown|label:"Atom Editor")
<script src="/feeds/posts/default/-/Atom Editor?orderby=updated&amp;alt=json-in-script&amp;callback=weightedRandomRelatedPosts&amp;max-results=20"></script>
<script src="/feeds/posts/default/-/Markdown?orderby=updated&amp;alt=json-in-script&amp;callback=weightedRandomRelatedPosts&amp;max-results=20"></script>
<script src="/feeds/posts/default/-/Dev Tips?orderby=updated&amp;alt=json-in-script&amp;callback=weightedRandomRelatedPosts&amp;max-results=20"></script>
