<!-- http://lifelongprogrammer.blogspot.com/2018/05/markdown-tips.html -->
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
[Mail's Shortcuts](http://lifelongprogrammer.blogspot.com/2018/05/keyboard-shortcuts-for-developers.html#mac-mail)
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

#### [Share markdown with socrates](http://socrates.io/)
- <http://socrates.io/>

#### [stackedit](https://stackedit.io/app#)
- Functions: export as html, save to google drive, blogger, github, dropbox etc
- alternatives: <https://dillinger.io/>

### Blogger with markdown
- Focus on the content, easy to store/edit the content locally
- Easy to hide(Cmd+/) text, draft, or the text/explanation for you.

#### 1: Use "Copy Html" function from markdown-preview-plus
- Then paste output
```
<div dir="ltr" style="text-align: left;" trbidi="on">
<div style="font-size: large;">
     _copy_html_output_from_markdown-preview-plus_
</div></div>
```
#### 2: Use pandoc
```bash
pandoc -f markdown -t html5 -c style.css -s --highlight-style espresso \
-o the_output.html "${md}"
# rmheadbody.sh removes the not-needed head, body tags
pandoc -f markdown -t html5 -c style.css -s --highlight-style espresso "${md}" \
| bash ~/scripts/rmheadbody.sh | pbcopy
```
- then remove no needed head, body tags

### Atom Plugins
- [Document Outline](https://atom.io/packages/document-outline)
  - Only uses h4 or above for markdown
- [Markdown Writer](https://atom.io/packages/markdown-writer)
- [Markdown Table Editor](https://atom.io/packages/markdown-table-editor)
  - Hit tab to move to the next cell
- [markdown-preview-enhanced](https://github.com/shd101wyy/markdown-preview-enhanced)
  - Ctrl+Shift+M: toggle preview
  - Support Code chunk, [Presentation](https://shd101wyy.github.io/markdown-preview-enhanced/#/presentation)
  - [Diagrams](https://shd101wyy.github.io/markdown-preview-enhanced/#/diagrams)
    - Support PlantUML, mermaid, flow charts, sequence diagrams
- [markdown-preview-plus](https://atom.io/packages/markdown-preview-plus)
  - Ctrl+Shift+M: toggle preview
  - Copy html: convert markdown to html and copy the output to clipboard
  - Enable "Preview Position Synchronization behavior"
  - support pandoc syntax
- [atom-csv-markdown](https://atom.io/packages/atom-csv-markdown)

```markdown
<!-- slide -->
```

### [Slides Syntax](https://opensource.com/article/18/5/markdown-slide-generators)
- [Pandoc Syntax](https://pandoc.org/MANUAL.html#producing-slide-shows-with-pandoc)

#### pandoc
- brew install pandoc
- Add **eval "$(pandoc --bash-completion)"** to ${HOME}/.bash_profile
- generate pdf: -o output.df
    - install this first: brew cask install mactex
- generate ppt: -o output.pptx
- pandoc --list-extensions
- pandoc --list-output-formats

#### [remark](https://github.com/gnab/remark)
- in-browser, markdown-driven slideshow tool

#### Gotcha
- Space matters:
    - for link, no space between [] and (), for header, need space between ### and the words
    - check the colors in atom
- Empty line matters
    - when not sure, add empty line
- It doesn't wrap in code block

#### collapsible markdown?
<details><summary>CLICK ME</summary>
hidden by default
</details>

#### Basic Syntax
```markdown
Header 1
========

Header 2
--------

~~crossed out~~
_italic_
__bold__
_You **can** combine them_

> This is a blockquote
// horizontal rule tag (<hr />) 
---
// Code span - use `and`
Type `echo 'Hello World'`
```
