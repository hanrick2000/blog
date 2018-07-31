

### API Gateway
- a separate API gateway for each kind of client

### Event Sourcing
- change data capture: CDC
- maintains a complete transaction history for a data model
- replay events to any point in time
- Event Store
#### Aggregate


### CDN|PoP|Edge Servers
- replicate data close to users
- speed and reliability


### Smart client
- a client which takes a pool of service hosts and balances load across them, detects downed hosts and avoids sending requests their way
- they also have to detect recovered hosts, deal with adding new hosts, etc

### Retry
- Retry with exponential backoff and random jitter
- Be considerate of the thundering herd problem
- Only retry in outermost service
  - otherwise retry may grow exponentially

### API gateway


- 80-20 rule, 80% of the cost comes from 20% of features/user

- Competing Consumers Pattern
- Circuit Breaker Pattern
- Command and Query Responsibility Segregation (CQRS) Pattern
  - it is common to separate the data into different physical stores to maximize performance, scalabilit
- Event Sourcing Pattern
- Gatekeeper Pattern
  - API gateway
- Compensating Transaction Pattern
- Health Endpoint Monitoring Pattern
- Queue-based Load Leveling Pattern
- Throttling Pattern
- Retry
- 

