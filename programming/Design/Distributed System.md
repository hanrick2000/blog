

- Vector Clocks
- Quorum Protocol
- Gossip Protocol

### Two Phase Commit
- strong consistency and transactions
- Semi-distributed: there's always a master coordinator for a given 2PC transaction
- synchronous
  - All transactions are serialized through that master which kills your throughput and increases latency
- deterministic coordinator
  - 1: propose, 2: vote, 3: commit/abort
- Heavyweight, synchronous, high latency
- Latency is high because of the extra coordination. Writes can be in the 200msec area
- 3PC buys async with extra round trip
- Datastore: poor throughput

### Paxos
- fully distributed, no single master coordinator
- Multiple transactions can be run in parallel
- 150msec latency hit to writes