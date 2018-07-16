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
- git checkout <filename or directory>

### rebase
#### Edit your X most recent commits interactively (squash, fixup, reword, drop) 
- git rebase -i HEAD~X
#### [Modify a specific commit](https://stackoverflow.com/questions/1186535/how-to-modify-a-specified-commit-in-git)
```bash
git rebase --interactive 'bbc643cd^'
# change pick to edit, Make your changes and then commit them with the same message
git commit --all --amend --no-edit
git rebase --continue
```

##### [Symbolic links in Git](http://www.mokacoding.com/blog/symliks-in-git/)
