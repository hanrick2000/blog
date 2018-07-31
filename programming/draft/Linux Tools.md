- [httpie](https://github.com/jakubroztocil/httpie)

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

- [How to Burn Subtitles Into Video](https://trac.ffmpeg.org/wiki/HowToBurnSubtitlesIntoVideo)
  - ffmpeg -i 1.mp4 -vf subtitles=1.srt output.mp4
- [-ss StartTime -t Duration: -ss 00:26:20 -t 00:28:24](https://superuser.com/questions/103068/what-is-the-command-to-cut-a-portion-out-of-a-video-and-save-it-using-ffmpeg)
```bash
ffmpeg -i m2.mp4 -ss 00:52:18 -t 00:29:16 m2_p1.mp4
ffmpeg -i video.mp4 -vf "subtitles=subs.srt:force_style='Fontsize=24,PrimaryColour=&800000&'" -c:a copy output.mp4
ffmpeg -i 1.mp4 -vf "subtitles=1.srt:force_style='PrimaryColour=&FFFF00&'" output.mp4
```
