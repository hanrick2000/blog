### log-structured storage
### Column Family(Table)
- schema-free
- rows can have different columns


#### Advantage of NoSQL
- Horizontal scalability, much easier to add more hosts: automatically rebalance the data

### Design
- Masterless architecture: all of its nodes are functionally equal

- session coordinator
- wide column
- Different rows may have different columns, we can dynamically create fields as they are required

### [How to read data](docs.google.com/document/d/1L9vnHBGEWDSuL2uMzVYWjP698eTvy6_SKf5QaaMwt9Q/edit)
<img src='https://wiki.apache.org/cassandra/ReadPathForUsers?action=AttachFile&do=get&target=CassandraReadPath.png' />
- only requests the full replica from one node and then asks for checksums from other nodes based on the consistency level
- prefer lower latency nodes when requesting the entire record
- based on recent performance and whether the node in question is currently undergoing a compaction

### How to optimize read
- The local coordinator sends a read request to the fastest replica
- row cache -> BloomFilter -> Key cache
- [row cache buffers fully merged row: for hot frequently accessed rows](http://saugereau.github.io/blog/2014/12/cassandra-cache/)
  - invalidated during write
  - if not in row cache, read MemTable and SSTable at same time and merge them
- BloomFilter
  - whether an SSTable has data for a particular row
    - The more bloom_filter_fp_chance the less memory it used
  - separate heavy-loaded data and lower-demanded data into discrete tables
- Key cache for each SSTable
- in memory cache, on disk index
- If key cache misses, Partition Summary -> Partition Index

- [speculative retry](https://medium.com/@chirag.singla/rapid-read-protection-in-cassandra-a2fbcdb4ac72)
- [Leveled compaction](https://www.datastax.com/dev/blog/leveled-compaction-in-apache-cassandra)
  - within a level, there are no overlapping SSTables

### Consistency Level for read


### How to write data
<img src='https://wiki.apache.org/cassandra/WritePathForUsers?action=AttachFile&do=get&target=CassandraWritePath.png' />
- Replication factor is configurable
- Replication can be configured to work across data-centers also.
- Failed nodes' data is automatically replicated to maintain replication factor.
- Writes are idempotent: always store timestamp
- never read before writes except for counters and MV
- Partitioner to decide which nodes receives the data
- Using replication strategy to decide other replicas
- each column contains timestamp

#### commitlog
- transaction log, write ahead log
- crash recovery log, can be used to rebuild MemTable
- memory-mapped log, and compressed
- synced to disk periodically

#### MemTable
- mutable and read-write
- sorted, one MemTable on each node for one table
- flushed to SSTable on disk when MemTable or CommitLog size exceeded

#### SSTables(Sorted Strings Table)
- immutable

#### Files
- Data.db
- Primary Index (Index.db)
- Bloom filter (Filter.db)

##### Meta data
- Compression Information (CompressionInfo.db)
  - A file holding information about uncompressed data length, chunk offsets and other compression information
- Statistics (Statistics.db)
- Digest (Digest.crc32, Digest.adler32, Digest.sha1)
  - A file holding adler32 checksum of the data file
- CRC (CRC.db)
  - A file holding the CRC32 for chunks in an uncompressed file.

- SSTable Index Summary (SUMMARY.db)
  - A sample of the partition index stored in memory
- SSTable Table of Contents (TOC.txt)
  - A file that stores the list of all components for the SSTable TOC


#### SASI(SSTable Attached Secondary Index)
- attached to the SSTable itself
- requiring only a single pass to read both the index and the underlying data.
#### Materialized Views
- builds a new table with the indexed column as a partition key, and a user-chosen subset of columns as values
- Automated, server-side denormalization of data(asynchronously)
- read-before-write to update each materialized view
- base table and MV could be on different nodes
- 1:1 pair between base and MV replica

### [Tombstone for delete](https://medium.com/@foundev/domain-modeling-around-deletes-1cc9b6da0d24)
- heavy delete would be a problem for C*
- 10 days(gc_grace_seconds) after a delete is issued the tombstone and all records related to that tombstone are removed
- prevent deleted data from resurrecting
- never let a node stay down for longer than this time period

### TTL at write or table level

### Hinted Handoff(Sloppy Quorum)
- one of the replica nodes is unreachable during a write, then the system will store a hint on the coordinator node
- Hints are replayed to the replica node once the coordinator learns via gossip that the replica node is back online
- stores hints for up to 3 hours to avoid hint queues growing too long


### Gossip
- Membership changes and failure detection are performed by propagating the changes to a set of randomly chosen neighbors, who in turn propagate to another set of neighbors
- exchange state messages with up to three other nodes every second
- gossip messages are versioned
- seed nodes are only used for bootstrap
- 2 messages: SYN, ACK, ACK2
  - send states, and also merge back

### How to handle slow nodes
- speculative retry
- Dynamic Snitch
  - [records and analyses latencies of read requests to peer nodes](https://www.linkedin.com/pulse/gossip-protocol-inside-apache-cassandra-soham-saha/)
- how to handle new node, dead node
### Automatically rebalance data

### consistency model
- One
  - hinted handoff writes are not sufficient
- TWO, THREE
- QUORUM, ALL
- SERIAL
  - Permits reading uncommitted data as long as it represents the current state. Any uncommitted transactions will be committed as part of the read
- LOCAL_ONE, LOCAL_QUORUM, LOCAL_SERIAL
- EACH_QUORUM


### TTL at write or table level

## anti-entropy
### read_repair
- nodetool repair
- Every column has three parts: key, value, and timestamp
- Synchronous, Asynchronous, Manually
- incremental repairs
#### [Merkle trees](http://distributeddatastore.blogspot.com/2013/07/cassandra-using-merkle-trees-to-detect.html)
- repair coordinator node requests Merkle tree from each replica for a specific token range to compare them
#### [incremental repair](http://thelastpickle.com/blog/2017/12/14/should-you-use-incremental-repair.html)
- the immutable nature of SSTables
- it would be marked as such and never needed to be repaired anymore.
- anticompaction: separate repaired data from unrepaired data

### compaction
- [Size-tiered compaction](https://shrikantbang.wordpress.com/2014/04/22/size-tiered-compaction-strategy-in-apache-cassandra/)
  - compacted when there are multiple files of a similar size (the default is four)
  - Buckets are sorted according to their hotness. Cold bucket will get the less priority than hot buckets for compaction.
- [Leveled compaction](https://www.datastax.com/dev/blog/leveled-compaction-in-apache-cassandra)
  - good for read-heavy workloads, Rows Are Frequently Updated
  - each level represents tables that are 10 times larger than the next lower level
  - within a level, there are no overlapping SSTables
- Time-window compaction - time series, with TTLs
  - group data expiring at the same time into the same SSTables



### Usage
- nodetool repair

### Cross DC
- The coordinator determines the nodes that should own the replicas using consistent hashing and then sends the writes to those nodes, including one in each remote data center, which then acts as coordinator inside that data center.
Since we're using LOCAL_QUORUM, the coordinator will only wait for a majority of replica owning nodes in the local data center to acknowledge the write


- write is CPU-bound
- off heap 
#### [Data Model](http://www.datastax.com/dev/blog/basic-rules-of-cassandra-data-modeling)
- Rows(partition) Key
  - Rows are spread around the cluster based on a hash of the partition key
- Clustering keys(Column keys)
  - support range query
- Column: (column name+value) + timestamp
- PRIMARY KEY ((cluster, date), datacenter, hour, minute))
- wide rows: there can be more than one row per partition
- distribute/skew of the data
- read/write ratio
- Denormalizing using collections
- Denormalizing with materialized views
- Avoid hotspot

- [Partition Key: responsible for data distribution across your nodes](https://stackoverflow.com/questions/24949676/difference-between-partition-key-composite-key-and-clustering-key-in-cassandra)
- Clustering Key: data sorting within the partition


##### Rules
- Spread Data Evenly Around the Cluster
- Minimize the Number of Partitions Read
- Determine What Queries to Support
  - group, order, filter

##### Examples
- PRIMARY KEY ((groupname, hash_prefix), username)
  - if there’s one group with millions of users
- add date to partition key or time_bucket
- shard_id = now - (now % four_days)
  - split by x days not a single day
- WITH CLUSTERING ORDER BY (lastname ASC, firstname ASC));

#### Storage
```text
Row Key: Tom Clancy
=> (name=1987:Patriot Games:ISBN, value=0-399-13241-4)
=> (name=1987:Patriot Games:publisher, value=Putnam)
=> (name=1993:Without Remorse:ISBN, value=0-399-13825-0)
=> (name=1993:Without Remorse:publisher, value=Putnam)
```

- Data, Index, Filter, Summary, CompressionInfo and Statistics
- <keyspace>-<column family>-[tmp marker]-<version>-<generation>-<component>.db
##### Data file
- 


#### Data Types
##### small, bounded collections
- sets, lists, and maps

- SimpleStrategy
- NetworkTopologyStrategy
  - Rack awareness
  - replicas are placed in different racks

#### Components
- a global ResourceManager and one ApplicationManager on master
- NodeManager co-located with the DataNode