- single thread
- 

### Hash slots
- keyspace is divided into 4096 hash slots.
- Different nodes will hold a subset of hash slots.
- slave and master nodes: two replicas per every master node

### Gossip
- A node marks another node as possibly failing when there is a timeout longer than N seconds.
- Every PING and PONG packet contain a gossip section: information about other nodes idle times, from the point of view of the sending node.

### Fault tolerance - failing nodes
- A guesses B is failing, as the latest PING request timed out.
- A will not take any action without any other hint.
- C sends a PONG to A, with the gossip section containing information about B: C also thinks B is failing.
- At this point A marks B as failed, and notifies the information to all the other nodes in the cluster, that will mark the node as failing.
- If B will ever return back, the first time he'll ping any node of the cluster, it will be notified to shut down ASAP, as intermitting clients are not good for the clients.
