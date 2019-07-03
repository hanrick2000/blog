<!-- SD:
Awesome Tips about GitHub Shortcuts, Search Syntax, Wide Github Chrome Extension, Github Pages and Markdown.
-->
#### [Shortcuts](https://help.github.com/en/articles/using-keyboard-shortcuts)
- Type `?` to check keyboard shortcuts.

  |         |                                                                                  |
  |:------- |:-------------------------------------------------------------------------------- |
  | **s**  or / | Focus the search bar                                                             |
  | g n     | Go to your notifications                                                         |
  | g p     | Go to the Pull requests tab at Repositories                                      |
  | g w     | Go to the Wiki tab                                                               |
  | t       | Activates the file finder  or Open the list of changed files in the pull request |
  | w       | Switch to a new branch or tag                                                    |
  | l       | Jump to a line in your code                                                      |


##### `Excluded URLs and keys` in [Chrome Vimium](https://lifelongprogrammer.blogspot.com/2019/04/awesome-tips-about-chrome-vimium.html){target="blank"}
- Some shortcuts from Github conflicts with [Chrome Vimium](https://lifelongprogrammer.blogspot.com/2019/04/awesome-tips-about-chrome-vimium.html){target="blank"}
- So add the following at `Excluded URLs and keys` at `Vimium Options`.

  | Patterns                         | Keys          |
  |:-------------------------------- |:------------- |
  | https?://github.com/*            | b,l,c,g,n,h,p |

---

#### [Search Syntax](https://help.github.com/en/articles/searching-code)
- filename:FILENAME
- in:file, in:path
- key_word in:file,path matches code where "key_word" appears in the file contents or the file path.
- Search by file location
  - path:/, path:DIRECTORY, path:PATH/TO/DIRECTORY
- extension: EXTENSION
- user:the_user, repo:the_repo
- [fork:true/false/only](https://help.github.com/articles/searching-in-forks/)

#### [Wide Github](https://openuserjs.org/scripts/xthexder/Wide_Github)
- Install [Tampermonkey](https://chrome.google.com/webstore/detail/tampermonkey/dhdgffkkebhmkfjojejmpbldmpobfkfo) first.
- Add `@include     *github.your_company.com*` at `Installed userscripts -> Wide Github -> Editor` to make it work with GitHub Enterprise.

#### Chrome Extensions
- [Octotree](https://chrome.google.com/webstore/detail/octotree/bkhaagjahfmjljalopjnoealnfndnagc)
  - Easy-to-navigate code tree, just like in IDEs
- [GitZip for github](https://chrome.google.com/webstore/detail/gitzip-for-github/ffabmkklhbepgcgfonabamgnfafbdlkn)
  - It can make the sub-directories and files of github repository as zip and download it; You DO NOT have to download the whole project just for those few files/dirs you need.
- [Enhanced GitHub](https://chrome.google.com/webstore/detail/enhanced-github/anlikcnbgdeidpacdbdljnabclhahhmd)


#### [Expand outdated Github Comments](https://github.com/broadinstitute/gatk/wiki/Expand-outdated-Github-Comments)
```javascript
javascript:Array.from(documentP.getElementsByClassName('outdated-comment'))
.forEach(l => l.classList.add('open'));
```

---

#### Hackable Github URLs
- Compare changes between tags/branches
  - https://github.com/{username}/{repo}/compare/{older-tag}...{newer-tag}
  - compare/master@{2weeks}...master
  - compare/{older-tag}...{newer-tag}
- URL to create a pull request between different two branches
  - /compare/remote:branch...remote:branch
- [issues](https://github.com/issues) to track all issue
- [pulls](https://github.com/pulls) to track all prs


#### Use Github to Host Files and Share Online


<!-- - We can use `t` to find files quickly, just one caveat: the first one maybe not one you are looking for, even you use the exact file name.  when the file path is too long, we can't really see  -->

#### [Github Pages](https://pages.github.com/)
- We can use GitHub Pages to host web sites, [presentation](https://lifelongprogrammer.blogspot.com/2019/03/building-presentations-with-reveal-js-markdown-and-github-pages.html){target="blank"}
- [How to Build Presentations with reveal.js, Markdown and Github Pages](https://lifelongprogrammer.blogspot.com/2019/03/building-presentations-with-reveal-js-markdown-and-github-pages.html){target="blank"}
- [Github pages are not updating](https://help.github.com/en/articles/troubleshooting-github-pages-builds)
  - Check `GitHub Pages` section at settings of your Github project. There would be some error that explains why and fix it.
  - Github also sends emails with title `Page build failure`.

<!-- #### [Github API](https://developer.github.com/v3/)
- https://api.github.com/repos/apache/lucene-solr/git/refs/heads/branch_7x -->

#### Markdown
- Use Markdown in PR, comments, check here about some [awesome tips about markdown](https://lifelongprogrammer.blogspot.com/2018/05/awesome-tips-about-markdown.html){target="blank"}
- **Quote reply** to get the markdown source of PRs and comments
- To type long markdown: PR template, use [Atom](https://atom.io/) with [markdown-writer](https://atom.io/packages/markdown-writer) [Markdown Enhanced Preview](https://atom.io/packages/markdown-preview-enhanced).
  - check more
  - (/2017/10/awesome-tips-about-atom-editor.html){target="blank"}

---

### [Awesome Tips about Markdown](https://lifelongprogrammer.blogspot.com/search/label/Markdown_Series){target="blank"}
<script src="https://lifelongprogrammer.blogspot.com/feeds/posts/default/-/Markdown_Series?orderby=updated&amp;alt=json-in-script&amp;callback=series&amp;max-results=20"></script>

---

#### Misc
- [Use Gist to host code](https://gist.github.com)
- [Pin repos](https://help.github.com/en/articles/pinning-items-to-your-profile)
- [Emoji in github](https://www.webfx.com/tools/emoji-cheat-sheet/)
  - :+1:, :thumbsup:, :bug:
- Saved replies
- Check whether project is still alive?
  - Check history of commit, release and contributors at Code tab.
  - Check **Insights** tab: how many contributors, code frequency, commits history etc.
  - Check issues tab: check the closed issues, how they are closed: some may be closed without any reply or auto closed.
  - For example [emmet-atom](https://github.com/emmetio/emmet-atom/graphs/contributors) looks like not maintained any more.
<!--
https://github.com/zhaoolee/ChineseBQB

 -->

---
#### [Related Posts](https://lifelongprogrammer.blogspot.com/search?q=label:Github|label:Markdown){target="blank"}
<script src="https://lifelongprogrammer.blogspot.com/feeds/posts/default?q=label:Github|label:Markdown?orderby=updated&amp;alt=json-in-script&amp;callback=weightedRandomRelatedPosts&amp;max-results=20"></script>
<script src="https://lifelongprogrammer.blogspot.com/feeds/posts/default/-/Dev Tips?orderby=updated&amp;alt=json-in-script&amp;callback=weightedRandomRelatedPosts&amp;max-results=20"></script>

