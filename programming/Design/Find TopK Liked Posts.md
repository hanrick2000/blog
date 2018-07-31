
### [Algorithm approach](http://chuansong.me/n/1484497549017)
- Sorted Linked List + HashMap
- {3: [b]} --> {2: [a ->c]} --> {1: [d]}

- No need to be absolute precise
- Data stats

### [Reduce Load](https://www.jiuzhang.com/qa/219/)
- [X servers, each server runs a thread/dame-on to capture +1, -1 event, submit to message queue every x seconds]
- Idempotent
  - Idempotent key
### Messaging - Kafka
- producer, subscriber
- counter for same post are sent to same consumer
- every second, each consumer send topk posts to another topic
- One consumer consumes these data
  - Only one partition, but still multiple consumer for redundancy
- Stats in different Buckets, Level
  - 60*5 buckets in 5 mins bucket

### Debugging

### Cache
- always return from cache
- Refresh cache in background

### Degrade
- show old data if get fails

### Security

### Related
- [Design Hit Counter](http://prismoskills.appspot.com/lessons/System_Design_and_Big_Data/Chapter_03_-_Count_requests_in_last_second_and_hour.jsp)
