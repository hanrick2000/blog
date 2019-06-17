
- thread pool sizes in the app server
  - queueless or small size
- 请求截断, reject old requests that stayed too long in the queue

- hedged requests
- [Backup Requests With Cross-Server Cancellation](http://highscalability.com/blog/2012/6/18/google-on-latency-tolerant-systems-making-a-predictable-whol.html)
- Load Shedding and Graceful Degradation
  - reject requests as early/upstream as possible

### retry
- Limit retries per request
- randomized exponential backoff
- have a server-wide retry budget. For example, only allow 60 retries per minute in a process
- avoid amplifying retries by issuing retries at multiple levels
- Use clear response codes and consider how different failure modes should be handled

- Latency and Deadlines
  - client should give up or retry if the request doesn't complete within the deadline
- DEADLINE PROPAGATION
- CANCELLATION PROPAGATION




