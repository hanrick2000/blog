### TL;DR
- How to build presentation with Markdown, Reveal.js And Github Pages.
- We can export it as html presentation, ppt, Google Slides, pdf and other formats.
- Write Once, Share Anywhere.

### [Demo](/2019/06/how-to-improve-problem-solving-skills-developer-guide.html)
- [How to Improve Problem Solving Skills - Developer Guide](/2019/06/how-to-improve-problem-solving-skills-developer-guide.html)
- [The Published Html Slides - Github Page](https://jefferyyuan.github.io/how_to_improve_problem_solving_skills)
- Source code:
  - [The Markdown File](https://github.com/jefferyyuan/blog/blob/master/programming/presentation/How%20to%20Improve%20Problem%20Solving%20Skills%20-%20Developer%20Guide.md)
  - [The Template File](https://github.com/jefferyyuan/jefferyyuan.github.io/blob/master/how_to_improve_problem_solving_skills/__template.html)
  - [The Final Html](https://github.com/jefferyyuan/jefferyyuan.github.io/blob/master/how_to_improve_problem_solving_skills/index.html)

### Why Build Presentation With Markdown, Reveal.js And Github Pages
#### Why Markdown
- Focus on the content, easy to store/edit the content locally
- Great editor: Atom
- Easy to export to pdf, html, ppt(powerpoint or Google Slides), and other formats using one source markdown file.

#### Why Reveal.js
- Works well with markdown, pandoc

#### [Why Github Pages](https://pages.github.com/)
- We can't directly put the html slide generated Reveal.js into blogger: it shows nothing.
- We have to first publish the html slide online, then use iframe to refer it.
- Github Pages is Free.

### How
- [Write the content using markdown slides syntax](#slide_syntax)
- There are two approaches: [Pandoc Reveal.js Syntax](#pandoc_reveal_js_syntax) or [Reveal.js External Markdown Syntax](#reveal_js_external_markdown_syntax),
- I choose the first approach, read [Crons of Reveal.js External Markdown Approach](#crons_of_reveal_js_external_markdown_approach) to know why.

#### Use Pandoc To Generate Html Slides
- We can use `pandoc -t revealjs -s "${md}" -V revealjs-url=https://revealjs.com` to generate html slides.
- Usually we also want to change Reveal.js configuration: such as add custom css or use font-awesome, we can create one template html with `__reveal_slides__`  that can be replaced with the new slide content

##### replace_reveal_slides.bash
- use pandoc to generate html slides then use [tq](https://github.com/plainas/tq) to extract the slide content
- [Read template file content as a variable](https://stackoverflow.com/questions/2789319/file-content-into-unix-variable-with-newlines)
- use [shell-builtin parameter expansion](https://stackoverflow.com/questions/46914505/substituting-keyword-in-string-with-multi-line-variable-via-sed) to replace __reveal_slides__ in the template with the slide content
```bash
reveal_slides=$(pandoc -t revealjs -s "${md}" -V revealjs-url=https://revealjs.com | tq .reveal)
IFS=
template_text="$(cat ${template_file})"
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

### Reveal.js Features
- **Speaker notes view: S**
- [themes](https://github.com/hakimel/reveal.js#theming)
- [All Configurations and Configuration defaults](https://github.com/hakimel/reveal.js/blob/master/js/reveal.js)
  - parallaxBackgroundHorizontal

#### [Plugins](https://github.com/hakimel/reveal.js/wiki/Plugins,-Tools-and-Hardware)
- [slideout menu](https://github.com/denehyg/reveal.js-menu)
  - { src: 'https://denehyg.github.io/reveal.js-menu/plugin/reveal.js-menu/menu.js' }
- [toolbar](https://github.com/denehyg/reveal.js-toolbar)

---

#### Reveal.js Shortcuts

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

#### [Work together with Chrome Vimum](/2019/06/awesome-tips-about-chrome-vimium.html){target="blank"}
- [reveal.js uses F for Fullscreen and some other shortcuts which conflicts with Vimium](https://github.com/hakimel/reveal.js/wiki/Keyboard-Shortcuts)
- So add the following at `Excluded URLs and keys` at `Vimium Options`.

| Patterns                           | Keys  |
|:---------------------------------- |:----- |
| "https?://jefferyyuan.github.io/*" | f,F,?,O,o,b,B |


#### Customize reveal.js
- Customize Reveal.initialize to add plugins, controls.
- Customize the css.
```css
/* decrease font size of h1 and h2 */
.reveal h1 {
font-size: 1.6em;
}
.reveal h2 {
font-size: 1.4em;
}
/*  */
```

---

### Markdown Slides Different Syntax<a name="slide_syntax"></a>
#### Pandoc Slides Syntax<a name="pandoc_reveal_js_syntax"></a>
- We can test it locally, no need to run web server or deploy it first
  - pandoc -t revealjs -s "${md}" -V revealjs-url=https://revealjs.com
- [Pandoc Syntax](https://pandoc.org/MANUAL.html#producing-slide-shows-with-pandoc)
- [Heading identifiers](https://pandoc.org/MANUAL.html#heading-identifiers)
  - Use it to specify slide attributes
  - {data-background-color="#ff0000" data-transition="slide-in fade-out"}
- Inserting pauses: a paragraph containing `. . .`
- change theme: `-V theme:Warsaw`
- global level: parallaxBackgroundImage: /path/to/my/background_image.png
- slide level: {data-background-image="/path/to/special_image.jpg"}

##### How to have content in the top slide in 2D reveal.js slideshows {#conten_at_top_slide}
- in [pandoc 2.7](https://pandoc.org/releases.html#pandoc-2.7-3-march-2019)

> Slide show formats behavior change: content under headers less than slide level is no longer ignored, but included in the title slide (for HTML slide shows) or in a slide after the title slide (for beamer). This change makes possible 2D reveal.js slideshows with content in the top slide on each stack (#4317, #5237).

  - Must also run pandoc with `--slide-level=2`

##### [Open link in a new window](https://stackoverflow.com/a/50499778/753352)
- ex: [How to Improve Problem Solving Skills: the Developer Guide](https://lifelongprogrammer.blogspot.com/2019/06/how-to-improve-problem-solving-skills-developer-guide.html){target="blank"}
- use "blank" instead of `_blank` due to the bug at atom: [Wrong syntax highlighting when one line contains a single `*` or `_` ](https://github.com/atom/language-gfm/issues/44)
```md
[How to Improve Problem Solving Skills: the Developer Guide](https://lifelongprogrammer.blogspot.com/2019/06/how-to-improve-problem-solving-skills-developer-guide.html){target="blank"}
```
##### [Incremental lists and Speaker notes](https://pandoc.org/MANUAL.html#incremental-lists)
```text
::: incremental
:::
> -

<!-- Speaker notes -->
::: notes
:::

# Title {data-transition="fade" data-background="#A0C66B"}
[Hello, world!](http://example.com/){target="blank"}
```


### Traps
- The title/author must be at the title meta data block.
  - No content(including comment) before it
- There should no content at h1 title.

---

#### Reveal.js External Markdown Syntax<a name="reveal_js_external_markdown_syntax"></a>
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
##### [Cons of Reveal.js External Markdown Approach]<a name="crons_of_reveal_js_external_markdown_approach"></a>
- The problem with this approach is the extra separator "---" or "----"
  - More type and more error-prone
  - It pollutes the output of raw html or pdf

<!-- #### [remark](https://github.com/gnab/remark)
- in-browser, markdown-driven slideshow tool -->

---

#### [Related Posts](/search?q=markdown)
<script src="/feeds/posts/default/?q=markdown&orderby=updated&amp;alt=json-in-script&amp;callback=weightedRandomRelatedPosts&amp;max-results=20"></script>
