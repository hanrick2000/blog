#### [A nice color palette for the web](https://clrs.cc)

#### [CSS Selectors](https://www.w3schools.com/cssref/css_selectors.asp)

|                 |                                          |                                                                               |
|:--------------- | ---------------------------------------- |:----------------------------------------------------------------------------- |
| .class1.class2  | `<div class="name1 name2">...</div>`     | Selects all elements with both name1 and name2 set within its class attribute |
| .class1 .class2 | `<div class="name1"><div class="name2">` | Selects all elements with name2 that is a descendant of an element with name1 |
| element,element | div, p                                   | `Selects all <div> elements and all <p> elements`                             |
| element element | div p                                    | `Selects all <p> elements inside <div> elements`                              |
| #id1,#id2,#ID3  |                                          | apply style to Multiple IDs                                                   |



#### Background Images
```css
.post-body {
  background-color: #336655;
  background-image: url("https://cdn12.picryl.com/photo/2016/12/31/cat-black-cat-black-animals-5ef19b-1024.jpg");
  background-repeat: no-repeat;
}
```

#### [Use a CSS Class to Style an Element](https://learn.freecodecamp.org/responsive-web-design/basic-css/use-a-css-class-to-style-an-element/)
```text
<style>
  .blue-text {
    color: blue;
  }
</style>
<h2 class="blue-text">CatPhotoApp</h2>
```

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
blockquote p::before {content: '\201C';}
blockquote p::after {content: '\201D';}
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

#### Center
- [CENTERING THINGS](https://www.w3.org/Style/Examples/007/center.en.html)
  - `P { text-align: center }`{.css}
- [To center an image, set left and right margin to auto and make it into a block element](https://www.w3schools.com/howto/howto_css_image_center.asp)
```markdown
.center {
  display: block;
  margin-left: auto;
  margin-right: auto;
  width: 50%;
}
```