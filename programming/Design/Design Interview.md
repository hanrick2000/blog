
### Clarify Questions
- users
  - paid/anonymous user
  - active or less active users
  - priority customers, what to sacrifice in case you cannot handle all of them
### Clarify Assumption
- commodity server


### Estimation
- QPS, storage
- Plan for growth
  - Do regular capacity planning. Collect usage statistics, predict the growth rate

### High Level first then detail

### Data
- how to archive/expire data
- how long we need store them
  - hot, cold, long tail
- read/write ratio
### How to Scale
- different components

### How to optimize read
- Low level:
  - Resources Pool like: DBSession and TCP connection
  - batch requests

### Cache
- where to cache
- what to cache
- when/how to update cache
  - invalidate
- set: timeout
  - Jitter and randomization
- avoid thundering herd:
  - refill code cache from warm cache servers
- provide way to refresh cache manually: fine-grained

### Consistency Model
- strong, weak, eventual consistency
### **Reliability/Robustness**
#### How to handle Failure/Fault Tolerance
- **separate of concerns/services**
- feature flag
  - able to disable feature or some low priority tasks in the system
- Throttling: rate limiter
- retry with back off
- Fail fast and safe
  - Circuit Breaker
- Degrade/Fall back
- **Idempotent** for update
  - Idempotent key
- separate of read/write
  - master/slave, backup

### How to Optimize
- identify bottleneck
- load test/benchmark

### Monitoring/Alter + Automation/Run books/Work flows

### Separation of concerns
- separation of read/write, different services
- separation of static contents
- separation of platform layer and web layer
  - reuse platform layer for different products or interfaces
  - hide complexity of db, cache
  - scale differently
### SNEAK
- Scenario, Needs, Application, Data, Evolve




### Consistency mode

### API Design
- restful for external services
- rpc


### How to store/access data
- cross data center


- User experience

### Separate
- web servers, databases
