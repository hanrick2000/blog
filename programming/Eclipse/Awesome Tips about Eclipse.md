#### Plugins
- Sign in Eclipse marketplace and favorite plugins, then we can (re)install our favorites later

#### Shortcut
- [Maximize Active View or Editor](https://stackoverflow.com/questions/10400978/how-to-toggle-visibility-of-a-view-in-eclipse-with-a-keyboard-shortcut)
  * Add ctrl+m for 'Maximize Active View or Editor' in Keys

#### Tips
- [Use Dark Mode](https://www.eclipse.org/community/eclipse_newsletter/2018/june/darktheme.php)
- [Run Code Clean Up Manually(Ctrl+Alt+Command+C) + Save Action](https://lifelongprogrammer.blogspot.com/2017/01/eclipse-run-code-cleanup-manually-save-action.html)


#### Settings
- Share preferences between multiple workspace
  * Export from the origin workspace then import them to the new workspace
- Preferences Synchronization
- Eclipse 4.8 already sets Number of imports needed for .* andNumber of static imports needed for .* to 99.

- Eclipse persists when we change the size of content assist popup window
- [Unable to install breakpoint for CGLIB proxy objects](https://stackoverflow.com/a/45897882/753352)
  - clicking "Don't tell me again"
- [Add default vm arguments to JRE](https://stackoverflow.com/questions/36041510/eclipse-junit-how-to-default-vm-args-without-editing-jre)

- [Refresh resources automatically](https://stackoverflow.com/questions/1212633/can-eclipse-refresh-resources-automatically)
  - Preference -> Workspace -> refresh using native hooks or polling
- [Autosave editors](https://stackoverflow.com/questions/2635951/eclipse-save-automatically)
  - General > Editors > Autosave > check Enable autosave for dirty editors
- Search dialog(ctrl+h)
  - Customize... -> `Remember last used page`

##### [Java -> Compiler -> Errors/Warnings]
- Set error for:
  - unlikely argument type for equals() java
  - unlikely argument type for collections methods using objects

##### Absent line number information

#### Hovers (Java -> Editor -> Hovers)
- [force Javadoc hover on element that has a warning](https://stackoverflow.com/questions/21481370/eclipse-force-javadoc-hover-on-element-that-has-a-warning)
  - Press Command+Shift while hover
- [Show variable values while debugging]
  - Press Command while hover (added)

#### Format
- [Function calls -> Qualified invocations](http://www.lorenzobettini.it/2017/12/formatting-java-method-calls-in-eclipse/)
  - Wrap all elements, except first element if not necessary, and don't select "Force split"

#### Templates
##### Existing templates
- syso, syse, instanceof, main, switch, static_final, test, toArray, try_catch, try_finally
##### [eclipse-templates project](https://github.com/mnuessler/eclipse-templates)
- logger
##### Log method arguments
- Preferences > Java > Editor > Templates > New: name - logmeth
```java
// No need to wrap arguments in an object array
logger.info("${enclosing_method} {}", Arrays.toString(new Object[] {${enclosing_method_arguments}}));
```
##### Surround with
- select code then "cmd+option+z"
- example: lock, try_catch,

##### [variables we can use in templates](http://help.eclipse.org/kepler/index.jsp?topic=%2Forg.eclipse.jdt.doc.user%2Fconcepts%2Fconcept-template-variables.htm)

##### Quick fix
- [convert static field accesses and static methods to use a static import](https://www.eclipse.org/eclipse/news/4.9/jdt.php)

### [Debug](http://help.eclipse.org/2018-09/index.jsp?topic=%2Forg.eclipse.jdt.doc.user%2Ftips%2Fjdt_tips.html)
#### [Show toString() in value column of debug variables view](dlt-in-value-column-in-eclipse-debugger)
- Preferences -> Java -> Debug -> Detail Formatters:
  - select "Show variable details > As the label for all variables" (if toString() is enough for you)
  - select "> As the label for variables with detail formatters" if you want to use your custom formatters.
#### Variables View: Show Logical Structure
#### [New Detail Formatter](https://blog.codecentric.de/en/2013/04/again-10-tips-on-java-debugging-with-eclipse/)

### Troubleshooting
- Check the **Problems** and **Console** views if the new code change seems not working
  - build path issue in Problems view
  - ClassNotFoundException in Console view etc
- [A cycle was detected in the build path of project](https://www.eclipse.org/forums/index.php/t/95704/)
  - Preferences -> Java-> Compiler -> Building -> Circular Dependencies, change it from Error to Warning
- [Find which jar containing the class and the application is using](https://lifelongprogrammer.blogspot.com/2014/12/find-which-jar-containing-class-definition.html)
```java
java.security.CodeSource src = TheType.class.getProtectionDomain().getCodeSource();
return src.getLocation();
```
- [Breakpoint doesn't work because of multiple versions](https://lifelongprogrammer.blogspot.com/2014/12/find-which-jar-containing-class-definition.html)

#### Problems View
- [Only Show Errors/Warnings on Current Project](https://lifelongprogrammer.blogspot.com/2014/04/eclipse-only-show-problems-for-current-project.html)
- Group by Problem Type

#### Misc
- Use breakpoint to track code that you want to check later (add breakpoint then disable it)
- [How to view all items of Errors under Problems View](https://stackoverflow.com/questions/9719605/eclipse-how-to-view-all-items-of-errors-under-problems-view-in-eclipse-editor)
- [Always enable major upgrades](http://download.eclipse.org/releases/latest)
  - Enable the Latest Eclipse release http://download.eclipse.org/releases/latest repository by ticking the checkbox
#### Plugins
- [OS X Eclipse Launcher](http://marketplace.eclipse.org/content/osx-eclipse-launcher#.UGWfRRjCaHk)
  - Open a workspace in a new instance

<!-- TODOP -->