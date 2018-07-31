### Features?
- uniqueness
- Ordered: strictly or loosely
- meaningful/readability/parseable
- compact

- business related?
  - transaction id

### Twitter Snowflake
- Depend on time
- not sortable
#### How to handle time rollback
- reject, client can get id from another service
  - all(most of) servers time rollbacked
- add 1/2 extension bit

### [Leaf-snowflake](https://tech.meituan.com/2017/04/21/mt-leaf.html)
- Use zookeeper to assign work node ids
- weakly depended on zookeeper

### Redis INCRBY

### Flikr Database Ticket Servers
- auto_increment_increment and auto_increment_offset

### auto-incrementing primary key
- those inserts must be serialized
- implemented by a lock

### [Leaf-Segment](https://tech.meituan.com/2017/04/21/mt-leaf.html)
- proxy servers, each responsible for some range (consistent hash)
- each proxy server get one range/buffer(step size)
- Get next range when current range is used 20%

### MongoDB ObjectId




