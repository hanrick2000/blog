#### Use pandoc
- brew install pandoc
- Add **eval "$(pandoc --bash-completion)"** to ${HOME}/.bash_profile
- generate pdf: -o output.df
    - install this first: brew cask install mactex
- generate ppt: -o output.pptx
- pandoc --list-extensions
- pandoc --list-output-formats
```bash
pandoc -f markdown -t html5 -c style.css -s --highlight-style espresso -o the_output.html the.md
pandoc -f markdown -t html5 -c style.css -s --highlight-style espresso -o the.md | pbcopy
```

#### Syntax Highlight in console
- [grc](https://github.com/garabik/grc)
    - grc tail -F the.log; grc ps aux
- [pygmentize](http://pygments.org/)
    - -g guess the lexer, -s: stream, -l language
    - tail -F solr.log | pygmentize -s -l sv
- grep --color -i error solr.log
 
#### [ffmpeg](https://www.ffmpeg.org/ffmpeg.html)
```bash
brew install ffmpeg
# Convert all mkv(avi) files to mp4
for f in *.mkv;do ffmpeg -i "$f" -c:v copy -c:a aac -b:a 256k -strict -2 "${f%mkv}mp4";done
for f in *.avi;do ffmpeg -i "$f"  -strict -2 "${f%avi}mp4";done
```



