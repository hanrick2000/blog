
### Numbers/Scale on average and at peak
- users, how many posts, gets
- followers/favorites on average/peak

- do we support update twitter?
- What data would need with every Tweet we fetch?
- Would we need all the user profiles of users who have favorited a tweet?
- How many tweets should we fetch at a time?
  - pagination

- separate user data
  - sensitive data like password, pin data into different table

### Requirements
- posting new tweets
- following a user
- favoriting a tweet
- displaying data about users and tweets

- retweet
  - make it into many layers or only keep the original feed

### High Level

### Design patterns
- Idempotent

### API design

### Database Design
<img src='https://train.hiredintech.com/lecture_materials/twitter_problem_system_design.png' />
- foreign key, graph
- twitters
  - tweet_id, user_id, content, timestamp
- users
  - one table: user_id, name, 
  - another: age, birthday, etc
  - or different apps cache part of needed data
- followers
  - follower_id, followee_id, created_at
- followed
- favorited
  - one table only store top 200 user_ids
  - user_id, tweet_id, created_at

#### Index
- queries

### Sharing/Partition


## news feed
- dedup
- Feed diversity - A frequent producer of events may overshadow events from less frequent producers
### Questions
- how to sort/rank
- how many feeds to show? show all or at most x every day or since last checking?
- do they change over time?

### Access Pattern
- bursty/spiky traffic
- people usually only access last x items(today) data(hot/cold data)

### Ranking
- metrics: users stickiness, retention, ads revenue
- calculate a feed score based on various features and rank feeds by its score
- select features/signals that are relevant and then figure out how to combine them to calculate a final score
- share/like/comments numbers, time of the update, whether the feed has images/videos etc

- Edge Rank
- Affinity score (u). For each news feed, affinity score evaluates how close you are with this user
- Edge weight (e). Edge weight basically reflects importance of each edge. For instance, comments are worth more than likes.
- Time decay (d). The older the story, the less likely users find it interesting

- For each feed you create, multiply these factors for each Edge then add the Edge scores up and you have an update’s EdgeRank. And the higher that is, the more likely your update is to appear in the user’s feed

### Push vs Pull(Fanout on write or load)
- Selective fanout
- disable fanout for high profile users
- fanout to only his active friends
  - or different (priority) queue
- push may waste resource: data never be viewed
- [events from high-rate producers are retrieved at query time, while events from lower-rate producers are materialized in advance](http://highscalability.com/blog/2012/1/17/paper-feeding-frenzy-selectively-materializing-users-event-f.html)
- making local decisions about each producer/consumer pair
  - based on the ratio between a given producer's update rate (how often an event is added to the stream) and a given consumer's view rate (how often the feed is viewed).

### Facebook News Feed
- flexible: easier to iterate
- A particular server ("leaf") stores all feed items for a particular user. So data for each of your friends is stored entirely at a specific destination.
- Multi-fetch and aggregate stories at read time
- Developing with read-time aggregation is flexible
- Fan-out reads can be bounded. Writes, often cannot

#### Aggregator Leaf Tailer (ALT)
#### Build different/specific machines
- put aggregators to servers who have intensive CPU capacity
- put leafs to servers who have large memory storage
#### Components
- Tailer: The input data pipelines directs user actions and feedback into a leaf storage layer in real time.
- Persistent storage: The raw logs and snapshots for reloading a leaf from scratch.

### Aggregators
- stateless
- CPU intensive

### Leafs
- [indexes most recent News Feed actions](https://code.fb.com/production-engineering/serving-facebook-multifeed-efficiency-performance-gains-through-redesign/)
- store in memory/use mmap to memory
- Usually 20 leaf servers work as a group and make up one full replica containing the index data for all the users
- put a full leaf set with a single rack

#### Focus on Leaf Nodes
- In-memory (mostly) databases
- Do ~40 requests per feed query


### timeline
- a chronologically ordered list of records



- [Query on Demand vs. Pre-materialization](https://engineering.linkedin.com/blog/2016/03/followfeed--linkedin-s-feed-made-faster-and-smarter)
- Embedded Database for Persistence in index node
  - rocksdb + cache
  - each nodes contain multiple partition
  - replicated, multiple copy
  - each read data from kafka where the partition range matches the partition range of the index node cluster
  - the ease of adding more replicas results in high availability and read scalability
  - dedicated nodes for backup and ingesting which do not serve real-time traffic
- [control over which timeline keys get evicted from the cache—those that have a non-empty list of records associated with them, or otherwise](https://engineering.linkedin.com/blog/2016/03/followfeed--linkedin-s-feed-made-faster-and-smarter)
- The fat cache holds timeline keys and a non-empty list of records associated with each one of them
  - the total number of records it's holding
- the skinny cache contains keys that don't have any records associated with them
  - the total number of keys it's holding


### Resources
- [The Twitter Problem](https://www.hiredintech.com/classrooms/system-design/lesson/67)