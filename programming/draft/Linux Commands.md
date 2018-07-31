###### alias
alias grep="grep --color"
alias 

###### ps
- print pid: ps -C {program-name} -o pid=
- [Show full command: ps -f | less](https://superuser.com/questions/486648/full-command-text-with-unix-ps)
    - ps detects the size of your terminal window and clips to that.

##### xargs
- [use \0 as the delimiter and -0 to use it](https://stackoverflow.com/questions/51736614/piping-echo-output-into-xargs)
  - printf '%s\0' Hello Hola Bonjour | xargs -0 -I _ echo _ Landon


##### Search
###### Sort files by date then grep
- ls -rt \*.log | xargs grep -l <pattern>

```bash
# Find which jar contains the class
find . -name "*.jar" | xargs grep Hello.class
```

###### List open files
- ls -l /proc/${pid}/fd
- lsof -p ${pid}

###### watch
- [watch -n 5 curl -s localhost:8983/show/health](https://unix.stackexchange.com/questions/48215/watch-ing-curl-yields-unexpected-output)
- -d: highlights the changes

###### curl
- [--max-time <seconds>](https://unix.stackexchange.com/questions/148922/set-timeout-for-web-page-response-with-curl)

##### [pbcopy (take standard input to clipboard) + pbpaste (take data from clipboard to standard output)](http://osxdaily.com/2007/03/05/manipulating-the-clipboard-from-the-command-line/)
```bash
pbcopy < file.txt
ps aux | pbcopy
pbpaste > pastetest.txt
```

##### diff
```bash
diff -x '*.foo' -x '*.bar' -x '*.baz' -rq /destination/dir/1 /destination/dir/2
```

#### sed
- sed -n '16224,16482p' filename > newfile

##### System
###### [Check the age of the system](https://serverfault.com/questions/221377/how-to-determine-the-age-of-a-linux-system-since-installation)
- rpm -qi basesystem | grep "Install Date"


##### Misc
- cd $(dirname ${file_full_path})
- [tar xfz somefilename.tar.gz](https://www.howtogeek.com/50093/unzip-bunzip2-and-untar-those-tar-gz-or-tar-bz2-files-in-one-step/)
- [dirname, basename, realpath](https://stackoverflow.com/questions/284662/how-do-you-normalize-a-file-path-in-bash)
- [Copy one file to multiple file names](https://askubuntu.com/questions/45332/how-to-copy-one-file-to-multiple-filenames)
  - cat 1.ods | tee {jan,feb,mar}-{Rep,graph}.ods >/dev/null
- [tail -f **/*.log](https://stackoverflow.com/questions/18321336/how-to-tail-all-the-log-files-inside-a-folder-and-subfolders)

###### [Get current working directory of a process](https://unix.stackexchange.com/questions/94357/find-out-current-working-directory-of-a-running-process)
- pwdx <PID>
- lsof -p <PID> | grep cwd
- readlink -e /proc/<PID>/cwd 
##### [View a range of bash history]
- fl -l ${start} ${end}
- history | sed '${start},${end}p'


##### [Brace expansion](http://www.pellegrino.link/2015/03/07/brace-expansion-with-unix-shells.html)
- mkdir -p {f1, f2}
- for i in {1..3}; do echo $i; done
    - {START..END..INCREMENT}

#### [Command History](https://stackoverflow.com/questions/3371294/how-can-i-recall-the-argument-of-the-previous-bash-command)
|||
|-|-|
!!:n|where n is the 0-based position of the argument you want
!$|last argument from previous command
!^|first argument (after the program/built-in/script) from previous command
!!|previous command (often pronounced "bang bang")
!n|command number n from history
!pattern|most recent command matching pattern
!!:s/find/replace|last command, substitute find with replace
:p|print the command - !!:p, !!n:p

