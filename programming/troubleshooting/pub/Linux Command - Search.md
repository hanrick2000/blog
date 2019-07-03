- Searching and quickly finding Information is an important skill a developer **must** have. 

#### history
- Search command history
  - history | grep git | grep erase  
  - history | grep ssh | grep 9042
- Dedup
  - [history | grep kubectl | awk '{$1="";print}' | sort -u](https://stackoverflow.com/questions/7110119/bash-history-without-line-numbers)

#### [iTerm2](https://lifelongprogrammer.blogspot.com/2018/06/working-effectively-with-iterm.html)
- **Show/Search Command History: Cmd+Shift+;**

#### grep
|||
|-|-|
-r|--recursive
-e|pattern
-E|--extended-regexp
-i|Ignore uppercase vs. lowercase
-v|Invert match
-c|Output count of matching lines only
-l|Output matching files only
-n(--line-number)|Precede each matching line with a line number.
-s(--no-messages)|Silent mode
-A NUM|--after-context=NUM
-B NUM|--before-context=NUM
-C NUM|--context=NUM

- grep -r --exclude=\*.{html,htm,js} pattern  rootdir
- Grep file that contains binary data
  - cat -v tmp/test.log | grep regex
  - -v: Display non-printing characters so they are visible.

- [Find multiple patterns across multiple lines](https://stackoverflow.com/questions/7422743/grep-for-multiple-patterns-over-multiple-files)
  - find . | xargs grep 'pattern1' -sl | xargs grep 'pattern2' -sl

#### [find](http://man7.org/linux/man-pages/man1/find.1.html)
|||
|-|-|
-maxdepth levels|Descend at most levels (a non-negative integer) levels of directories below the starting-points.  -maxdepth 0 means only
-print0|print the full file name on the standard output, followed by a null character (instead of the newline charactes that -print uses)
-exec command ;|{} expands to the filename of each file or directory found with find, \; Says that for each found result, the command (in this case ‘grep’) is executed once with the found result
-exec command {} +|run the specified command on the selected files, but the command line is built by appending each selected file name at the end; the total number of invocations of the command will be much less than the number of matched files.

- find /usr -size +10M
- find . -exec xxx {} \;
- **Find configuration data**
  - find /etc -type f -exec grep -FHi "ENCRYPTION_PASSWORD" {} +
  - grep -r ENCRYPTION_PASSWORD /etc 2>/dev/null
  - find /etc -type f -print0  | xargs -0 grep ENCRYPTION_PASSWORD
  - **Find biggest files**
    - find ~/ -type f -exec du -Sh {} + | sort -rh | head -n 5
- [find -exec vs. find | xargs](https://www.everythingcli.org/find-exec-vs-find-xargs/)

### sed
- Search specific line ranges:
  - sed -n 'startLine,endLinep' a.txt | grep XX

#### [xargs](http://man7.org/linux/man-pages/man1/xargs.1.html)
|||
|-|-|
**--null, -0** |**Input items are terminated by a null character instead of by whitespace, handle space or new line in file name. The find -print0 option produces input suitable for this mode**
-I replace-str|Replace occurrences of replace-str in the initial-arguments with names read from standard input.
-n max-args, --max-args=max-args|Use at most max-args arguments per command line, default 5000
-t|print each command prior execution
-p|print each command and ask to execute it
-x|make xargs quit if the nummber of arguments does not fit into the command line length

```bash
# https://www.cyberciti.biz/faq/linux-unix-bsd-xargs-construct-argument-lists-utility/
find . -name "*.bak" -print0 | xargs -0 -I {} mv {} ~/old.files
find . -name "*.bak" -print0 | xargs -0 -I file mv file ~/old.files
```

#### Notes
- Use right tool for different tasks
  - For simple search, search directly in your tools like Atom
  - For complex search, much easier to use Linux commands