
OutOfMemoryError happened in solr.


Used Eclipse mat to analyze it, the Dominator Tree looks ok, no huge object, but there are 2972 threads in the thread overview, there are 2920 update threads, each takes more than 3.87 m, totally takes more than 11.3 GB memory.

Maybe users were ingesting data too fast?

Let's check what these threads were doing at that moment?
They all stopped at same code, waiting for the lock at the VersionBucket: synchronized (bucket)
```log
org.apache.solr.update.processor.DistributedUpdateProcessor.versionAdd(Lorg/apache/solr/update/AddUpdateCommand;)Z (DistributedUpdateProcessor.java:1005).
<local> org.apache.solr.update.VersionBucket @ 0x59584c388 Busy Monitor
```

```sql
select updateCmd.solrDoc._fields from org.apache.solr.update.AddUpdateCommand updateCmd

SELECT updateCmd.solrDoc._fields.get("id") FROM org.apache.solr.update.AddUpdateCommand updateCmd 

SELECT * FROM java.lang.String s WHERE toString(s) = "148673659596228432"
```

