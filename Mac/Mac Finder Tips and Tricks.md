---
description: Mac finder tips to maximize finder window size, change default finder, search current folder, customize the sidebar/toolbar and all finder shortcuts we should know.
---

---

<details open><summary>
[Series: Awesome Tips about Mac](https://lifelongprogrammer.blogspot.com/search/label/Mac_Series){target="blank"}
</summary>
<script src="https://lifelongprogrammer.blogspot.com/feeds/posts/default/-/Mac_Series?orderby=updated&amp;alt=json-in-script&amp;callback=series&amp;max-results=20"></script>
</details>

#### Maximize Finder Window Size with Relaunch
The default Finder window size is way too small.

1. Keep only one finder window: as when Finder opens a new window, it uses the last accessed window size, if there are multiple windows, it's hard to tell which one Finder uses as the template.
2. Adjust the finder window size
- If you keep the Dock at the bottom, don't take the whole bottom of the screen, as it may conflict with the Docker: when we want to click "Path bar" at the bottom, it will accidentally show the Docker.
- Or we can move dock to the right side: at System Preference -> Dock, look for **Positions on Screen** and choose **right**.
3. Relaunch Finder
- Go to Apple menu -> Force Quit: (or **Command+Option+Esc**) to kill finder, Mac will relaunch Finder automatically.
- or click Alt(Option) key first then right click on the Finder in the docker, then click "Relaunch"

#### Change Default Finder Window other than default "Recents"
When we open a new finder, it opens "Recents" smart folder, but in most cases, we want to go to some folder, don't really care about recently added files.\
We can change the default folder to our frequently accessed folder at the General pane of Finder -> Preferences: for example the home folder, or the master folder that we hold all our files in work.

#### Search Current Folder instead of "This Mac"
At Preference -> Advanced tab, find "When performing a search:" at the bottom and choose **Search the Current Folder**.

#### Customize List/Icon View
- Command(⌘)+2 to change the current view to list, then Finder -> View -> choose "Show Viewer Options" or Command(⌘)+J, select "Always open in list view", then click "Use as defaults".
- Command(⌘)+1 to change the current view to icon, then Command(⌘)+J to open "Show Viewer Options": choose "Sort by Name", Unselect "Always open in icon view", then click "Use as defaults"

#### Customize the sidebar
- At Preference -> Sidebar tab, choose what to show and hide in sidebar.
- **Command+Ctrl+T**(or drag) to add frequently accessed folders to the sidebar.

<!-- #### Customize the View
- Show the Current Path the the bottom: Go to View > check **Show Path Bar** -->

#### Show Path Bar
- Show the Current Path the the bottom: Go to View menu > check **Show Path Bar**\
<!-- First go to Finder View's menu, check "Show Path Bar".  -->
When we right click on any folder in the path bar, then for any folder, we can **Copy xx as Pathname**, "Open in new Tab", "Show in Enclosing Folder"(go to that folder in current tab), "Get info".

#### Customize the Toolbar
Go fo Finder -> View -> choose "Customize the toolbar", we can add "Get info", "New Folder" buttons.

#### Quick Look
- Select one or more items then press the Space bar, use left, right to go to previous or next.
- Press Option key when press space to quick look in full-size.

#### Hold Option Key while Click
In the right context menu, press Option key would: \
- Change "Copy xxx" to "Copy xxx as Pathname"
- Change "Open with" to "Always Open with"
- Change "Quick Look x items" to "Slideshow x items"

<!-- #### Customize the View -->


#### [Everything about File or Folder Path on Mac](https://lifelongprogrammer.blogspot.com/2019/07/everything-about-file-or-folder-path-on-mac.html)
- Check [here for how to quickly copy file path or use shortcut to open (parent) folder in iTerm2(or Terminal)](https://lifelongprogrammer.blogspot.com/2019/07/everything-about-file-or-folder-path-on-mac.html)


#### Show Me More Info: Filename Extension and Hidden Files
- Check "Show all filename extension" at Advanced tab from Finder's Preference.
- Show hidden files
  - Run `defaults write com.apple.finder AppleShowAllFiles -bool YES && killall Finder`{.bash} at Terminal.
<!-- - Check "Keep Folders on Top when sorting by name" -->

#### Reveal Files in Finder in Spotlight
When search in Spotlight, use the arrow keys to select file:\
- hold **Command key(⌘)** would show the file path
- hold **Command key(⌘)** while press enter would show the file in Finder

#### Search, Saved Search(Smart Folder)
During search, we can specify conditions like: kind, file extension, created date, modified date, last opened date, and much more.\
We can directly delete files in search result.\
We can save the search as smart folder and add them into side bar for easy access.\

#### More Tips for Mac Finder
- We can lock a file by right clicking a file -> **Get info** -> select **Locked**.
- **Command+delete** to delete files and **Command+Option+delete** to delete files permanently
  - by default, deleted items would be sit in the Trash folder, **Command+Option+delete** would delete the file immedetiary and permanently.

##### Actions on multiple files
- After select multiple files, we can copy, rename, quick look, slideshow, compress them, put them into new folder.

##### Cmd-C then Opt-Cmd-V to Cut a File
It only works for files, not folder.

#### Finder Shortcuts We Should Know

|                             |                                                         |
|:--------------------------- |:------------------------------------------------------- |
| Command + N(T)              | New Finder Window(tab)                                  |
| Shift + Command + N         | New folder                                              |
| **Command + Delete**        | Move selected item to trash                             |
| Command + D                 | Duplicate selected files                                |
| **Control + Command + T**   | Add selected item to sidebar                            |
| **Command + O**             | Open selected item                                      |
| **Command + Down Arrow**    | In list view, opens the selected folder                 |
| **Command + Up Arrow**      | Go to enclosing folder                                  |
| **Command + 1(2,3,4)**      | View as icons(list, column, cover flow)                 |
| Command + Right(left) Arrow | In list view, expands(collapses) the highlighted folder |
| Command + [(])              | Go back(forward) to previous location                   |
| Command+Shift+G             | Go To Folder                                            |

<!-- Tab Completion is not very useful:
we have to type a prefix -->


<!--
add path, get info, new folder,

Avoid right click -->


<!-- Find and replace with -->