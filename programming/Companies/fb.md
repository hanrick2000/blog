
### Data
#### [Photos](https://code.fb.com/core-data/needle-in-a-haystack-efficient-storage-of-billions-of-photos/)
- 1.5PB data, 
- 15 billion photos, stores four images of different sizes
- 220 million new photos per week25TB of additional storage consumed weekly

- facebook's TAO to store and query Social Graph
  - how fb evolves its graph search from typehead, tao to 
- Haystack system to store and get photos

- live video


- FB use MySql mostly as a key-value store; JOINing tables is just impossible at their scale. Then they put memcache servers in front of the databases and application servers


- Edge Rank
### Multifeed – Multi-fetch and aggregate stories at read time
- Facebook aggregates the home feed on demand (from in-memory stores called "leaf servers")

### MemCached
- mcrouter

### MySQL
- [Wormhole](https://code.fb.com/core-data/wormhole-pub-sub-system-moving-data-through-space-and-time/)
  - 

- RocksDB - levelDB

- socially relevant/proximity


### Why fb
- open source:
  - RocksDB, Thrift
### tech stacks?
- MySQL, MemCached, HBase

- papers
- https://code.fb.com