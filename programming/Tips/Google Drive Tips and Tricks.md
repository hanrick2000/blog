---
description: Use google drive effectively by using keyboard shortcuts search syntax and how to reduce space usage share files in the web and more tips
---
<!-- <link rel="canonical" href="https://lifelongprogrammer.blogspot.com/2018/06/awesome-tips-about-chrome.html" /> -->

##### [Awesome Tips about Chrome Series](https://lifelongprogrammer.blogspot.com/search/label/Chrome_Series){target="blank"}
<script src="https://lifelongprogrammer.blogspot.com/feeds/posts/default/-/Chrome_Series?orderby=updated&amp;alt=json-in-script&amp;callback=series&amp;max-results=20"></script>

---

#### [Keyboard shortcuts for Google Drive](https://support.google.com/drive/answer/2563044)
Use keyboard shortcuts, we can avoid to use right click menu or trackpad, check here for [why and how to use more keyboard, use less trackpad](https://lifelongprogrammer.blogspot.com/2019/06/how-to-use-less-trackpad-more-key-board.html)

<center>

|                                                |               |
|:---------------------------------------------- |:-------------:|
| Display keyboard shortcuts list                |   Command+/   |
| **Search your Drive**                          |     **/**     |
| **Rename selected item**                       |     **n**     |
| **Move selected items to new folder**          |     **z**     |
| **Add selected items to an additional folder** | **Shift + z** |
| Share selected item                            |    Period     |
| Star or unstar selected items                  |       s       |
| **Delete selected items**                      |     **#**     |
| **More actions(right click context) menu**     |     **a**     |
| Current folder actions menu                    |       f       |
| Open Create menu                               |       c       |
| Show or hide details pane                      |       d       |
| Show or hide activity pane                     |       i       |
| Select or deselect item                        |       x       |

</center>

#### Search Tips and Tricks for Google Drive
##### More Search Tools
Type "/" to go to search bar, you can find "More search tools" at the bottom. You can specify file type, owner, location, date modified, etc.

#####  Search Syntax
- Common search syntax: **OR, AND, -, "phrase"**
- **title:** - search only the documents that include that specific keyword in their title
- **is:trashed** - find files in trash folder

**Search by Owner**

- find files owned by this user: type user's email first(Google Drive can auto autocomplete the gmail name), then add "owner:" prefix.
- owner:me: files owned by me
- -owner:me: files shared with me, owner not me.

**Find shared files**

- to: find all the files shared with that
- with: show files shared by that user

**Search by Type**

- type:pdf, spreadsheet, presentation, image, video, audio
- For other types, we need use MIME types:
  - type:application/msword, type:application/vnd.ms-excel, type:application/zip, type:image/jpeg
- before:YYYY-MM-DD after:YYYY-MM-DD

**Search in a folder**

- Search and go to that folder, then click the folder at the top(or type **f** for show folder action menus), then click "Search with the folder_name".

#### Manage Storage: Use Less Space to Store More Files
- Open settings(shortcut: t), click the **View items taking up storage** to find out what files are using most spaces.
- or access **drive.google.com/drive/quota** directly
- Caveat: the files in trash would not shown in the here.

##### Delete Files from Trash Folder
When we delete a file in Google Drive, it will be put into trash folder and thus still take your space.

When you are out of space, you can try to delete files from trash or empty trash folder. Be sure to know what you you are doing, as if we delete them from trash folder, they would be gone forever.

##### Check Whether a File Use Storage or Not
Google Drive may or may not use storage limit for files like videos: if we backup them with high quality option, it will not use storage.

To check whether a file uses storage or not, open the details vide by shortcut: 'd' or click **More Actions** at the top menu bar and choose **View Details**,

##### Backup Files using [Backup and Sync App](https://www.google.com/drive/download/) with **High Quality**
- If you don't mind the reduced quality, when backup, choose "High Quality" for Free unlimited storage for videos and photos.\
  - This "High Quality" option only works for backup, NOT sync: it means videos, photos you synced using the App would still use original quality and thus use storage.
  - Files you upload to drive would still use original format, thus use storage limit.
  Don't upload big video or images files directly using the web to drive, use the [Backup and Sync App](https://www.google.com/drive/download/)
  - To keep files with original quality, we can zip these files and store them into another Google drive account.
- We can add the files in backup to other folders: go to **Computers** side bar in Drive, choose the file then click **Add to My Drive** in the context menu.

<!-- - When backup, choose "High Quality" for Free unlimited storage for videos and photos.\
  - This "High Quality" option only works for backup, NOT sync: means videos, photos you synced would still use original quality and thus count as storage. -->
<!-- - But Google Drive also provides unlimited storage for videos as long as we choose Hight Quality, NOT original quality. -->

##### Transfer Files to Others
Files that shared with you would not count as against your quota. You can transfer these big files into another account.

[We can only transfer ownership of Google files like Google Docs/Sheets/Slides etc.](https://support.google.com/drive/answer/2494892])

[To transfer videos to another account](https://support.google.com/drive/forum/AAAAOxCWsTofWmQlYEi9ok/)

- Share the file with another account
- Collaborator makes a copy of the file and share it with the original account
- In the original account, delete the original file permanently and move the shared file into appropriate folder.

##### Sync folders using [Backup and Sync App](https://www.google.com/drive/download/)
- We can specify what Folders in Google Drive would be synced to local laptop.


<!-- Change in Google drive or local laptop for these folders would be syced bidirectionally. -->


<!-- #### Add Files into Google Drive
We can save files directly into Gmail, we can move file into right folder using the **Organize** button, or re-click the save to drive button. -->

#### Organize Files/Folders
There are many ways to add files into Google Drive
- Choose **Save to Google** at print dialog
- in iPhone, use its share function to copy the file to Drive.

##### Raw Files in Root Folder
Be aware that files(like pdf, videos) including those created in future in the root(/) folder would be also synced into local laptop.

<details><summary>Google should improve this</summary>

- Google should improve this: as usually we save files into root folder, then we move it to right folder. But Google Drive already synced files to local laptop then delete it locally. Kind of waste computation resource.
- For example when we save to Google drive at the print dialog, we can't set the destination folder. Though we can change the file name at the advanced settings.
- Google Drive can fix this by simply create a default "GoogleDriveDownload" folders, all files are stored in this folders by default.
</details>


##### Put files into right folders
Be sure to rename the file to a better name and put it into right folder.

We may not be able to put files in the right folder when we are saving it to Google Drive for example during print. But be sure to go to Drive to rename and move it: the newly added files will be shown at Quick Access section or check the **recent** tab at right side.

<!-- - If we are not specifying the folder when save it to Drive, by default, it would be in the root folder /.
  - We may want to put the file into a different folder, -->

<!-- - Newly added files will be listed at Quick Access. -->

<!-- - Don't create too many folders in the first layer or each layer.
  - It would be difficult to scroll to find the folder: Google Drive doesn't support search and prefix in the move file dialog. -->

<!--
#### Sharing

Check who has access

- we can find this info at the details panel in Google Drive,

when we open the file in Google Docs, share button at the top right

Share with specific persons, or get sharable link: anyone with the link can access it


we can publish google files into web
it's difficult to know
we can only figure it out File -> publish to web. 

-->


#### Share Files on the Web
##### [Embedding a PDF From Drive into a Blog](http://www.benschersten.com/blog/2014/04/embedding-a-pdf-from-drive-into-a-blog/)
```markdown
<iframe src="https://docs.google.com/viewer?srcid=[file id]&pid=explorer&efh=false&a=v
&chrome=false&embedded=true" width="580px" height="480px"></iframe>
```

##### [Embedding a DPF from internet into a Blog]
```Markdown
<iframe src="https://drive.google.com/viewerng/viewer?url=the_url&amp;embedded=true"
allowfullscreen="" frameborder="0" scrolling="no"></iframe>
```

##### Embed Images from Google Drive into Website
- Get a shareable link from the image in Google drive and replace the id `https://drive.google.com/uc?export=view&id={fileId}`
- [This link seems to be subject to quotas. So not ideal for public/massive sharing.](https://stackoverflow.com/questions/10311092/displaying-files-e-g-images-stored-in-google-drive-on-a-website)
```markdown
![](http://drive.google.com/uc?export=view&id=1HfeI-lL69kP9gexkV3VoajLLWDp_riCu)
```

#### More Tips about Google Drive
- Pull out text from images by opening it with google docs
- Use [Grammarly](https://chrome.google.com/webstore/detail/grammarly-for-chrome/kbfnbcaeplbcioakkpcpgfkobkghlhen) in Google Docs for fixing spelling and grammar error.
- **Ctrl+Shift+F** to toggle compact mode in Google Docs.

##### Whoops! There was a problem playing this video
You can try to open it in another window.

Try to open it in incognito mode or another browser.\
- This may happen if you open more than one account in Chrome, and the account you signed in Chrome doesn't have access to your videos.

<!-- ##### Compact mode in Google Docs: Hide the menu mode
We can hide
Click **Hide the menu mode** at top right\
- Ctrl+Shift+F seems not work

How to exit **Hide the menu mode**?\
Click it again, but some cases, that menu is not visible (bug here)\
1. we can click the explore button at bottom right, then we will be able to see the **Hide the menu mode** icon.
2. Or type "Full screen" at top left **search the menu** to enter full screen mode, then press **esc** to exit the full screen mode -->

<!-- preview vs open it -->
<!-- #### Related:
- [Embedding PDFs without using JavaScript with embed, iframe, object](https://pdfobject.com/static/) -->
<!-- - use **Ctrl+Option+Z or Option+/(in compact mode)** to search and execute command
- Click ![](https://lh3.googleusercontent.com/vvhIoImkCw8IkwaKXKWIiYiCUlYihV-c-Igd6GLdeaYBBumgtolgE42VnVXbM_KYAA=w18-h18) or `Cmd+Option+X` in the top left toolbar. -->