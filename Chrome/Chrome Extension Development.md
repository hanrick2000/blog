#### [Extension Development](https://developer.chrome.com/extensions/overview)
- Partition code into background scripts and content scripts
- [Content Scripts](https://developer.chrome.com/extensions/content_scripts)
    - Run in the context of web pages
    - limited access to Chrome APIs
    - Use Chrome Dev Tools to debug it
- Background Scripts
    - Full access to Chrome APIs, but no access to web page content
    -  Use background.html page in chrome://extensions/ to debug it
- [Message Passing](https://developer.chrome.com/apps/messaging)
    - Some functions can be only run in context scripts, some only in background script, use message passing to pass data in different context
    - [Disable Blocking of Mixed Content](https://stackoverflow.com/questions/36348559/chrome-extension-disable-blocking-of-mixed-content)
    - chrome.tabs.sendMessage, chrome.extension.onMessage.addListener
- [chrome.commands|shortcuts](https://developer.chrome.com/apps/commands)

##### APIs
- chrome.contextMenus.create
- window.getSelection()

