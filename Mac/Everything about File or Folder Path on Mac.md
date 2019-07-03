---
description: In Mac, how to quickly copy path of a folder or file, how to go to a folder of a file in Terminal or iTerm2.
---

---

<details open><summary>
[Series: Awesome Tips about Mac](https://lifelongprogrammer.blogspot.com/search/label/Mac_Series){target="blank"}
</summary>
<script src="https://lifelongprogrammer.blogspot.com/feeds/posts/default/-/Mac_Series?orderby=updated&amp;alt=json-in-script&amp;callback=series&amp;max-results=20"></script>
</details>


#### Copy a File or Folder Path from Context Menu
Right click on a file to show the context menu, hold Option(⌥) key, "Copy xxx" will be changed to "Copy xx as Pathname".

#### Copy a File or Folder Path at Path Bar
First go to Finder -> open View menu, check "Show Path Bar", then right click at the path bar at the bottom, choose "Copy xx as Pathname".

#### Get File or Folder Path at iTerm2(or Terminal)
<!-- When we copy a file or folder, and paste it into the Terminal, it will paste the full path (all special characters are already escaped, so no need to add " "). -->

If we want to get the file or folder path in Terminal, "Ctrl+C" to copy the file or folder in Finder, then paste it into the Terminal: it will paste the full path (all special characters are already escaped, so no need to add " ").


<!-- For a folder, "Ctrl+C" in Finder, then type cd then paste in Terminal. (it will pastes the folder path here, and already escape all special characters, so no need to add \"\"). -->

#### Go to the Parent Folder (of a File or Folder) at Iterm2(or Terminal)
To go to the parent folder of a folder or especially for a file:

- First let's define the following **pcd** command in ~/.bash_profile which will go to the parent folder of the file; then `source ~/.bash_profile`{.bash}
  ```bash
  function pcd () { cd "$(dirname "$1")" ; pwd; }
  ```
- Then "Ctrl+C" at the selected file in Finder, then in Terminal type **pcd**, space, then paste the file.


#### "New iTerm2 Tab" in Finder
I use [iTerm2](https://lifelongprogrammer.blogspot.com/2018/06/working-effectively-with-iterm.html) as my default Terminal, but the approaches for [iTerm2](https://lifelongprogrammer.blogspot.com/2018/06/working-effectively-with-iterm.html) would also work for the default Terminal.

- After select a file, choose **New iTerm2 Tab** in the context menu, it will create a new tab and cd to the enclosing folder.
- After select a folder, choose "Services - > New iTerm2 Tab".


#### Assign Keyboard Shortcut to "New iTerm2 Tab" at Finder
- Go to System "Preferences -> Keyboard -> Shortcuts", choose "Services" in the left panel, find "New iTerm2 Tab" and assign a shortcut like: **Ctrl+Option+i**.
- To check whether the shortcut assignment works, we can go to Finder menu, Finder -> Services, check whether the new shortcut is shown for the "New iTerm2 Tab" menu item.
  - If the shortcut is not there and doesn't work, it's often because the shortcut we choose conflicts with other existing shortcuts.
- Now we can **Ctrl+Option+i** to open a new tab for any file at Finder.


<!--
If the shortcut you choose seems not working,
- Disable "New Terminal Tab at Folder", "New Terminal at Folder" and "Folder Actions Setup" at System Preferences -> keyboard -> Shortcuts -> Services tab. (as we don't use the default Terminal any more, and ) -->
