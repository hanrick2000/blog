### Why Build Presentation With Markdown Reveal.js And Github Pages
#### Why Markdown
- Focus on the content, easy to store/edit the content locally
- Great editor: Atom
- Easy to export to pdf, html, ppt(powerpoint or Google Slides) 

#### Why Reveal.js
- Works well with markdown, pandoc

#### [Why Github Pages](https://pages.github.com/)
- We can't directly put the html slide generated Reveal.js into blogger: it shows nothing.
- We have to first publish the html slide online, then use iframe to refer it.
- Github Pages is Free.

### How
- Write the content using markdown slides syntax
- There are two approaches: [Pandoc Reveal.js Syntax](#pandoc_reveal_js_syntax) or [Reveal.js External Markdown Syntax](#reveal_js_external_markdown_syntax), 
  - I choose the first approach, read [Crons of Reveal.js External Markdown Approach](#crons_of_reveal_js_external_markdown_approach) to know why.

#### Use Pandoc To Generate Html Slides
- We can use `pandoc -t revealjs -s "${md}" -V revealjs-url=https://revealjs.com` to generate html slides.
- But usually we want to change Reveal.js configuration, add custom css or use font-awesome, we can create one template html with `__reveal_slides__`  that can be replaced with the new slide content

##### replace_reveal_slides.bash
- use pandoc to generate html slides then use [tq](https://github.com/plainas/tq) to extract the slide content
- [Read template file content as a variable](https://stackoverflow.com/questions/2789319/file-content-into-unix-variable-with-newlines)
- use [shell-builtin parameter expansion](https://stackoverflow.com/questions/46914505/substituting-keyword-in-string-with-multi-line-variable-via-sed) to replace __reveal_slides__ in the template with the slide content
```bash
reveal_slides=$(pandoc -t revealjs -s "${md}" -V revealjs-url=https://revealjs.com | tq .reveal)

IFS=
template_text="$(cat ${template_file})"
# echo template_text $template_text
result=${template_text/__reveal_slides__/$reveal_slides}

# https://github.com/tdewolff/minify/tree/master/cmd/minify
echo ${result} | minify --type=html | pbcopy
```

#### Publish it to Github Pages
- [Create a repository](https://github.com/new) with name like [username.github.io](https://jefferyyuan.github.io/)
- [Add the generated html slides and push it to github](https://github.com/jefferyyuan/jefferyyuan.github.io)
- [Check the html slide](https://jefferyyuan.github.io/how_to_improve_problem_solving_skills/)

#### Share the Slide to blogger
- Use iframe to refer the html slides
```html
<div>
    <iframe src="https://jefferyyuan.github.io/how_to_improve_problem_solving_skills" height="800" width="100%" allowfullscreen frameborder="0">
    </iframe>
</div>
```
- we can also generate html from the original markdown and append it in the post.

### Reveal.js Functions
- **Speaker notes view: S**
- [themes](https://github.com/hakimel/reveal.js#theming)
- [All Configurations and Configuration defaults](https://github.com/hakimel/reveal.js/blob/master/js/reveal.js)
  - parallaxBackgroundHorizontal

### [Plugins](https://github.com/hakimel/reveal.js/wiki/Plugins,-Tools-and-Hardware)
- [slideout menu](https://github.com/denehyg/reveal.js-menu)
  - { src: 'https://denehyg.github.io/reveal.js-menu/plugin/reveal.js-menu/menu.js' }
- [toolbar](https://github.com/denehyg/reveal.js-toolbar)
- 
### Reveal.js Shortcuts

| KEY            | ACTION                 |
|----------------|------------------------|
| N , **SPACE**  | Next slide             |
| P              | Previous slide         |
| ← , H          | Navigate left          |
| → , L          | Navigate right         |
| ↑ , K          | Navigate up            |
| ↓ , J          | Navigate down          |
| Home , Shift ← | First slide            |
| b              | black the screen       |
| End , Shift →  | Last slide             |
| B , .          | Pause                  |
| F              | **Fullscreen**         |
| ESC, O         | **Slide overview**     |
| S              | **Speaker notes view** |

#### [Work together with Chrome Vimum](https://lifelongprogrammer.blogspot.com/2019/06/awesome-tips-about-chrome-vimium.html)
- [revealjs uses F for Fullscreen and some other shortcuts which conflicts with Vimium](https://github.com/hakimel/reveal.js/wiki/Keyboard-Shortcuts)

| Patterns                           | Keys  |
|:---------------------------------- |:----- |
| "https?://jefferyyuan.github.io/*" | f,F,?,O,o,b,B |

### Markdown Slides Different Syntax
#### Pandoc Reveal.js Syntax<a name="pandoc_reveal_js_syntax"/>
- [Pandoc Syntax](https://pandoc.org/MANUAL.html#producing-slide-shows-with-pandoc)
- [Heading identifiers](https://pandoc.org/MANUAL.html#heading-identifiers)
  - Use it to specify slide attributes
  - {data-background-color="#ff0000" data-transition="slide-in fade-out"}
- [Incremental lists](https://pandoc.org/MANUAL.html#incremental-lists)
```markdown
::: incremental
:::
> -

<!-- Speaker notes -->
::: notes
:::
```

#### Reveal.js External Markdown Syntax<a name="reveal_js_external_markdown_syntax"/>
- [Run external Markdown locally](https://github.com/hakimel/reveal.js#full-setup)
```markdown
<!-- .slide: data-transition="fade" data-background="#A0C66B" -->
<!-- .element: class="fragment" data-fragment-index="1" -->
```
```html
<section data-markdown="r1.md"
  data-separator="^\r?\n---\r?\n$"
  data-separator-vertical="^\r?\n----\r?\n$"
  data-separator-notes="^Note:"					
>
```
##### [Crons of Reveal.js External Markdown Approach]<a name="crons_of_reveal_js_external_markdown_approach"/>
- The problem with this approach is the extra separator "---" or "----"
  - More type and more error-prone
  - It pollutes the output of raw html or pdf

