---
pagetitle: How to effectively use Pandoc
date: 6/7/2019
description: How to use Pandoc to convert files, Pandoc's Markdown syntax and more tips.
---

##### [Series: Awesome Tips about Pandoc](/search/label/Pandoc_Series){target="blank"}
<script src="/feeds/posts/default/-/Pandoc_Series?orderby=updated&amp;alt=json-in-script&amp;callback=series&amp;max-results=20"></script>


### [What Pandoc can Do?](https://pandoc.org/)
- convert files from one format into another: markdown to html/pdf/word/ppt, vice verse and many other types.

### Pandoc
- `brew install pandoc`{.bash}, `brew upgrade pandoc`{.bash}
- Add  bash-completion: `eval "$(pandoc --bash-completion)"`{.bash} to ${HOME}/.bash_profile
- Output: `-o output.df, -o output.pptx`
    <!-- - install this first: brew cask install mactex -->
- pandoc --list-extensions
- pandoc --list-output-formats
- Reading from the Web: `pandoc -f html -t markdown http://www.fsf.org`{.bash}
- [TOC generation](https://github.com/jgm/pandoc/wiki/Pandoc-Tricks#toc-generation):
  - `--toc`
  - `--toc-depth=NUMBER`
<!-- ### [remark](https://github.com/gnab/remark)
- in-browser, markdown-driven slideshow tool -->

<!-- ### Commands -->


<!-- ```text
geometry: "left=2cm,right=2cm,top=2cm,bottom=2cm"
``` -->

<!-- - we can only use beamer to generate pdf, not ppt -->

### Tips
- set language for the inline code
  - The source: `Redcarpet.new("Hello World!"){.ruby}`
  - The result: `Redcarpet.new("Hello World!")`{.ruby}

- [Syntax highlight: --highlight-style](https://www.garrickadenbuie.com/blog/pandoc-syntax-highlighting-examples/)
  - pandoc --list-highlight-languages
  - **breezedark**, **haddock**, pygments, tango, espresso, zenburn, kate, monochrome
  - **breezedark** is pretty good.

- Specify image size: we can use px or percentage.
  - `![](the_image_path){.class height=20px width=20px }`
  - ![](https://help.apple.com/assets/5C1032DB680CE2007DE76758/5C1032DD680CE2007DE76760/en_US/594456e7f5024afe01e5b4da627339f9.png){.class height=20px width=20}

- [side by side images](https://stackoverflow.com/questions/24319505/how-can-one-display-images-side-by-side-in-a-github-readme-md)
```markdown
![alt text](https://github.com/adam-p/markdown-here/raw/master/src/common/images/icon48.png "Logo Title Text 1")

<!-- Side by Side Images -->
Header Left |  Header Right
:--------:|:-------:
![](image_link)  |  ![](image_link)
```


### Pandoc Markdown Syntax
- fenced_code_attributes
  ```text
  ~~~~ {#mycode .haskell .numberLines startFrom="100"}
  ```
- line_blocks: beginning with a vertical bar (|) followed by a space
  - useful for verse, addresses, resume
- pandoc_title_block: title, author(s), date
  - pass metadata in pandoc command: `-M date="Updated at $(date "+%B %e, %Y")"`{.bash}
- yaml_metadata_block
  - when use `---` as line break, better put a new line after it, otherwise it may be confused with yaml_metadata_block
  ```markdown
    ---
    author: Jeffery Yuan
    title: "Awesome Tips about Pandoc"
    subtitle: How to effectively use Pandoc
    date: 6/7/2019
    description: Awesome Tips about how to effectively use Pandoc.
    ---
  ```
- attributes
  - Heading identifiers: `{#identifier .class .class key=value key=value}`
    - `Hi {#foo .bar .baz key=val}` is compiled to html `<h1 id="foo" class="bar baz" key="val">Hi</h1>`
  - `code with class {.class}` or `[Span with class]{.class}`
  - Use `{custom-style=class}` instead of `{.class}` to also work in word.
  - link_attributes
    - `![image](foo.jpg){#id .class width=30 height=20px}`
    - `[Hello, world!](http://example.com/){target="_blank"}`
      - use blank as `_` is special character in markdown
  - inline_code_attributes:  {.haskell}
  - `{.smallcaps}`
  - raw_attribute: `{=html}`
- tex_math_dollars
- Speaker notes
  ```md
  ::: notes
  :::
  ```
- [Need a blank line before a block quote](https://pandoc.org/MANUAL.html#block-quotations)
- Superscript: `mc^2^`{.markdown} mc^2^
- Subscript: `H~2~O`{.markdown} H~2~O

### EXTENSION
- +EXTENSION to the format name and disabled by adding -EXTENSION
  - `--from markdown_strict+footnotes`

<!-- ### [Slides Syntax](https://opensource.com/article/18/5/markdown-slide-generators)
- [Pandoc Syntax](https://pandoc.org/MANUAL.html#producing-slide-shows-with-pandoc) -->

### [Themes](https://github.com/jgm/pandoc/wiki/User-contributed-templates#html){target="blank"}
- We can also add our own css or change the existing one.
- We can edit blogger's theme and add the css there so the theme applies to all posts.
- [Create truly standalone html files](https://devilgate.org/blog/2012/07/02/tip-using-pandoc-to-create-truly-standalone-html-files/)
  - -H fullpath_pandoc.css or --include-in-header=FILE
- Themes to use
  - [pandoc.css](https://pandoc.org/demo/pandoc.css)

#### [Blockquotes CSS](https://css-tricks.com/examples/Blockquotes/)
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

#### [Table CSS](https://www.w3schools.com/css/css_table.asp)
```css
.post-body table {
  border-collapse: collapse;
}
.post-body table, th, td {
  border: 1px solid black;
}
```

#### How to have content in the top slide in 2D reveal.js slideshows {#conten_at_top_slide}
- in [pandoc 2.7](https://pandoc.org/releases.html#pandoc-2.7-3-march-2019)
  > Slide show formats behavior change: content under headers less than slide level is no longer ignored, but included in the title slide (for HTML slide shows) or in a slide after the title slide (for beamer). This change makes possible 2D reveal.js slideshows with content in the top slide on each stack (#4317, #5237).

  - Must also run pandoc with `--slide-level=2`


#### [Use Variables in Document Body Text](https://github.com/jgm/pandoc/issues/1950)
- We can use variables from command line or defined in metadata block.
```markdown
---
hello:
  english: world
  german: Welt
---
$updatedDate$

Hello $hello.english$.
```
- `pandoc -M updatedDate="Updated at $(date "+%B %e, %Y")" --template --template "${md}" "${md}" | pandoc -t html`{.bahs}


#### Template
- [How to add a "Table of Contents" title in the HTML template](https://github.com/jgm/pandoc/wiki/How-to-add-a-%22Table-of-Contents%22-title-in-the-HTML-template)
```
pandoc -D html >$HOME/.pandoc/templates/default.html
pandoc --template==$HOME/.pandoc/templates/default.html
```

#### Filters
- [pandoc-mustache](https://github.com/michaelstepner/pandoc-mustache) for variable substitution
- [pandoc-include](http://hackage.haskell.org/package/pandoc-include)
  - Install Xcode from Mac App Store (slow...)
  - Install [Haskell Tool Stack](https://docs.haskellstack.org/en/stable/README/)
  - stack update; stack install pandoc-include

<!-- pandoc --from markdown --to latex --filter pandoc-include input.md -->

#### Troubleshooting
- When the output is not same as expected, start from the first place and fix it.
- Usually we can fix it by add new line, or put the text in \`the_text\`.

### Resources
- <https://github.com/jgm/pandoc>
- <https://github.com/jgm/pandoc/wiki>
- <https://pandoc.org/MANUAL.html>

![](https://slides.yihui.name/gif/daaaad.gif)


<!-- <style>
  .anchor {
    display: none;
  }
  :hover > .anchor {
    display: inline;
  }   
</style>

<script type="text/javascript">
//<![CDATA[
  (function() {
    var links = document.getElementsByTagName('a');
    for (var i = 0; i < links.length; i++) {
      if (/^(https?:)?\/\//.test(links[i].getAttribute('href'))) {
        links[i].target = 'blank';
      }
    }
  })();

  (function() {
    var h, hs = document.querySelectorAll('h3');
    for (var i = 0; i < hs.length; i++) {
      h = hs[i];
      if (h.id === '') continue;
      h.innerHTML += ' <span class="anchor"><a href="#' + h.id +
        '">#</a></span>';
    }
  })();  
//]]>
</script> -->

<!-- https://stackoverflow.com/questions/38286488/pandoc-markdown-to-doc-how-to-use-variables -->