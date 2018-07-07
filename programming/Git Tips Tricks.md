##### [Remove file from the repository but keep it locally](https://stackoverflow.com/questions/3469741/remove-file-from-the-repository-but-keep-it-locally)
- git rm --cached -r somedir/somefile
- then add them to .gitignore
- example: ide files

##### undo git pull
- git reset --hard

##### Reset local branch to be same as remote branch
- git reset --hard origin/master

#### git log
- git log --oneline [--pretty=oneline]

##### Wipes your unstaged changes
git checkout <filename or directory>

#### Edit your X most recent commits interactively (squash, fixup, reword, drop) 
git rebase -i HEAD~X


##### [Symbolic links in Git](http://www.mokacoding.com/blog/symliks-in-git/)
