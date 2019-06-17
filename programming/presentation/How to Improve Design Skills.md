---
title: How to Improve Design Skills
author:
- Jeffery Yuan
date: "April 26, 2019"
---

## Agenda
- How to Design
- System Design Principles
- Learning from Open Source
- Learning from Existing Products
- System Design Practices

# How to Design
## How to Design
- Take time to think about your design
  - Minimize upfront design or YAGNI
  - It doesn't mean you don't take time to design the component
- Components related
- Impact to other components
- What are alternatives?
- Welcome different approaches and discussion

## How to Design
- Estimation
  - back-of-the-envelope calculation
- Estimated data size, QPS
- Take time to design data schema
  - As it’s difficult to change them after deploy to prod
- Better user experience
  - Thinking from client/user perspective
  - How they use it, what they would like to know


# Reflection – Lesson Learned
## Reflection – Lesson Learned
- What mistakes we made
  - Where to store data: dynamodb or not?
  - The key for Solr schema
- Why they happened:
- Not consider near-future requirements
- Make decisions carelessly

## Reflection – Lesson Learned
- Better client library
  - Only contains library and code that client need
- Package shared configuration in the library

# [System Design Principles](http://lifelongprogrammer.blogspot.com/2016/10/system-design-practices.html){target="blank"}
## [System Design Principles](http://lifelongprogrammer.blogspot.com/2016/10/system-design-practices.html){target="blank"}
- Idempotent
- Policy to expire/archive data - Less data
- Optimize data for read
  - Denormalization
- Read Heavy vs Write Heavy
- Design to Be Disabled - feature toggle
- Isolate Faults - Circular breaker
- Throttling - Rate limit

## [System Design Principles Cont.](http://lifelongprogrammer.blogspot.com/2016/10/system-design-practices.html){target="blank"}
- Stateless
- Asynchronous
  - Back pressure with exponential backoff
- Message queues
- Cache
- Visibility – monitoring
- Separation of concerns
  - Separate read and write

## [System Design Principles Cont.](http://lifelongprogrammer.blogspot.com/2016/10/system-design-practices.html){target="blank"}
- CAP
- Graceful Degradation
- Be Robust - Hide error as much as possible
- Be conservative in what you send, be liberal in what you accept
- Make your apps do something reasonable even if not all is right

# [Learning from Open Source](https://lifelongprogrammer.blogspot.com/2016/03/system-design-learning-from-open-source.html){target="blank"}
## [Learning from Open Source](https://lifelongprogrammer.blogspot.com/2016/03/system-design-learning-from-open-source.html){target="blank"}
- What makes them popular
- When to use them, when not

## [Cassandra]((https://lifelongprogrammer.blogspot.com/2016/03/system-design-learning-from-open-source.html){target="blank"})
- LSM(Log Structured Merge Trees)
  - append-only
- **SSTable**
- MemTable - SSTable in memory
- How C* handles delete: **Tombstone**(grace period)
- Merkle trees
- Bloom Filter
- Index
- CommitLog

## [Cassandra Cont.]((https://lifelongprogrammer.blogspot.com/2016/03/system-design-learning-from-open-source.html){target="blank"})
- Serialize cache data (row-cache, key cache) to avoid cold restart
- Session Coordinator
- Gossip protocol
- Seed nodes
- Consistent Hashing
- Eventual Consistency
  - W+R > N
- Local Index (vs Global Index)

## [Kafka]((https://lifelongprogrammer.blogspot.com/2016/03/system-design-learning-from-open-source.html){target="blank"})
- [Why it is fast](http://searene.me/2017/07/09/Why-is-Kafka-so-fast/){target="blank"}
- Sequentially read/write vs random read/write
- Memory Mapped File
- Zero copy
- Batch data(compressed)
- Partition: ordered, immutable, replicated
- Consumer group

## Database
- Sharding
- Replication
- Master/Slave, Multi-master

## [Learning from Existing Products](https://lifelongprogrammer.blogspot.com/2016/10/system-design-learning-from-existing-products.html){target="blank"}
- Twitter/FB timeline
- Pull/Push/Mixed Model
- FB Haystack/Photo storage

# [System Design Practices](http://lifelongprogrammer.blogspot.com/2016/10/system-design-practices.html){target="blank"}
## [System Design Practices](http://lifelongprogrammer.blogspot.com/2016/10/system-design-practices.html){target="blank"}
- URL shortener
  - read heavy
  - able to disable write functions
- Design key-value store
- Crawler
  - Re-crawling
  - cur+2t or cur+t/2 based on changed or not
- Design search engine
  - In-memory version: Data structure
  - Distributed: Solr Cloud internal design

## [System Design Practices](http://lifelongprogrammer.blogspot.com/2016/10/system-design-practices.html){target="blank"}
- Design score/rank system for social game
- Search nearby places: GeoHash
- Design Chat app
- Design logging collection and analysis system
- Design shopping cart
  - guest cart
- Design Hit Counter
- Design rate limiter
- Design Miao Sha

# Resource
## Resource
- Designing Data-Intensive Applications
- Scalability Rules: Principles for Scaling Web Sites
- The Art of Scalability

## Resource Cont.
- [How to Ace System Design](https://lifelongprogrammer.blogspot.com/2009/01/how-to-ace-system-design.html){target="blank"}
- [When it Goes Wrong during interview](https://lifelongprogrammer.blogspot.com/2018/08/when-it-goes-wrong-how-to-ace-system.html){target="blank"}
- [And more](http://lifelongprogrammer.blogspot.com/search/label/System%20Design)




<!-- - Products:
- Cassandra:
  - SSTable, MemTable -->

