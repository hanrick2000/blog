<!-- SD:
How to Style Images with Markdown: Image Inline-style, Reference-style Syntax, Hyperlinked Images, Center Image, Side by Side Image, Embed Image as Base 64 Content and Etc.
-->

#### [Series: Awesome Tips about Pandoc and Markdown](https://lifelongprogrammer.blogspot.com/search?q=label:Pandoc_Series|label:Markdown_Series){target="blank"}
<script src='/feeds/posts/default?q=label:Pandoc_Series|label:Markdown_Series&orderby=updated&alt=json-in-script&callback=series&max-results=20'></script>
---


#### Image Inline-style
- `![alt text](image.jpg "title")`{.markdown}
- alt vs title
  - alt text is read to blind people and understandable by Google and other search engines
  - Title text: what a user sees after hovering over the image
<!-- - A link immediately preceded by a ! will be treated as an image. -->
- [Prefer `![]()` syntax over img tag](https://tex.stackexchange.com/questions/253262/pandoc-markdown-to-pdf-doesnt-show-images)
  - The raw HTML is passed through unchanged in HTML, S5, Slidy, Slideous, DZSlides, EPUB, Markdown, and Textile output, and suppressed in other formats.
- [In Pandoc, An image with nonempty alt text, occurring by itself in a paragraph, will be rendered as a figure with a caption. The image’s alt text will be used as the caption.](https://pandoc.org/MANUAL.html#images)
- If we don't want the caption, just make sure it is not the only thing in the paragraph, or insert a nonbreaking space after the image:
```markdown
![Baby Crying](https://media.giphy.com/media/l1KVaj5UcbHwrBMqI/giphy.gif)\
```

![Baby Crying](https://media.giphy.com/media/l1KVaj5UcbHwrBMqI/giphy.gif)\

#### Image Reference-style
- Used when the images are used multiple times
- Used to embed image as base64 text
```markdown
![alt text][my_image]

[my_image]: url "Title Text"
```

#### Hyperlinked Images
- Wrap the image in another link and set the link href to a different url.
- Same trick can be used to change image destination.
```markdown
[![Build Status](https://travis-ci.org/philc/vimium.svg?branch=master)]
(https://travis-ci.org/philc/vimium)
```
[![Build Status](https://travis-ci.org/philc/vimium.svg?branch=master)](https://travis-ci.org/philc/vimium)

#### [Pandoc link attributes](https://pandoc.org/MANUAL.html#extension-link_attributes)
- `![image](foo.jpg){#id .class width=30 height=20px}`
- We can add CSS style, id, change width, height to px or percentage, or add any key value.

#### [Center image](https://gist.github.com/DavidWells/7d2e0e1bc78f4ac59a123ddf8b74932d)
1. html: p align
```markdown
<p align="center">
  <img src="https://media.giphy.com/media/e1BxgoFxAOmbK/giphy.gif" alt="Wonder Woman Happy Dance"/>
</p>
```
<p align="center">
  <img src="https://media.giphy.com/media/e1BxgoFxAOmbK/giphy.gif" alt="Wonder Woman Happy Dance"/>
</p>
2. Add center CSS in Pandoc
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

#### [Side by Side Images](https://stackoverflow.com/questions/24319505/how-can-one-display-images-side-by-side-in-a-github-readme-md)
```markdown
![alt text](the_image "Logo Title Text 1")

<!-- Side by Side Images -->
Header Left |  Header Right
:--------:|:-------:
![](image_link)  |  ![](image_link)
```

#### Embed Images as base64 Content
- Use tools like [base64-image.de](https://www.base64-image.de/) to convert image to base64 text.
```markdown
![][my_image]
[my_image]: data:image/png;base64,xxxxx
```
