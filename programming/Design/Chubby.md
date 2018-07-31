### Chubby
- Provides coarse-grained locking
  - vs fine-grained
  - coarse-grained lock may hold for hours, days or longer
  - used for leader election, live nodes
- reliable (low-volume) storage
- Advisory locks
- exports a simpler file system interface

- all requests go to master
- Ephemeral or permanent nodes

### File based interface
#### [Metadata on Node](https://medium.com/coinmonks/chubby-a-centralized-lock-service-for-distributed-applications-390571273052)
- Instance number — always increasing for the same name
- Content generation number — Increased anytime content is overwritten
- Lock generation number — Increases when lock transitions from free to held
- ACLs on nodes like in a traditional file system for controlling access and an ACL number increases on ACL changes

### Cache
- Master maintains state information about all the clients and hence can invalidate a client’s cache if someone else writes to the same file.

### KeepAlive/Heartbeat message
- Server blocks the call and assigns a lease to the client.
- Server can send some information back

- Client disables cache in grace period.




#### consistent caching
- Push not pull


### PAXOS




