
#### [Add single executable file into $PATH rather than an entire directory](https://unix.stackexchange.com/questions/276601/is-it-possible-to-add-a-single-executable-rather-than-an-entire-directory-to-m)
- ln -s $THE_FILE_PATH $HOME/.bin
  - export PATH="$PATH:$HOME/.bin"
- alias $THE_SHORTCUT=$THE_FILE_PATH







