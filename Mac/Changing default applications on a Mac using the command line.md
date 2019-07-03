
Right click on the file to show the context menu, press Command key(⌘),

#### Why Use Command Line to Change Default Applications?


Every once we need install a new laptop for example in a new job,

#### Using duti
- `brew install duti`{.bash} to install

#### Check the default applications
- `duti -x filetype`{.bash}
```bash
duti -x md
# output:
# Xcode.app
# /Applications/Xcode.app
# com.apple.dt.Xcode
```


```bash
declare -a arr=("text" "cson")
for extension in "${arr[@]}"
do
  duti -s com.github.atom ${extension} all
done

duti -s com.github.atom text all
duti -s com.github.atom md all
```

duti -x cson
Failed to get default application for extension 'cson'

“default.html” can’t be opened because it is from an unidentified developer.

Your security preferences allow installation of only apps from the App Store and identified developers.

Go to **Security & Privacy**, in the General page, we can see the same error message there, click Open Anyway.

