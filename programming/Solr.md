#### AssertionError: SecureRandom algorithm 'NativePRNG' is in use by your JVM, which is a potentially blocking algorithm on some environments
- 

### Dev Setup
#### [A cycle was detected in the build path of project](https://www.eclipse.org/forums/index.php/t/95704/)
- Preferences -> Java-> Compiler -> Building -> Circular Dependencies, change it from Error to Warning


### Code
```java
ClientUtils.toContentStreams(str, "text/xml")

// This will continue even if one fails
@com.carrotsearch.randomizedtesting.annotations.Repeat(iterations = 5)

@Rule public SimpleRepeatRule repeatRule = new SimpleRepeatRule();

//  For subclass, it returns logger for base class
LoggerFactory.getLogger(MethodHandles.lookup().lookupClass())
```
bin/solr -e cloud

bin/solr start -cloud -p 8983 -s "example/cloud/node1/solr" && bin/solr start -cloud -p 8984 -s "example/cloud/node3/solr" -z localhost:9983 && bin/solr start -cloud -p 7574 -s "example/cloud/node2/solr" -z localhost:9983

#### Commands
```
admin/collections?action=OVERSEERSTATUS
action=CLUSTERSTATUS&collection=collectionName
```

#### Troubleshooting
- solr/admin/collections?action=overseerstatus
  - If there is no overseer, the cluster would be in bad shape.
- solr/admin/collections?action=clusterstatus

#### Why a solr core is unloaded(deleted)
- When test LeaderTragicEventTest.corruptLeader, I found that solr deleted one core:
```log
9283 INFO  (qtp166609450-37) [n:127.0.0.1:62399_solr    x:collection1_shard1_replica_n2] o.a.s.c.SolrCore [collection1_shard1_replica_n2]  CLOSING SolrCore org.apache.solr.core.SolrCore@66d47f6e
...
at org.apache.solr.core.SolrCore.close(SolrCore.java:1520)
at org.apache.solr.core.SolrCore.closeAndWait(SolrCore.java:1354)
at org.apache.solr.core.CoreContainer.unload(CoreContainer.java:1517)
at org.apache.solr.handler.admin.CoreAdminOperation.lambda$1(CoreAdminOperation.java:105)
at org.apache.solr.handler.admin.CoreAdminOperation.execute(CoreAdminOperation.java:360)
at org.apache.solr.handler.admin.CoreAdminHandler$CallInfo.call(CoreAdminHandler.java:395)
at org.apache.solr.handler.admin.CoreAdminHandler.handleRequestBody(CoreAdminHandler.java:180)
at org.apache.solr.handler.RequestHandlerBase.handleRequest(RequestHandlerBase.java:199)
at org.apache.solr.servlet.HttpSolrCall.handleAdmin(HttpSolrCall.java:734)
```
But who called it and how?
#### The process
- First find "CLOSING SolrCore" in the code, and modify the code to print the stack trace when the method SolrCore.close is called.
- Next try to find who created the CoreAdminHandler(deleteXXX) request
There are different ways in Solr to 
- Create a CoreAdminRequest.Unload command and req.process(client)
- Create a ModifiableSolrParams and shardHandler.submit
  * Found this by searching usage of CoreAdminParams.DELETE_INDEX
  * DeleteReplicaCmd.deleteCore, OverseerCollectionMessageHandler.sendShardRequest, shardHandler.submit
- getOverseerCollectionQueue().offer message: Overseer.QUEUE_OPERATION, "deletereplica"
  * ZkController.giveupLeadership
Solr internally uses shardHandler or directly put message into OverseerQueue


### Logs
```log
SolrDispatchFilter.init
# OverseerElectionContext.runLeaderProcess(boolean, int)
I am going to be the leader
Invoked Collection Action :{} with params {}
path=/admin/collections AND action=RELOAD


```
#### Splunk
```log
CollectionName path=/update  NOT "update.distrib=FROMLEADER"  | rex field=message ".* 0 (?<time>\d*)"| timechart max(time)
xx | timechart count
```

### ZooKeeper
- [Run zkCli command in bash](https://stackoverflow.com/questions/34756953/how-to-run-zookeepers-zkcli-sh-commands-from-bash)
  * ./zkCli.sh -server server:port create /the_chroot []
- [Increase jute.maxbuffer for large node](https://stackoverflow.com/questions/22079622/how-to-clear-zookeeper-corruption)
  * [./zkCli.sh -Djute.maxbuffer=99999999](http://zookeeper.apache.org/doc/r3.3.3/zookeeperAdmin.html#Unsafe+Options)

### Tools
- [marple](https://github.com/flaxsearch/marple)

