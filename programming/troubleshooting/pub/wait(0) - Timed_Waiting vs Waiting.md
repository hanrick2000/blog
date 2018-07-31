### The Problem
- Reported occasional lock-ups when beasting PeerSyncTest in my jira [Use timed-out lock in DistributedUpdateProcessor](https://issues.apache.org/jira/browse/SOLR-12833), which also contains the threaddump.txt.

### Troubleshooting
The first step is to reproduce this problem:

- verify the problem by running the ```ant beast``` command
- try to reproduce in IDE and debug mode
  - Add ```@com.carrotsearch.randomizedtesting.annotations.Repeat(iterations = 50)``` in PeerSyncTest
  - Add breakpoint at ```throw new RuntimeException(e);``` in ```VersionBucket.awaitNanos```

### Troubleshooting: another clue
Another clue from the threaddump would also help to troubleshoot the issue:

- we are using wait(timeout) in the code, but the thread was in **WAITING** status, not **TIMED_WAITING** status
- From [TIMED_WAITING vs WAITING](https://blog.fastthread.io/2016/07/20/whats-the-difference-between-blocked-waiting-and-timed_waiting-explained-to-real-life-examples/)

  - WAITING: waiting indefinitely:
    - Object#wait() with no timeout
    - Thread#join() with no timeout
    - LockSupport#park()
  - TIMED_WAITING: waiting for up to a specified waiting time
    - Thread#sleep()
    - Object#wait() with timeout
    - Thread#join() with timeout
    - LockSupport#parkNanos()
    - LockSupport#parkUntil()
```log
[beaster] "qtp261698385-112" #112 prio=5 os_prio=31 cpu=799.10ms elapsed=123.36s tid=0x00007ff5cd66d800 nid=0x1ea03 in Object.wait()  [0x000070001417a000]
[beaster]    java.lang.Thread.State: WAITING (on object monitor)
[beaster] 	at java.lang.Object.wait(java.base@11.0.2/Native Method)
[beaster] 	- waiting on <0x00000007ed6ae158> (a org.apache.solr.update.VersionBucket)
[beaster] 	at org.apache.solr.update.VersionBucket.awaitNanos(VersionBucket.java:66)
[beaster] 	at org.apache.solr.update.processor.DistributedUpdateProcessor.doWaitForDependentUpdates(DistributedUpdateProcessor.java:593)
[beaster] 	at org.apache.solr.update.processor.DistributedUpdateProcessor.lambda$waitForDependentUpdates$1(DistributedUpdateProcessor.java:536)
[beaster] 	at org.apache.solr.update.processor.DistributedUpdateProcessor$$Lambda$524/0x0000000800768040.apply(Unknown Source)
[beaster] 	at org.apache.solr.update.VersionBucket.runWithLock(VersionBucket.java:50)
```

### The root cause
- The root cause is in the following code: the precondition is nanosTimeout>0, but after convert it to millseconds, it may be 0
- wait 0 or -1 would wait for ever.
- The fix would be simple: only wait if millseconds>0.
```java
public void awaitNanos(long nanosTimeout) {
  try {
      wait(TimeUnit.NANOSECONDS.toMillis(nanosTimeout));
  } catch (InterruptedException e) {
    throw new RuntimeException(e);
  }
}
```

### Why didn't capture this problem before?
- The problem doesn't always happen: it may happen after run same test about 10 times. 

### How to prevent it happen again?
- Always run ```ant beast -Dbeast.iters=50 -Dtests.slow=true -Dtests.badapples=true -Dtests.asserts=true``` before create the pr.
- Use the existing powerful powerful server to run ```ant test``` and ```ant beast```.
- Make sure every change is tested.
- Run the (newly added, related) tests multiple times by [\@com.carrotsearch.randomizedtesting.annotations.Repeat(iterations = 5)](https://github.com/randomizedtesting/randomizedtesting/wiki) or [SimpleRepeatRule](https://www.codeaffine.com/2013/04/10/running-junit-tests-repeatedly-without-loops/)

### What Knowledge we learned?
- wait
  - negative value: throw IllegalArgumentException
  - 0: wait forever until it's awakened
- condition.awaitNanos
  - 0 or negative value: return immediately
- when we convert numbers between different units, be careful:
  - overflow
  - underflow: 0 in this case
- be careful of special cases :0 

### Misc
#### Threaddump Analysis
- Tools: [fastthread.io](https://fastthread.io)
- [blog.fastthread](https://blog.fastthread.io/)

#### Another mistake made
- When add data/fields, we need understand how this object is used, how many instances in one core/node/clusters
- Increase 100 bytes in one object may be insignificant, but it would be a problem if there are 10K or more instances.