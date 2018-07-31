
#### [Handle Task Timer for millions of requests](https://blog.acolyer.org/2015/11/23/hashed-and-hierarchical-timing-wheels/)
- [use Hierarchical Timing Wheels for the timeout timer and DelayQueue of timer buckets to advance the clock on demand](https://www.confluent.io/blog/apache-kafka-purgatory-hierarchical-timing-wheels/)

#### Generate Unique ID
- http://massivetechinterview.blogspot.com/2015/10/generate-unique-sequence-number-using.html
- Twitter Snowflake
  - [extension bits] + timestamp + worker id + sequence number
  - depend on time clock, 

- Auto increment of primary key (Flickr MySQL ticker server)
  - multiple servers
  - slow, not scalable (like add more clusters)
- [Leaf-segment](https://tech.meituan.com/MT_Leaf.html)
  - table: biz_tag, max_id, step, update_time, desc
```sql
Begin
UPDATE table SET max_id=max_id+step WHERE biz_tag=xxx
SELECT tag, max_id, step FROM table WHERE biz_tag=xxx
Commit
```
- [Leaf-snowflake](https://tech.meituan.com/MT_Leaf.html)

##### Design distributed lock
- ZK, CHubby
- Redis setNX(set if not exist)
- challenge: time jump, GC STW, 

##### Design rate limiter
- algorithms
  - [Leaky bucket](http://blog.51cto.com/zhangfengzhe/2066683)
    - water is escaping at a constant rate (T)
  - token bucket
      - [can send Large bursts at faster rate while leaky bucket always sends packets at constant rate.](https://www.slideshare.net/vimal25792/leaky-bucket-tocken-buckettraffic-shaping)

##### Url shorten
- [a cluster of id generators that reserve chunks of the id space from a central coordinator](https://www.puncsky.com/notes/84-designing-a-url-shortener)
- follow up: stats
- 
##### Asynchronous

- TODO aggregation tier
lambda-architecture

