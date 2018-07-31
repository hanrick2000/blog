

### Threaddump Analysis
- Tools: [fastthread.io](https://fastthread.io)
- [TIMED_WAITING vs WAITING](https://blog.fastthread.io/2016/07/20/whats-the-difference-between-blocked-waiting-and-timed_waiting-explained-to-real-life-examples/)
#### How to find thread
- top -Hp <pid>, then convert the id to hex(printf 0x%x $thread_id), search it in thread dump


<!-- Bug in the following code: WAITING vs TIMED_WAITING:

wait(TimeUnit.NANOSECONDS.toMillis(nanosTimeout));

[beaster] "qtp261698385-112" #112 prio=5 os_prio=31 cpu=799.10ms elapsed=123.36s tid=0x00007ff5cd66d800 nid=0x1ea03 in Object.wait()  [0x000070001417a000]
[beaster]    java.lang.Thread.State: WAITING (on object monitor)
[beaster] 	at java.lang.Object.wait(java.base@11.0.2/Native Method)
[beaster] 	- waiting on <0x00000007ed6ae158> (a org.apache.solr.update.VersionBucket)
[beaster] 	at org.apache.solr.update.VersionBucket.awaitNanos(VersionBucket.java:66)
[beaster] 	at org.apache.solr.update.processor.DistributedUpdateProcessor.doWaitForDependentUpdates(DistributedUpdateProcessor.java:593)
[beaster] 	at org.apache.solr.update.processor.DistributedUpdateProcessor.lambda$waitForDependentUpdates$1(DistributedUpdateProcessor.java:536)
[beaster] 	at org.apache.solr.update.processor.DistributedUpdateProcessor$$Lambda$524/0x0000000800768040.apply(Unknown Source)
[beaster] 	at org.apache.solr.update.VersionBucket.runWithLock(VersionBucket.java:50)


https://blog.fastthread.io/2016/07/20/whats-the-difference-between-blocked-waiting-and-timed_waiting-explained-to-real-life-examples/
nanosTimeout>0, but it may be 0 after convert to millseconds.... -->