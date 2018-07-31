##### Temporarily ignoring files
git update-index --assume-unchanged file-path
git update-index --no-assume-unchanged file-path

##### [Remove file from the repository but keep it locally](https://stackoverflow.com/questions/3469741/remove-file-from-the-repository-but-keep-it-locally)
- git rm --cached -r somedir/somefile
- then add them to .gitignore
- example: ide files

#### [Reset current HEAD to the specified state](https://git-scm.com/docs/git-reset)
##### [undo last commit](https://www.git-tower.com/learn/git/faq/undo-last-commit)
- git reset --soft HEAD~1
- Undo commits permanently: git reset --hard HEAD~3
  * The last three commits (HEAD, HEAD^, and HEAD~2) were bad and you do not want to ever see them again.
- Undo a merge or pull inside a dirty working tree: git reset --merge ORIG_HEAD
- return to any previous revision
  * git reset --soft commit_hash
- [Reset committed changes to local changes](https://henrikwarne.com/2018/06/25/6-git-aha-moments/)
  * git reset HEAD~
##### undo git pull
- git reset --hard

#### Reset local branch to be same as remote branch
- git fetch --all
- git reset --hard upstream/master
- If need delete everything(just like re-clone): git clean -x -d -f

#### [~ vs ^](https://stackoverflow.com/questions/2221658/whats-the-difference-between-head-and-head-in-git)
- [Both ~ and ^ on their own refer to the parent of the commit.](https://mirrors.edge.kernel.org/pub/software/scm/git/docs/git-rev-parse.html)
- ~2 means up two levels in the hierarchy, via the first parent if a commit has more than one parent
- ^2 means the second parent where a commit has more than one parent (i.e. because it's a merge)
- HEAD~2^3 means HEAD's grandparent commit's third parent commit.

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
##### [Split a commit in two with Git](https://emmanuelbernard.com/blog/2014/04/14/split-a-commit-in-two-with-git/)
```bash
git rebase -i <oldsha1>
# mark the expected commit as `edit` (replace pick in front of the line), save and close
git reset HEAD^
git add ...
git commit -m "First part"
git add ...
git commit -m "Second part"
git rebase --continue
```
##### [Delete a commit]
- If it is the last commit this is very straight forward. git reset HEAD
```bash
git rebase --onto <branch name>~<first commit number to remove> <branch name>~<first commit to be kept> <branch name>
# e.g to remove commits 2 & 3
git rebase --onto repair~3 repair~1 repair
```

#### Branch
##### Checkout remote brach
- git branch shows local branch, sometimes some remote branches are not in local even after git fetch -all (when have multiple remotes), in this case:
  * [git checkout --track remote_name/remote_branch](https://www.git-tower.com/learn/git/faq/checkout-remote-branch)

- [which git branches are tracking which remote / upstream branch?](https://stackoverflow.com/questions/4950725/how-to-see-which-git-branches-are-tracking-which-remote-upstream-branch)
  - git branch -vv   # doubly verbose!
- [How to change the remote a branch is tracking?](https://stackoverflow.com/questions/4878249/how-to-change-the-remote-a-branch-is-tracking)
  - git branch branch_name --set-upstream-to your_new_remote/branch_name

#### [git log](https://git-scm.com/docs/pretty-formats)
- git log --oneline [--pretty=oneline]
##### Show commit id only
- git log -1 --pretty=format:"%H"

#### View change in a specific commit
- git show <revhash>

#### Undo anything
##### Wipes your unstaged changes
- git checkout <filename or directory>
##### undo rm -rf *
- git stash - if no local update
#### undo git commit --amend
- git reset --soft HEAD@{1}
##### [Checkout remote file after merge conflict](https://stackoverflow.com/questions/22565184/git-how-to-revert-after-a-merge-conflict-corruption)
- git checkout HEAD the_file

#### [shallow clone](https://git-scm.com/docs/git-clone)
- git clone --depth 1 https://path/to/repo/foo.git -b bar
- --no--single--branch instead -b bar, to download first commit form ALL branches.
- --no-checkout(-n): No checkout of HEAD is performed after the clone is complete.

#### ls-remote
git ls-remote --tags remote_git_url

#### Tags
- git tag

#### [git clean](https://git-scm.com/docs/git-clean)
- -n: --dry-run
- git clean -x -d -f

##### [Symbolic links in Git](http://www.mokacoding.com/blog/symliks-in-git/)

#### emoji
- [Emoji in Git Commit message](https://gitmoji.carloscuesta.me/)
- [Emoji in github](https://www.webfx.com/tools/emoji-cheat-sheet/)
- :+1:, :thumbsup:, :bug:

### Github
#### [Expand outdated Github Comments](https://github.com/broadinstitute/gatk/wiki/Expand-outdated-Github-Comments)
```javascript
javascript:Array.from(document.getElementsByClassName('outdated-comment')).forEach(l => l.classList.add('open'));
```
#### [Search - fork:true/false/only](https://help.github.com/articles/searching-in-forks/)

#### [Github API](https://developer.github.com/v3/)
- https://api.github.com/repos/apache/lucene-solr/git/refs/heads/branch_7x

- [issues](https://github.com/issues) to track all issue
- [pulls](https://github.com/pulls) to track all prs

### Misc
- [git status - show tracked files only](https://stackoverflow.com/questions/594757/how-do-i-do-a-git-status-so-it-doesnt-display-untracked-files-without-using)
  - git status -uno(--untracked-files=no)
- Delete all stashes
  - git stash clear
- [git add --interactive](https://coderwall.com/p/u4vjkw/git-add-interactive-or-how-to-make-amazing-commits)
- [The following untracked working tree files would be overwritten by merge](https://stackoverflow.com/questions/17404316/the-following-untracked-working-tree-files-would-be-overwritten-by-merge-but-i/33803997)
  - The problem is that you are not tracking the files locally but identical files are tracked remotely so in order to "pull" your system would be forced to overwrite the local files which are not version controlled.
```bash
git add * 
git stash
git pull
```
