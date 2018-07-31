### [InterruptedException](https://daniel.mitterdorfer.name/articles/2015/handling-interruptedexception/)
#### [Meaning of InterruptedException](https://www.ibm.com/developerworks/library/j-jtp05236/)
- 
- Thread#interrupt(): set the interrupt status, a way to ask other threads to stop
- interrupted(): return interrupt status and reset it, isInterrupted(): check the interrupt status
- Thread.sleep/join, Object.wait: if any thread has interrupted the current thread. The interrupted status of the current thread is *cleared*
```java
// kindly convert the InterruptedException to a RuntimeException(client doesn't need to handle it explicitly)
public static Throwable solr.SolrZkClient.checkInterrupted(Throwable e) {
  if (e instanceof InterruptedException)
    Thread.currentThread().interrupt();
  return e;
}
// https://www.yegor256.com/2015/10/20/interrupted-exception.html
catch (InterruptedException ex) {
  Thread.currentThread().interrupt(); // Here!
  throw new RuntimeException(ex);
}
```

#### GC
- Young Generation (Eden > Survivor) -> Old Generation

##### Concurrent Mark & Sweep GC (CMS)
- can only collect the old generation concurrently, it still needs to halt the application to collect the young generation
##### G1
- [Not contiguous, splitted into small fix-sized (about 2Mb by default) region](https://www.dynatrace.com/news/blog/understanding-g1-garbage-collector-java-9/)
- more predictable pause times: XX:MaxGCPauseMillis
- adjust young gc size automatically

##### ZGC
- [coloured pointers](https://www.opsian.com/blog/javas-new-zgc-is-very-exciting/)
- load barriers
- incremental

#### Memory Leak
- add listener but forget to remove it
- bogus/modifiable keys in hashmaps
- static collections, references
  - [File.deleteOnExit in long running app](https://stackoverflow.com/questions/40119188/memory-leak-on-deleteonexithook)
- forget to clear ThreadLocal
- Wrong implementation of equals/hashcode, compare
- Classloader Leaks

