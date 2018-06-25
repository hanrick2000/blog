
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


