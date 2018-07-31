### SLA - Service-level agreement
- scope, quality, responsibilities
- contracted delivery time

- MTBF: Mean time between Failures
- MTTR: Mean time to recover

### API Design

### Database Design

### CAP
- Consistency or Availability?

### Load Balancer
- horizontal scale
- can detect dead backend servers
- round robin or based on server load


### SLA
- spiky traffic
- Request Coalescing

- points of presence (PoPs)
  - maintain a set of ready-to-use, opened TCP connections to the main cluster service
  - a transatlantic TCP connection handshake can take as long as 500 ms, to a nearby PoP will usually take less than 100 ms

### Dependencies
- Strong or leak

### Bottle neck
- Single point of failure

### Fault Tolerance
- Feature flags with fallback and degrade
- fail gracefully
- degrade
- retry with back off
  - or fail fast, client decides fall-back
- rate limiter
  - sustained throughput
  - based on user, user type, APIs.
  - reject requests as easily/upstream as possible
- queue

### Separation of service
- paid user

#### Stable
<!-- - 限流、降级、熔断、隔离、路由 & 负载均衡、服务注册 & 发现 -->
- Rate Limit
- Degrade
- circuit breaker


### Asynchrony
- image upload example
- external dependencies, time consuming tasks(send email, image convert), low priority tasks
- Message Queue

- Lambda Architecture
- Design SQS
- Design Uber


### Consistency Model
- strong, weak, eventual consistency
#### Vacations of eventual consistency
- Causal consistency
- Read-your-writes
  - stickiness
- Session consistency
- Monotonic read consistency
- Monotonic write consistency

### Optimization
- Calculate an approximate result
- Filtering at the source

### High availability
- offline test
- Gated Launch(canary deployment): 1->10->100
- feature flag
- support rollback
  - database schema change: don't delete/rename field
  - data format: support version: protobuf

<!-- - 延迟截断，对于太老的请求，直接给出拒绝响应，让它在应用层重试 -->
- 分级队列，某些高优先级任务优先响应
- user facing request
  - finish only necessary tasks and all other tasks can be done asynchrously

### concurrency
- optimistic lock
- pessimistic lock


### identify bottlenecks
- Centralised component
- High latency component

### Dealing with Service Failures
- Avoid Cascading Service Failures
