
## TAO: Facebook’s Distributed Data Store for the Social Graph
<img src='https://puncsky.com/img/tao-architecture.png' />
- MySQL databases -> durability
- separation of cache and persistent store has allowed those layers to be independently designed, scaled, and operated, and maximizes the reuse of components across our organization
#### write-through cache
- Leader cache -> coordinates writes to each object
- Follower caches -> serve reads but not writes. forward all writes to leader.

### Data Model
- Objects (e.g. user, location, comment) with unique IDs
- Associations (e.g. tagged, like, author) between two IDs
- Both have key-value data as well as a time field
- Every association has a time field, which is critical for ordering query results by recency
  - most of the queries are for the newest data
- an association list to be the list of all associations with a particular id1 and atype, arranged in descending order by the time field

### Data store
- The space of objects and associations is divided into shards, each shard is assigned to a logical MySQL database with a table for objects and a table for associations
- **To avoid potentially expensive SELECT COUNT queries, association counts are stored in a separate table**
- the number of shards far exceeds the number of servers
- Each object id contains an embedded shard id that identifies its hosting shard. (but one shard can be stored/moved in different servers)
- Objects are bound to a shard for their entire lifetime. An association is stored on the shard of its id1, so that every association query can be served from a single server

### Region
- several datacenters in a geographic region with low-latency interconnection (sub millisecond) between them are designated a region, and one copy of the graph is kept per-region.
- The master of a shard will have a slave in another region

### caching layer
- Follower tiers forward writes & read misses to a single TAO leader tier
- This leader tier is responsible for interacting with the MySQL tier that holds the MySQL databases for all of the shards
- implements the full API for clients and handles all communication with the databases
- each TAO follower must be local to a tier of databases holding a complete multi-petabyte copy of the social graph
- Write operations on an association with an inverse may involve two shards
- If a failure occurs the forward may exist without an inverse; these hanging associations are scheduled for repair by an asynchronous job.
- TAO provides read-after-write consistency within a single tier
- Replication lag in normally less than one second. 
- Writes to MySQL are synchronous so the master database is a consistent source of truth
- [TAO reads may be marked critical, in which case they will be proxied to the master region](https://blog.acolyer.org/2015/05/19/tao-facebooks-distributed-data-store-for-the-social-graph/)

- as long as a user consistently queries the same flower tie(same dc), it will have a consistent view

## Haystack
- data is written once, read often, never modified and rarely deleted
- long tail requests
- CDN are not effective for long tail
### [Old NFS photo infrastructure](https://code.fb.com/core-data/needle-in-a-haystack-efficient-storage-of-billions-of-photos/)
- CDNs (Content Delivery Networks) 
- enormous amount of metadata due to the namespace directories and file inodes
- The amount of metadata far exceeds the caching abilities of the NFS storage tier, resulting in multiple I/O operations per photo upload or read request
- most of this metadata, such as permissions, is unused and thereby wastes storage capacity
- [Several disk operations were necessary to read a single photo : one(or typically more) to translate the filename into inode number, another to read the inode from disk, and a final one to read the file itself](http://bigdata.devcodenote.com/2015/04/haystack-facebooks-photo-storage.html)

### [Haystack Photo Infrastructure](https://code.fb.com/core-data/needle-in-a-haystack-efficient-storage-of-billions-of-photos/)
- store photos in a generic object store called Haystack
- stores multiple photos in a single file and therefore maintains very large files
- eliminate any unnecessary metadata overhead for photo read operations, so that each read I/O operation was only reading actual photo data (instead of filesystem metadata).
- HTTP server
- Photo Store
- Haystack Object Store
- Filesystem
- Storage

- Storing photos as needles in the haystack eliminates the metadata overhead by aggregating hundreds of thousands of images in a single haystack store file. 
- This keeps the metadata overhead very small and allows us to store each needle’s location in the store file in an in-memory index. 

- Haystack Store, Haystack Directory, and Haystack Cache
<img src='https://lh3.googleusercontent.com/qtat-eCa5l7WtxIzs0g_4yx1jbExl_unnMGWUMJCb_lJMr3WKSZoDnvU6VryaW1MEDHvI_glbNKI5j-qgzCBb2EqxGaW9wwbQ7KeqQfdlSTuUGlLfnOcXKhIWlp9D10aiwHIFhc' />
- The Cache functions as the internal CDN, which shelters the Store from requests for the most popular photos and provides insulation if upstream CDN nodes fail and need to refetch content. 
  - reduce dependence on external CDNs
- http://(CDN)/(Cache)/(Machine id)/(Logical volume, Photo)
  - The first part of the URL specifies from which CDN to fetch the photo. The CDN can lookup the photo internally using only the last part of the URL. If the CDN cannot locate the photo then it strips the CDN address from the URL and contacts the Cache. The Cache does a similar lookup to find the photo. Photo requests that go directly to the Cache have a similar workflow except that the URL is missing the CDN specific information.

#### Haystack Directory
- Provides a mapping from logical volumes to physical volumes.
- Load balances writes across logical volumes and reads across physical volumes.
- Determines whether a photo request should be handled by the CDN or by the Cache.
- Identifies those logical volumes that are read-only wither because of operational reasons or because those volumes have reached their storage capacity.

#### Haystack Cache
- internal cdn
- The request comes directly from a user and not the CDN (post-CDN caching is ineffective as it is unlikely that a request that misses in the CDN would hit in the internal cache).
- The photo is fetched from a write-enabled Store machine (photos are most heavily accessed soon after they are uploaded and filesystems  for high workloads perform better when doing either reads or writes but not both).

#### Photo Store Server
- keeps an in-memory index of all photo offsets
- just keep the information required to locate the images in memory
- Photo store always assumes that if there are duplicate images (images with the same key) it is the one stored at a larger offset which is valid.

#### Haystack Object Store
- stores its information in a replicated databas
- a simple log structured (append-only) object store containing needles representing the stored objects
- an in-memory mapping of photo ids to the filesystem metadata (i.e. the file, offset and size in bytes) critical for retrieving that photo
- two files – the actual haystack store file containing the needles, plus an index file
- A needle is uniquely identified by its <Offset, Key, Alternate Key, Cookie> tuple
- The index file is not critical, as it can be rebuilt from the haystack store file if required. 
- The main purpose of the index is to allow quick loading of the needle metadata into memory without traversing the larger Haystack store file
- Loading and organizing index records into a data structure for efficient lookup is the responsibility of the Haystack application (Photo Store in our case).

##### Index file
- Index files allow a Store machine to build its in-memory mappings quickly, shortening restart time
- updated asynchronously
- Needles without corresponding index records are referred to as orphans. We can quickly identify orphans because the last record in the index file corresponds to the last non-orphan needle in the volume file.


#### Haystack Write Operation
- index records are written asynchronously for faster performance

#### Haystack Read Operation
- The parameters passed to the haystack read operation include the needle offset, key, alternate key, cookie and the data size
- The cookie is a number embedded in the URL for a photo. The cookie’s value is randomly assigned by and stored in the Directory at the time that photo is uploaded. The cookie effectively eliminates attacks aimed at guessing valid URLs for photos.
- verifies the cookie and the integrity of the data
#### Haystack Delete Operation
- setting a “deleted” bit in the flags field of the needle
- reclaim space when compact

#### Storage
- commodity storage blades
- Each storage blade provides around 10TB of usable space
- RAID-6 partition managed by the hardware RAID controller
- RAID-6 provides adequate redundancy and excellent read performance while keeping the storage cost down
- The poor write performance is partially mitigated by the RAID controller NVRAM write-back cache. Since the reads are mostly random, the NVRAM cache is fully reserved for writes
- The disk caches are disabled in order to guarantee data consistency in the event of a crash or a power loss


### Filesystem

### Haystack Object Store

- Batch upload


### F4
- erasure coding
- Haystack is great for hot data, and f4 is great for warm data
- Haystack: not very space efficient
- Facebook's blobs tend to be accessed frequently when they're first uploaded, after which access rates drops off exponentially
- That significant kinds of data should be moved from expensive, high-performance hot storage to cheaper warm and then cold storage as rapidly as feasible.




