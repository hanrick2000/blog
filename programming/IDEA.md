### [Show Fn keys on touchbar](https://stackoverflow.com/questions/43199785/jetbrains-products-not-showing-fn-keys-on-touchbar)
- Preferences -> Keyboard -> Shortcuts -> Functions keys, add apps under ~/Library/Application Support/JetBrains/Toolbox/apps

#### [Case insensitive completion](https://stackoverflow.com/questions/14127381/intellij-idea-12-code-completion-without-capitalisation)
- Preferences -> Editor -> General -> Code completion -> Case sensitive completion > None

#### [Never use wildcard imports](https://stackoverflow.com/questions/3348816/intellij-never-use-wildcard-imports)
- Preferences -> Editor > Code Style > Java > Imports tab set Class count to use import with '\*' and Names count to use static import with '\*' to a higher value.

### Shortcut
- Change to Use Eclipse (Mac OS X) Shortcut
- IDEA's default MAC OS X 10.5+ uses too many function keys, and make its hard to remember/reason its meaning

|     |     |
| --- | --- |
Cmd+3|Enter action or option name
Ctrl+H|Find in path
<!--  old
Option+Return|Show intention action(Quick fix in eclipse)|
Cmd+F12|File structure(Ctrl+O in eclipse)
Cmd+O|Find by class(Ctrl+Shift+T in eclipse)
Cmd+Shift+O|Find File(Ctrl+Shift+R in eclipse)   -->

#### Change Navigate -> Declaration shortcut to Cmd+click by Adding Mouse Shortcut
- Original Ctrl+Click conflicts Mac's right click

#### Assign Cmd+F to Find

### Hard to remember shortcuts
|     |     |
| --- | --- |
Shift+F6|Rename
Cmd+Option+L|Format Code

- Use too many function keys, and make its hard to remember/reason its meaning

#### Live Templates
- Preferences > Editor -> Live Templates
  - psvm(main method), psfs

#### Debug
- Break on Exception
  - Run | View Breakpoints | Exception Breakpoints


#### Plugins
- [Lombok](https://projectlombok.org/setup/intellij)