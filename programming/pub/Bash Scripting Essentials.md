#### Debug script
- bash -x the_command

#### Math
- var=$(( var+1 ))

#### [Parameter Expansion](http://wiki.bash-hackers.org/syntax/pe)
- Use a default value
```bash
${PARAMETER:-WORD}
# the default value is only used when the parameter was unset, not when it was empty
${PARAMETER-WORD}
```
- Assign a default value
```bash
${PARAMETER:=WORD}
${PARAMETER=WORD}
```
#### [Manipulating Strings](https://www.tldp.org/LDP/abs/html/string-manipulation.html)
- String length:
  - ${#string}
  - expr length $string
- Length of Matching Substring at Beginning of String
  - expr match "$string" '$substring'
  - expr "$string" : '$substring'
- Index
  - expr index $string $substring
- Substring Extraction
  - ${string:position}
  - ${string:position:length}
  - ${stringZ:(-4)}: Parentheses or added space "escape" the position parameter.
  - expr substr $string $position $length
- Substring Removal
```bash
${string#substring}
# Deletes shortest match of $substring from front of $string.

${string##substring}
# Deletes longest match of $substring from front of $string.

${string%substring}
# Deletes shortest match of $substring from back of $string.

${string%%substring}
# Deletes longest match of $substring from back of $string.
```
- [Substring Replacement](http://mywiki.wooledge.org/BashFAQ/100)
```bash
# Replace first match of $substring with $replacement at $string
${string/substring/replacement}

# Replace all matches of $substring with $replacement.
${string//substring/replacement}
```

#### [if - Comparison](http://tldp.org/LDP/abs/html/comparison-ops.html)
- [Use [[ ]] instead of [ ]](https://mywiki.wooledge.org/BashGuide/Practices)
  - [[ can do glob pattern matching, regex pattern matching
- if [[ "$a" -eq "$b" ]]
- if [[ ! -d "$DIRECTORY" ]]; then
```bash
[[ "$a" == \*pattern ]] # string ends with
[[ "$a" == z* ]]   # True if $a starts with an "z" (pattern matching).
[[ "$a" == "z*" ]] # True if $a is equal to z* (literal matching).
[[ "$line" =~ ab+ ]] # regex pattern matching (Bash 3.1+):
[[ ! "$line" =~ ab+ ]] # NOT contain
```

##### [file testing](https://www.cyberciti.biz/tips/find-out-if-file-exists-with-conditional-expressions.html)
|     |     |
| --- | --- |
-d(f)|filename	Return true filename exists and is a directory(file).
-n|filename	Return true the length of string is nonzero.
-L|filename	Return true filename exists and is a symbolic link.
file1 -nt(-ot) file2|True if file1 exists and is newer(older) than file2.
file1 -ef file2|True if file1 and file2 exist and refer to the same file.

```bash
if [ $USER == 'bob' ] || [ $USER == 'andy' ]; then
  ls -alh
else
  ls
fi
```

- [Globs](https://mywiki.wooledge.org/glob)
```bash
# for f in *.tar; do
case "$input" in
    [Yy]|'') confirm=1;;
    [Nn]*) confirm=0;;
    *) echo "I don't understand.  Please try again.";;
esac
# if [[ $output = *[Ee]rror* ]]; then
# strip leading pattern that matches */ (be greedy)
filename=${path##*/}
```

#### IFS (Internal Field Separator)
- [The Internal Field Separator that is used for word splitting after expansion ... the default value is <space><tab><newline>](https://stackoverflow.com/questions/2789319/file-content-into-unix-variable-with-newlines)
- any of those three characters can be used to split your command into individual words. After that, the word separators are gone, all you have left is a list of words
#### [Read File](https://mywiki.wooledge.org/DontReadLinesWithFor)
```bash
while IFS= read -r line; do
  printf '%s\n' "$line"
done < "$file"
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

#### Tips
- [Always Quote](https://mywiki.wooledge.org/BashGuide/Practices)
- [Default Assignments](https://www.chromium.org/chromium-os/shell-style-guidelines)
```bash
# Assign "bar" to the variable "foo" if it is not set, or if it is set to "".
: ${foo:="bar"}

# Assign "bar" to the variable "foo" only if it is not set.
# If bar is already set to "", do nothing.
: ${foo="bar"}
```
#### IDE
- [Atom ide-bash](https://atom.io/packages/ide-bash)
- [IDEA bashsupport](https://www.plugin-dev.com/project/bashsupport/)

#### Bugs
- Return(exit with) error code
  * Example: ./gradlew integrationTest || copyLogsToWorkspaceOnError(this function should exit with error code)

#### References
- [Bash Scripting Essentials](/2017/10/bash-scripting-essentials.html)