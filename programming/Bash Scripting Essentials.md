
#### Math
- var=$((var+1))

#### [Comparison](http://tldp.org/LDP/abs/html/comparison-ops.html)
- if [ "$a" -eq "$b" ]

```bash

if [ $USER == 'bob' ] || [ $USER == 'andy' ]; then
  ls -alh
else
  ls
fi
```

#### [Read data](https://ryanstutorials.net/bash-scripting-tutorial/bash-input.php)
```bash
read -p 'Username: ' uservar
read -sp 'Password: ' passvar
# https://stackoverflow.com/questions/6980090/how-to-read-from-a-file-or-stdin-in-bash
while IFS= read -r line; do
  printf '%s\n' "$line"
done
```


#### IDE
- [Atom ide-bash](https://atom.io/packages/ide-bash)
- [IDEA bashsupport](https://www.plugin-dev.com/project/bashsupport/)