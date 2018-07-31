### Data
- readonly?
- do we update data? how frequently?


### SQL DB
- ad-hoc query
- Structured data
- Strict schema
- Relational data
- Need for complex joins
- Transactions
- Clear patterns for scaling

#### Advantages
- [tools like back-ups, bulk import and deletion of data, bulk migrations from one data format to another, replica creation, asynchronous replication, consistency monitoring tools, and operational debugging](https://blog.acolyer.org/2015/05/19/tao-facebooks-distributed-data-store-for-the-social-graph/)
- atomic write transactions, efficient granular writes, and few latency outliers

### NOSQL
- Semi-structured data
- Dynamic or flexible schema
- Non relational data
- No need for complex joins
- Store many TB (or PB) of data

### CAID

### BASE
- Basically available
- Soft state
- Eventual consistency
### Consistency
- R + W > N
  - a "successful" read request is guaranteed to return the result of most recent write since the request will always touch at least one replica that has the most recent copy of object


### Master/Slave
### Master-Master

### Shard

### Replication



- Use Cassandra for very high volume, low latency writes
- Use Redis for very high volume, low latency reads

- [insert, don't update](https://developer.ibm.com/dwblog/2014/coding-eventual-consistency)
- avoid query after insert

### How DB resolves conflicts
- pick one winner deterministically, but stores all conflicted version, let users know so user can choose
  - couchdb

### Consistent hashing
- virtual nodes


### Write-ahead log (WAL)
### Monitoring staleness of replication lag

- Log-Structured Merge-Tree (LSM-Tree)
