

### SQL vs NOSQL
- relations
- read-write pattern
  - nosql is good at write-heavy
  - [RDBMS usually don’t perform well. Every write is not just an append to a table but also an update to multiple index which might require locking and hence might interfere with reads and other writes](https://www.interviewbit.com/problems/design-messenger)
- Technology Maturity
- Company's tach stack(ops, sre team)

#### Storage Layer:
- CAP
- Layered
  * normal data -> database, hot data -> cache, cold data -> backup, file system

#### Sharding
- [Sharding Pinterest: How we scaled our MySQL fleet](https://medium.com/@Pinterest_Engineering/sharding-pinterest-how-we-scaled-our-mysql-fleet-3f341e96ca6f)


