% How to Improve Problem Solving Skills
% Jeffery Yuan
% April 24, 2019

# Why Problem-solving skills matters
## Problem Solving and troubleshooting
- Is fun
- Is part of daily work
- Make us solve problem 
- More efficiently
- With more confidence
- Less pressure
- Go home earlier

## Solve the problem when needed
- no matter whether its related with you
- It's your responsibility if it blocks you, the team or others

# How to Solve a Problem
## Understand the problem/environment first
- Understand the problem before google search otherwise it may just lead you to totally wrong directions.

- Find related log/data
- Copy/Save logs/info/findings that may be related

## Check the Log and Error Message
- Read/Understand the error message
- Where to find log
  - Common places: /var/log
  - From command line:
    - -Dcassandra.logdir=/var/log/cassandra

## Case Study – The Log and Error Message
### Problem:
- Failed to talk Cassandra server: 10.10.10.10
- Where 10.10.10.10 comes from?
  - ```gfind . -iname '*.jar' -printf "unzip -c %p | grep -q 10.10.10.10' && echo %p\n"```
  - or search in corporate github/code base
- It comes from commons2 project; check what’s the current settings in Github
- Now the problem and solution is clear: Just upgrade commons2 to latest version

## Source code is always the ultimate truth
- Find related code in Github
- Find examples/working code
- Understand how/why the code works by running and debug the code
- Check the log with the code
  - Most problems can be solved by checking log and source code

## Reproduce the problem
- Find easier way to reproduce them
  - main method, unit test, mock
- Simplify the suspect code
  - Find the code related, remove things not realtedUse
- Reproduce locally
- Connect to the remote data in local dev
- Remote debug
  - Last resort, slow

## Solving Problem from Different Angles
- Sometime we find problem in production and we need code change to fix it
  - Try to find a workaround by changing database/Solr or other configuration
  - We can fix code later

## Find Information Effectively
- Google search: error message, exception
- Search source code in Github/Eclipse
- Search log
- Search in IDE
  - Cmd+alt+h, cmd+h
- Search command history
  - history | grep git | grep erase  
  - history | grep ssh | grep 9042
  - history | grep kubectl | awk '{$1="";print}' | sort -u
- Know company’s internal resource 
  - where to find them
- Know some experts (in company) you can ask help from

## Ask for help
### Where and who
- Coworkers
- Stackoverflow
- Specific forums
  - http://lucene.472066.n3.nabble.com/Solr-f472067.html

### How
- Provide context and info you find
- Ask help for same/similar things once, then you know how to do it
- Learn the knowledge itself
- But also learn their thinking process

## Fix same/similar/related problems in other places
- We make mistakes in one place
- It's very likely we make same/similar/related in other places
  - Example: GetMapping(value = "/config/{name:.+}")

## Knowledge
- Be prepared
- Know what problem may happen, the difference etc
- Know the services/libraries you are using
- Apache/Tomcat configuration
- How to manage/troubleshoot Cassandra/Kafka/Solr

## Knowledge cont
### Example: Redis cache.put Hangs
- Get thread dump, figure out what is happening when read from cache
- Read related code to figure out how Spring implements @Cacheable(sync=true)
 RedisCache$RedisCachePutCallback
- Check whether there is cacheName~lock in redis
- When use some feature, know how it's implemented.

## Knowledge cont
### Common Problems: more to add in future
- Different versions of same library
  - mvn dependency:tree  
  - mvn dependency:tree -Dverbose -Dincludes=com.amazonaws:aws-java-sdk-core

## Practice - Iterator vs Iterable
- What’s the problem in the following Code?
```java
@Cacheable(key = "#appName")
public Iterator<Message> findActiveMessages(final String appName) {}
```
