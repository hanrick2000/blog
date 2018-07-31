#### [Run eclipse mat in headless mode](https://wiki.eclipse.org/MemoryAnalyzer/FAQ)
- java -Xms8g -Xmx12g -jar mat.app/Contents/Eclipse/plugins/org.eclipse.equinox.launcher_1*.jar -application org.eclipse.mat.api.parse java_pid2992.hprof org.eclipse.mat.api:suspects org.eclipse.mat.api:overview org.eclipse.mat.api:top_components

#### [Map access](https://www.eclipse.org/forums/index.php/t/1095354/)
```sql
SELECT toString(t.key), toString(t.value) FROM OBJECTS ( SELECT OBJECTS s[0:-1] FROM INSTANCEOF java.util.HashMap s  ) t WHERE toString(t.key).contains("e")

SELECT OBJECTS FROM INSTANCEOF org.apache.lucene.uninverting.FieldCacheImpl.CacheKey c
```

#### OQL Example
- [DISTINCT](https://bugs.eclipse.org/bugs/show_bug.cgi?id=241154)
  - SELECT DISTINCT OBJECTS classof(s) FROM java.lang.String s 
```sql
SELECT toString(o.value[0]) FROM java.util.HashMap$Node o WHERE ((o.key != null) and o.key.toString().equals("q"))

SELECT toString(o.name) FROM org.apache.solr.core.SolrCore o

-- use $ for nested class
SELECT c FROM org.apache.lucene.uninverting.FieldCacheImpl$CacheKey c
SELECT toString(c.field) FROM org.apache.lucene.uninverting.FieldCacheImpl$CacheKey c 
```
- [get static fields of a class in a heap dump](https://stackoverflow.com/questions/3976470/get-static-fields-of-a-class-in-a-heap-dump-in-oql)
```sql
SELECT c.SIZE
FROM INSTANCEOF java.lang.Class c
WHERE c.@displayName.contains("class java.lang.Integer ")
```

- Use the INSTANCEOF keyword to include objects of sub-classes into the query
- Use the OBJECTS keyword if you do not want to process the term as classes.
- 
#### Plugins
- [SQL - MAT Calcite plugin](https://github.com/vlsi/mat-calcite-plugin)
  - support joins, filters, group by, order by
```sql
select toString(file) file_str, count(*) cnt, sum(retainedSize(this)) sum_retained, sum(shallowSize(this)) sum_shallow
  from java.net.URL
 group by toString(file)
having count(*)>1
 order by sum(retainedSize(this)) desc

SELECT toString(field) from "org.apache.lucene.uninverting.FieldCacheImpl$CacheKey" c  group by toString(field)
```

#### Problems
- [IllegalStateException: The platform metadata area could not be written](https://www.eclipse.org/forums/index.php/t/214452/)
```
-data
./work
```

<!-- final String replicaCoreName = replica.getStr(ZkStateReader.CORE_NAME_PROP);
core="lp_dragon-9_shard22_replica1"

SELECT toString(r.name), toString(r.nodeName), toString(r.state.toString()) FROM org.apache.solr.common.cloud.Replica r 


select * from org.apache.solr.common.cloud.Replica r where r.nodeName.toString().equals("10.139.5.12:8988_solr") and r.name.toString().equals("core_node60")


select * from org.apache.solr.common.cloud.Replica r where r.nodeName.toString().equals("10.139.5.12:8988_solr") and r.name.toString().equals("core_node60")

select * from org.apache.solr.common.cloud.Replica r where r.nodeName.toString().equals("10.139.5.12:8988_solr") and r.name.toString().equals("core_node58")

select * from org.apache.solr.common.cloud.Replica r where r.nodeName.toString().equals("10.139.5.12:8988_solr") and r.name.toString().equals("core_node1") // lp_dragon-4_shard1_replica1

- state recovering -->