
#### NoClassDefFoundError within anonymous class
##### The Symptom
```log
Caused by: java.lang.NoClassDefFoundError: NettyChunkedInputStream$1
        at NettyChunkedInputStream.close(NettyChunkedInputStream.java:245)
        at sun.nio.cs.StreamDecoder.implClose(StreamDecoder.java:378)
        at sun.nio.cs.StreamDecoder.close(StreamDecoder.java:193)
        at java.io.InputStreamReader.close(InputStreamReader.java:199)
```
##### The Code
```java
request.getChannelHandlerContext().executor().execute(new OneTimeTask() {
    @Override
    public void run() {
        clearQueue();
    }
});
```
##### The Root Cause
- Due to conflict jar, the netty jar in built war doesn't contain OneTimeTask class
- The first time, it throws the following exception. 
```log
Caused by: java.lang.NoClassDefFoundError: io/netty/util/internal/OneTimeTask
...
Caused by: java.lang.ClassNotFoundException: io.netty.util.internal.OneTimeTask
```
- After that it will (always) throw the previous NoClassDefFoundError: NettyChunkedInputStream$1

#### References
- [3 ways to solve java.lang.NoClassDefFoundError in Java J2EE](https://javarevisited.blogspot.com/2011/06/noclassdeffounderror-exception-in.html)
- [Difference between ClassNotFoundException vs NoClassDefFoundError in Java](https://javarevisited.blogspot.com/2011/07/classnotfoundexception-vs.html)




