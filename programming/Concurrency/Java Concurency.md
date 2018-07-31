
##### Interruptible blocking

### Lock
- [Avoid deadlock by requesting and releasing locks in the same order](https://wiki.sei.cmu.edu/confluence/display/java/LCK07-J.+Avoid+deadlock+by+requesting+and+releasing+locks+in+the+same+order)
- [Use private final lock objects to synchronize classes that may interact with untrusted code](https://wiki.sei.cmu.edu/confluence/display/java/LCK00-J.+Use+private+final+lock+objects+to+synchronize+classes+that+may+interact+with+untrusted+code)
- [Do not synchronize on a collection view if the backing collection is accessible](https://wiki.sei.cmu.edu/confluence/display/java/LCK04-J.+Do+not+synchronize+on+a+collection+view+if+the+backing+collection+is+accessible)
- [Do not use an instance lock to protect shared static data, use static lock](https://wiki.sei.cmu.edu/confluence/display/java/LCK06-J.+Do+not+use+an+instance+lock+to+protect+shared+static+data)
- [Ensure actively held locks are released on exceptional conditions](https://wiki.sei.cmu.edu/confluence/display/java/LCK08-J.+Ensure+actively+held+locks+are+released+on+exceptional+conditions)
- [Do not perform operations that can block while holding a lock](https://wiki.sei.cmu.edu/confluence/display/java/LCK09-J.+Do+not+perform+operations+that+can+block+while+holding+a+lock)


#### Common Bugs
- Shard variables in multiple thread
  - Not read-only, all modified it
  - process.versionAdd(cmd) changes the cmd

#### ThreadPool
- invokeXX runs synchronously: it will wait task finish (vs submit)


- org.apache.solr.common.cloud.ZkStateReader.getUpdateLock()
