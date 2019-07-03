---

### [Series: Awesome Tips about Markdown](https://lifelongprogrammer.blogspot.com/search/label/Markdown_Series){target="blank"}
<script src="https://lifelongprogrammer.blogspot.com/feeds/posts/default/-/Markdown_Series?orderby=updated&amp;alt=json-in-script&amp;callback=series&amp;max-results=20"></script>

---

### TL;DR
- How to write a blog faster in [Atom](https://lifelongprogrammer.blogspot.com/2017/10/awesome-tips-about-atom-editor.html) with [Markdown Syntax](https://lifelongprogrammer.blogspot.com/2018/05/awesome-tips-about-markdown.html)
- Publish it with [Pandoc](https://pandoc.org) to Github.

### Why Blogger with Markdown
- Focus on the content, easy to store/edit/read the content locally
  - Use plaintext to write rich formatted content with [atom](https://lifelongprogrammer.blogspot.com/2017/10/awesome-tips-about-atom-editor.html){target="blank"}
- Flexible: easy to hide(Cmd+/) text, draft, or the text/explanation for you.
  - [HTML minifier](http://minifycode.com/html-minifier/) will remove the commented text for you.

- We can export the markdown files to html, pdf, ppt(Powerpoint or Google Sides), html slides(reveal.js)

### [Writing in Atom with Markdown](https://lifelongprogrammer.blogspot.com/2019/03/must-have-atom-editor-packages.html){target="blank"}
- Check [here](https://lifelongprogrammer.blogspot.com/2019/03/must-have-atom-editor-packages.html){target="blank"} for [must-have atom editor packages](https://lifelongprogrammer.blogspot.com/2019/03/must-have-atom-editor-packages.html){target="blank"}

#### Atom Packages for Writing
- [Spell Check: Cmd+Shift+:](https://atom.io/packages/spell-check)
- [Change Case](https://atom.io/packages/change-case)
  - change-case:kebab/upperFirst/snake/constant
  - Shortcut from command palette: `UF`
  - Find all command by typing `cc, CC or 'Change Case'`
- [title-case](https://atom.io/packages/title-case)
  - solve the issue in `change-case:title`
  - Shortcut: type `etc[Editor: Title Case]` in command palette
- [Document Outline](https://atom.io/packages/document-outline)
  - Shortcut: Ctrl-Cmd-T
  - Uncheck "Show by default" in its settings
  - Only use h4 or above for markdown
```markdown
'atom-workspace':
    'cmd-ctrl-t': 'document-outline:toggle'
```
- [Delete Whitelines: Option+Shift+D](https://atom.io/packages/delete-whitelines)
- [linter-write-good](https://atom.io/packages/linter-write-good)

#### Packages for Writing - Markdown
- [Markdown Writer](https://atom.io/packages/markdown-writer)
  - Execute command **Markdown Writer: Create Default keymaps** to add the recommended Keymaps.
  - snippet: b(bold), i, p(bullet point: -), l(link), code, t(todo), img

  |                    |                            |
  |:------------------ |:-------------------------- |
  | **ctrl-alt-[1-5]** | **switch among H1 to H5.** |
  | cmd-'              | code                       |
  | cmd-b              | **bold**                   |
  | cmd-i              | _italic_                   |
  | cmd-h              | ~~strike through~~         |
  | **cmd-shift+u**    | **- unordered list**       |
  | shift-cmd-"        | '''code block'''           |
  | 0. ordered list    | (shift-cmd-O)              |

- [Markdown Table Editor](https://atom.io/packages/markdown-table-editor)
  - **Hit tab to move to the next cell**
  - Snippet: table
- [markdown-preview-enhanced](https://github.com/shd101wyy/markdown-preview-enhanced)
  - [Ctrl+Shift+M: toggle preview](https://github.com/shd101wyy/markdown-preview-enhanced/issues/1137)
  - Support: **Scroll sync**, automatically show and switch preview of markdown being edited
  - Support Code chunk, [Presentation](https://shd101wyy.github.io/markdown-preview-enhanced/#/presentation)
  - Copy (part of) html content from the preview panel directly
  - [Diagrams](https://shd101wyy.github.io/markdown-preview-enhanced/#/diagrams)
    - Support PlantUML, mermaid, flow charts, sequence diagrams
  - [Turn off "Open preview pane automatically when opening a markdown file" as it will steal Tree View focus.](https://github.com/shd101wyy/markdown-preview-enhanced/issues/1054)
  - `Use Pandoc Parser`
- [markdown-preview-plus](https://atom.io/packages/markdown-preview-plus)
  - Ctrl+Shift+M: toggle preview
  - Copy html: convert markdown to html and copy the output to clipboard
  - Enable "Preview Position Synchronization behavior"
  - support pandoc syntax
- [atom-csv-markdown](https://atom.io/packages/atom-csv-markdown)

---

### Call Commands Faster
- Select [```Preserve Last Search```](https://github.com/atom/atom/issues/16097){target="blank"} at `Packages -> Command Palette`.
  - As we usually call same functions multiple times.
- Use shortcut, check the [awesome tips about atom editor](https://lifelongprogrammer.blogspot.com/2017/10/awesome-tips-about-atom-editor.html){target="blank"} to learn commonly used shortcuts in Atom.
- Use `Command Palette` or `Cmd+Shift+? - Help > Search` to find command and learn its shortcut.
- In `Command Palette`, use abbreviation
  - type `etc[Editor: Title Case]` in command palette to format title: from package [title-case](https://atom.io/packages/title-case).
  - `uf` for `UpperFirst`

### Write Faster
#### No Need to Select
<!-- - The following commands change the text in selection -->
- When there is no text selected, the command may work on previous word or surrounding word: e.g: `Case Change`

#### Case Change
- by default, Atom supports: `Upper(Lower) Case`
- Install [Change Case](https://atom.io/packages/change-case), it adds: `kebab/upperFirst/snake/constant`
- Install [title-case](https://atom.io/packages/title-case) which solve the issue in `change-case:title`
- `change-case:title` from [Change Case](https://atom.io/packages/change-case) will remove characters like -, It's -> `It S`, but it can be used to get the title form url.
  - e.g. to get the lower case title [awesome tips about chrome](https://lifelongprogrammer.blogspot.com/2018/06/awesome-tips-about-chrome.html){target="blank"} from `awesome-tips-about-chrome.html`:
  -  `change-case:title` converts it to `Awesome Tips About Chrome Html`, then `lc: Editor:lower case` to lower case.
- [kebab command](https://en.wikipedia.org/wiki/Letter_case#Special_case_styles) to create url.

#### Spell Check
- `Cmd+Shift+:` to correct spelling

#### Snippets
- Add commonly used phrases or difficult typing phrase such as `TL;DR`
- Add links that are used frequently
- Add some other html/script block such as sections: `Related Posts`, `Series`.
- [using """ for Multi-line Snippet Body](https://flight-manual.atom.io/using-atom/sections/snippets/#multi-line-snippet-body)
```cson
'.source.gfm':
  'Awesome Tips about Chrome':
    'prefix': 'l_chrome'
    'body': '(/2018/06/awesome-tips-about-chrome.html){target="blank"}'
  'TL;DR':
    'prefix': 'tldr'
    'body': '### TL;DR'
  'Related Posts':
    'prefix': 'related'
    'body': """
    ---
    #### [Related Posts](https://lifelongprogrammer.blogspot.com/search/label/Chrome)
    <script src="https://lifelongprogrammer.blogspot.com/feeds/posts/default/-/Chrome?orderby=updated&amp;alt=json-in-script&amp;callback=weightedRandomRelatedPosts&amp;max-results=20"></script>
    """
```

#### 2: Use Pandoc to Generate Html and Post it into Blogger
- brew install pandoc
- [go get github.com/tdewolff/minify/cmd/minify](https://github.com/tdewolff/minify/tree/master/cmd/minify)
- `export "md=the_md_file""`
- `pandoc -f markdown -t html5 -c style.css -s --highlight-style espresso "${md}" | bash ~/scripts/rmheadbody.sh | minify --type=html | pbcopy`
  - Use `Cmd+Shift+;` in [iTerm](https://lifelongprogrammer.blogspot.com/2018/06/working-effectively-with-iterm.html){target="blank"} to quickly [find and execute the command](https://lifelongprogrammer.blogspot.com/2018/06/working-effectively-with-iterm.html){target="blank"}.

##### rmheadbody.sh
```bash
i=0
printf '<div dir="ltr" style="text-align: left;" trbidi="on"><div style="font-size: large;">\n'
# rm <link rel="stylesheet" href="style.css" />
while IFS= read -r line; do
  i=$((i+1))
  if [[ "$i" -gt "7" ]] && [[ "$line" != "</head>" ]] && [[ "$line" != "<body>" ]] && [[ "$line" != "</html>" ]] && [[ "$line" != "</body>" ]] && [[ ! "$line" =~ "style.css" ]] ; then
    printf '%s\n' "$line"
  fi
done

printf '</div></div>'
```

#### Proof-read
- New line is very important in Markdown.
- check broken headers by searching `##` or \`\`\`
```md
- list
<!-- If without a new line, the html generated by pandoc will be broken -->
#### Header

---
<!-- new line need here -->
#### Header
```
- broken table


<!-- ##### More Advanced Syntax
- Block Quotes for reference or linked content
- Divide line
- Refer image or video -->

### Why Git/Github
- Easier to figure out the recent change and publish it to blogger.
- e.g. [github/jefferyyuan/blog](https://github.com/jefferyyuan/blog)

### Bonus
#### [How to Building Presentations with Reveal.js, Markdown and Github Pages](https://lifelongprogrammer.blogspot.com/2019/03/building-presentations-with-reveal-js-markdown-and-github-pages.html)

---
#### [Related Posts](https://lifelongprogrammer.blogspot.com/search?q=label:Markdown|label:"Atom Editor")
<script src="https://lifelongprogrammer.blogspot.com/feeds/posts/default/-/Atom Editor?orderby=updated&amp;alt=json-in-script&amp;callback=weightedRandomRelatedPosts&amp;max-results=20"></script>
<script src="https://lifelongprogrammer.blogspot.com/feeds/posts/default/-/Markdown?orderby=updated&amp;alt=json-in-script&amp;callback=weightedRandomRelatedPosts&amp;max-results=20"></script>
<script src="https://lifelongprogrammer.blogspot.com/feeds/posts/default/-/Dev Tips?orderby=updated&amp;alt=json-in-script&amp;callback=weightedRandomRelatedPosts&amp;max-results=20"></script>
