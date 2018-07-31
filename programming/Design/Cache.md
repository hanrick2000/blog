### Cache
- Reduce latency
- Reduce load

- where to cache
- what to cache
- layered cache
  - database cache
  - remote centralized cache, local cache, cdn

- database cache
  - index, row cache, key cache in C*, filter cache, field cache in Solr
- client cache: browser, app, client library

- server side cache
  - static page cache
  <!-- - 动态页面静态化 -->

- Application Cache:
  - centralized cache: redis
  - local application cache: Ehcache

- 
### CDN
- geographic distribution: close to end user
- static content
- separate static files to a different domain, using severs optimized like nginx
- CDN are not effective for long tail requests

### [How to update cache](https://docs.oracle.com/cd/E15357_01/coh.360/e15723/cache_rtwtwbra.htm#COHDG5180)
- Write-through
- Write-behind (write-back)
- [Refresh-Ahead](https://github.com/SvenBayer/cache-refresh-ahead-spring-boot-starter)

### Update hot data at same time
- rare, we can use write back cache

### Cold cache
### Thundering herd
- when key is expired/deleted
- when cache server is restarted

#### How to avoid Thundering herd
- refill code cache from warm cache servers
- Add entropy back: jitter

### Consistency
- read-your-own-writes

### Memcache
- Get over UDP, set/delete over TCP
- 
### [Memcache lease](https://medium.com/@shagun/scaling-memcache-at-facebook-1ba77d71c082)
- permission to refresh from DB
- return a token only once every 10 seconds per key
- if there is a lease in the key, client can choose to use the stale data, or back off (via exponential backoff)
- only first miss will query db

### Writes from a non-master region
- A cache refill from a replica database is allowed only after the replication stream has caught up
- A remote marker mechanism: rk
#### [mcrouter]
- Connection pooling
- batch requests
- Cold cache warm up: refill code cache from warm cache servers
- Reliable delete stream: logging delete commands to disk in cases when the destination is not accessible. A separate process then replays those deletes asynchronously.

### Cache replacement policies 
- LRU(Least Recently Used)
- LFU(Least Frequently Used)
- ARC(Adaptive replacement cache): it has a better performance than LRU. It is achieved by keeping both the most frequently and frequently used entries, as well as a history for eviction. (Keeping MRU+MFU+eviction history.)

### [Cache update policies](https://github.com/donnemartin/system-design-primer)
- Cache-aside/Read-through
  - Update deletes cache
  - Look for entry in cache, resulting in a cache miss
  - Data can become stale if it is updated in the database. 
    - This issue is mitigated by setting a time-to-live (TTL) which forces an update of the cache entry, or by using write-through
- [Write-through](https://docs.oracle.com/cd/E15357_01/coh.360/e15723/cache_rtwtwbra.htm#COHDG5181)
  - use the cache as the main data store, reading and writing data to it, while the cache is responsible for reading and writing to the database
  - Application adds/updates entry in cache
  - Cache **synchronously** writes entry to data store
- Write-back cache
  - Add/update entry to the cache alone
  - Cache asynchronously writes entry to the data store
  - Used: when we update/read same data extensively
- Refresh-ahead
  - automatically refresh any recently accessed cache entry prior to its expiration

- Oracle coherence: cache middleware
