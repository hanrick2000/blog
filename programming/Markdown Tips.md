<!-- http://lifelongprogrammer.blogspot.com/2018/05/markdown-tips.html -->
#### [Automatic links](https://daringfireball.net/projects/markdown/syntax#autolink)

- Link without text
```markdown
<http://example.com/>
<address@example.com>
```

#### [Table without header](https://stackoverflow.com/questions/17536216/create-table-without-header-in-markdown/39322697)
```markdown
| | |
|-|-|
Normal Key|Value1
```

#### [Nested list](https://stackoverflow.com/questions/37575916/how-to-markdown-nested-list-items-in-bitbucket)
```markdown
- Item 1
    - Item 1a
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
[Mail's Shortcuts](http://lifelongprogrammer.blogspot.com/2018/05/keyboard-shortcuts.html#mac-mail)
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

#### Blogger with markdown
- Why: Focus on the content, easy to store/edit the content locally

##### 1: Use "Copy Html" function from markdown-preview-plus
- Then paste output
```
<div dir="ltr" style="text-align: left;" trbidi="on">
<div style="font-size: large;">
     _copy_html_output_from_markdown-preview-plus_
</div></div>
```
##### 2: Use pandoc
```bash
pandoc -f markdown -t html5 -c style.css -s --highlight-style espresso \
-o the_output.html "${md}"
# rmheadbody.sh removes the not-needed head, body tags
pandoc -f markdown -t html5 -c style.css -s --highlight-style espresso "${md}" \
| bash ~/scripts/rmheadbody.sh | pbcopy
```
- then remove no needed head, body tags

#### Atom Plugins
- [markdown-preview-enhanced](https://atom.io/packages/markdown-preview-enhanced/)
  - Ctrl+Shift+M: toggle preview
  - Support Code chunk, presentation
  - [Presentation](https://shd101wyy.github.io/markdown-preview-enhanced/#/presentation)
  - [Diagrams](https://shd101wyy.github.io/markdown-preview-enhanced/#/diagrams)
    - Support PlantUML, mermaid, flow charts, sequence diagrams
```markdown
<!-- slide -->
```
- [markdown-preview-plus](https://atom.io/packages/markdown-preview-plus)

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