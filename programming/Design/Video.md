
### [Video player -> Edge Proxy -> Edge Cache -> Original Server Cache -> Original Server](https://code.fb.com/ios/under-the-hood-broadcasting-live-video-to-millions/)

- Video is segmented into one second files
- Adaptive encoding
  - based on the available network bandwidth

- push segments to the PoPs before segments have been requested

### RTMP
- push model, small chunk

### Pop
- points of presence (PoPs) cache
- limited number of servers and connectivity


### predict the load before it actually happens
### Testing

### [Chat Server](https://www.interviewbit.com/problems/design-messenger)
#### Requirement/functions
- 1:1 or group conversations
- support attachments or images
#### Estimation
- rps
- data size
  - do we even store the message history? or store them in client side or only store all in client side, but only store last x messages in server
    - (old) whatsapp synced on user's google drive and deleted from our servers
  - how long to keep, archive or delete
  - hot/cold data(how to handle cold data)

#### Non function goals
- Latency
- Consistency
  - order, seen it or not
- Availability: CP vs AP

#### Functions/API
- Send a message to another person
  - idempotent key
  - input: senderId, recepientId, messageContent, clientMessageId
- For a user, fetch the most recent conversations
  - input: userId, pageNumber, pageSize, lastUpdatedTimestamp
  - output:
- For every conversation, fetch the most recent messages

#### Chat server
- 

#### Data Storage
- client apps stores last received msg id for each conversation
  - client may login into different devices

#### Online notification
- no need to be real-time
- no need store them permanently
- in-memory key-value stores like redis/memcached
- slow network
- heartbeat
- not all friends are equals
  - only push to online friends
  - very important friends: show status change in x seconds, others show in x mins
  - batch: group these messages
- this notification can be also sent through conversation message
- when user first login
  - pull x user's status, show others when needed
  - sort users by importance

#### connections
- WebSockets
- persistent connection
