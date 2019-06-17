### Miaoshao
- user can buy only one or more items?
- simplify process: only allow requests from users who has valid credit card stored
- avoid put duplicate requests from same user into the queue
- flag: soldOut
- Put X times requests into queue, reject all other requests with msg: retry later
- separate from existing services
  - different sub-domains

- process
  - before the event
  - after the event
- request:
  - pre-check: check there is remaining(local then remote, approximately), user in good status(payment method)
### 12306
- remaining tickets
  - update every x mins
- Queue
### Design Ticket Master
- bursty traffic
- rate limit based on seats
- Query reservation status
  - put reservation_id and status in cache
- reservation_id: user_id+concert_id+timestamp
- Reservation
  - id(primary_key),created_at(timestamp),concert_id(foreign key),user_id(foreign key),tickets_count(int),status(int)
- Ticket
  - id (primary key),created_at (timestamp),user_id (fk),concert_id (fk)reservation_id (fk),status (int) // 是否退票之类的
- Concert
- RecycleService

### Payment
- Credit Card Capture
  - two steps: Authorization, Capture
  - Sale: over the counter

### Design Uber

### Design SQS(i.e. AWS's queue service)

### Sales Rank
- new purchase info will be stored somewhere
- the upstream app would also sends the event into a queue(Kafka)


### find the shortest path between two people
- bi-directional BFS
- Reduce machine jumps: if five of my friends live on one machine, I should look them up all at once
- Smart division of people and machines
- mimic the marking of nodes with a hash table to look up a node id and determine whether it's been visited

- [Personal Financial Manager](https://wdxtub.com/interview/14520604446948.html)

- [Linkedin - Get Second/Third Friends](https://engineering.linkedin.com/real-time-distributed-graph/using-set-cover-algorithm-optimize-query-latency-large-scale-distributed)
  - NCS, the caching layer, calculates and stores a member's second-degree set
  - graph distance queries originating from a member can be converted to set intersections, avoiding further remote calls

### LogStash
- shipper, broker, indexer, output storage
- pipelines: input, filters, output



<!-- TODOP -->