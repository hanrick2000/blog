
### Message
- Idempotent
- Versioned, time sorted

### [Consumer Group](https://blog.cloudera.com/blog/2018/05/scalability-of-kafka-messaging-using-consumer-groups/)
- competing consumers
- 
### [Store large message](http://ingest.tips/2015/01/21/handling-large-messages-kafka/)
- Store it in external store, include location in message
- [Chunk it into smaller messages, and send them into same partition](https://medium.com/workday-engineering/large-message-handling-with-kafka-chunking-vs-external-store-33b0fc4ccf14)
- Compress

### [Handle consumer failure](https://blog.pragmatists.com/retrying-consumer-architecture-in-the-apache-kafka-939ac4cb851a)
- Republish failed message into separate topics
- different topics for different delay value: retry_5m_topic, retry_1hour_topic
- dead letter queues (DLQ)

### [Handle producer failure]

- leaky bucket pattern


- Uber Kafka proxy client/server
  - batching, async processing
- support both sync, async

### [In-sync replica (ISR) protocol](https://puncsky.com/hacking-the-software-engineer-interview#how-to-tolerate-fault)
- ISR is the set of replicas that are alive and have fully caught up with the leader
- If a follower replica fails, it will be dropped out of the ISR and the leader then continues to commit new messages with fewer replicas in the ISR. Notice that now, the system is running in an under replicated mode.
- Out-of-sync replica keeps pulling message from the leader. Once catches up with the leader, it will be added back to the ISR.

### In Practice
- [Retry consumer](https://blog.pragmatists.com/retrying-consumer-architecture-in-the-apache-kafka-939ac4cb851a)
  - not retry immediately
  - retry_5m_topic, retry_30m_topic, retry_1h_topic
- [Dead Letter Queue](https://eng.uber.com/reliable-reprocessing)
  - Dead letter messages are merged to re-enter processing by being published back into the first retry topic
  - Unblocked batch processing