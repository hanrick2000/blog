### Google Drive/Docs
- use **Ctrl+Option+Z or Option+/(in compact mode)** to search and execute command
- Click ![](https://lh3.googleusercontent.com/vvhIoImkCw8IkwaKXKWIiYiCUlYihV-c-Igd6GLdeaYBBumgtolgE42VnVXbM_KYAA=w18-h18) or `Cmd+Option+X` in the top left toolbar.
- Install and enable Grammarly on Google Docs

### Add Files into Google Drive
- We may not be able to put files in right folder when we are saving it to Google Drive for example during print or in Gmail. But be sure to go to Drive immediately: the newly added files will be listed at Quick Access.
- If we are not specifying the folder when save it to Drive, by default, it would be in the root folder /.
- Be sure to rename the file to a better name and put it into right folder.
<!-- - Newly added files will be listed at Quick Access. -->

#### Organize Files/Folders
- Don't create too many folders in the first layer or each layer.
  - It would be difficult to scroll to find the folder: Google Drive doesn't support search and prefix in the move file dialog.

- Undo the ops

#### Backup and Sync from Google.app
- To Upload/Backup local folders to Drive
- Sync Files/Folders from Drive to local laptop.

##### Free unlimited storage for videos and photos
- Google Photos also provides unlimited storage for photos
- But Google Drive also provides unlimited storage for videos as long as we choose Hight Quality, NOT original quality.

#### Compact: Hide the menu mode
- Click **Hide the menu mode** at top right
  - Ctrl+Shift+F seems not work
- How to exit **Hide the menu mode**
  - Click it again,
  - but some cases, that menu is not visible (bug here)
    1. we can click the explore button at bottom right, then we will be able to see the **Hide the menu mode** icon.
    2. Or type "Full screen" at top left **search the menu** to enter full screen mode, then press **esc** to exit the full screen mode

#### [Embedding a PDF From Drive into a Blog](http://www.benschersten.com/blog/2014/04/embedding-a-pdf-from-drive-into-a-blog/)
```markdown
<iframe src="https://docs.google.com/viewer?srcid=[put your file id here]&pid=explorer&efh=false&a=v&chrome=false&embedded=true" width="580px" height="480px"></iframe>
```

#### [Embedding a DPF from internet into a Blog]
```Markdown
<iframe src="https://drive.google.com/viewerng/viewer?url=https%3A//www.crackingthecodinginterview.com/uploads/6/5/2/8/6528028/cracking_the_coding_skills_-_v6.pdf&amp;embedded=true" allowfullscreen="" frameborder="0" scrolling="no"></iframe>
```

#### Embed Images from Google Drive into Website
- Get a shareable link from the image in Google drive and replace the id `https://drive.google.com/uc?export=view&id={fileId}`
- [This link seems to be subject to quotas. So not ideal for public/massive sharing.](https://stackoverflow.com/questions/10311092/displaying-files-e-g-images-stored-in-google-drive-on-a-website)

![](http://drive.google.com/uc?export=view&id=1HfeI-lL69kP9gexkV3VoajLLWDp_riCu)

#### Related:
- [Embedding PDFs without using JavaScript with embed, iframe, object](https://pdfobject.com/static/)

#### Whoops! There was a problem playing this video
