### The Problem
- Pulled lated Lucene-Solr's master code, made some code change, and found out that the code change is not picked up by Eclipse.

### Troubleshooting
- Checked Eclipse's Problems view, found that there are some build issue, like:
  - missing required library: 'solr/contrib/uima/lib/WhitespaceTokenizer-2.3.1.jar'
  - found ```<classpathentry kind="lib" path="solr/contrib/uima/lib/WhitespaceTokenizer-2.3.1.jar"/>``` in .classpath
- Checked how Lucene-Solr generate eclipse configuation files at build.xml:
  - it iterates some lib folders, add all jars in these folder into .classpath
```xml
<xslt in="${ant.file}" out=".classpath" style="dev-tools/eclipse/dot.classpath.xsl" force="true">
      <outputproperty name="indent" value="yes"/>
      <param name="eclipse.fileset.libs" expression="${eclipse.fileset.libs}"/>
      <param name="eclipse.fileset.sourcefolders" expression="${eclipse.fileset.sourcefolders}"/>
      <param name="eclipse.fileset.webfolders" expression="${eclipse.fileset.webfolders}"/>
    </xslt>
```

### How to Fix
- ```ant clean-jars jar``` to regenerate all jars then "ant eclipse"
- or ```git clean -x -fd``` to remove all unnecessary files: thus remove all jars 