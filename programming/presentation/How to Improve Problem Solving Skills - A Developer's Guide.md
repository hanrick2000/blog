---
title: "How to Improve Problem Solving Skills"
author: 
- Jeffery Yuan 
date: "April 24, 2019"
---

# Why Problem-solving skills matters
## Problem Solving and troubleshooting
- Is fun
- Is part of daily work
- Solve the problem, get things done
- Work More efficiently
- With more confidence
- Less pressure
- Go home earlier

## Solve the Problem when Needed
<!-- - Doesn't matter whether its related with you -->
- It's your responsibility if it blocks you, the team

# How to Solve a Problem
## Understand the Problem/environment First
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
#### Problem: Failed to talk Cassandra server: 10.10.10.10

- Where 10.10.10.10 comes from?
  ```bash
  gfind . -iname '*.jar' -printf "unzip -c %p 
  | grep -q 10.10.10.10' && echo %p\n"
  ```
- or search in corporate github/code base
- It comes from commons2 project; check what’s the current settings in Github
- Now the problem and solution is clear
  - Just upgrade commons2 to latest version

## Source code is always the ultimate truth
<!-- TODOP -->
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

## [Solving Problem from Different Angles](https://lifelongprogrammer.blogspot.com/2016/03/solving-problem-from-different-angles.html){target="blank"}
- Sometime we find problem in production and we need code change to fix it
  - Try to find a workaround by changing database/Solr or other configuration
  - We can fix code later

## [Find Information Effectively](https://lifelongprogrammer.blogspot.com/2016/04/search-more-effectively-programmer.html){target="blank"}
- Google search: error message, exception
- Search source code in Github/Eclipse
- Search log
- Search in IDE
  - Cmd+alt+h, cmd+h
- Search command history
  - history | grep git | grep erase  
  - history | grep ssh | grep 9042
  - history | grep kubectl | awk '{$1="";print}' | sort -u

## [Find Information Effectively Cont.](https://lifelongprogrammer.blogspot.com/2016/04/search-more-effectively-programmer.html){target="blank"}
- Know company’s internal resource 
  - where to find them
- Know some experts (in company) you can ask help from

## [How to Troubleshoot and Debug](https://lifelongprogrammer.blogspot.com/2016/05/how-to-troubleshoot-and-debug.html){target="blank"}
- Don't overcomplicate it.
- In most cases, the solution/problem is quite simple
- Troubleshooting is about thinking what may go wrong.
- Track what change you have made

## Resource About Troubleshooting
- [Debug It!: Find, Repair, and Prevent Bugs in Your Code](https://pragprog.com/book/pbdp/debug-it){target="blank"}

## Urgent Issues in Production
- Collaborate and share update timely
- Let others know what you are testing/checking, the progress, what you have found, what you will do next

<!-- Listen to others
- When help others
  - Ask what related change they have done
- Ask help from others.
  - Try to understand the problem and fix it by yourself first. 
Provide log or any information that may help others understand the problem.
-->


## Ask for help
## Before
- Try to understand the problem and fix it by yourself first 
  - If this applies: not urgent

## Where and Who
- Coworkers
- Involve more people: the team, related teams
- Stackoverflow
- Specific forums
  - [Solr Forum](http://lucene.472066.n3.nabble.com/Solr-f472067.html){target="blank"}
- Google Groups
- Github issues
- Ask in multiple channels

## How to Ask Help
<!-- TODO: p -->
- Provide **more** context and info
  - log, stack trace or any information that may help others understand the problem
- Provide what you have found, tried
- Ask help once for same/similar/related issues 
<!-- not many times -->
<!-- - then you know how to do it -->

<!-- ### When Ask Help in Person
- Ask free time for not urgent issues -->

## Learn more
- The knowledge: root cause, etc 
<!-- - Learn the knowledge itself -->
- Learn their thinking process
  - how they approach this problem (logs, code), tools

## Fix same/similar/related problems in other places
- People make same mistakes in different places
  - Example: `GetMapping(value = "/config/{name:.+}")`

## Knowledge
- Be prepared
- Learn how to debug/troubleshooting
- Learn tools used for debugging
- Learn framework, library, products, services used in your project
  - Apache/Tomcat configuration
  - How to manage/troubleshoot Cassandra/Kafka/Solr
- Know what problem may happen, code change recently
 <!-- the difference etc -->

## Knowledge cont.
### Common Problems
<!-- : more to add in future -->
- Different versions of same library
 - mvn dependency:tree  
 - mvn dependency:tree -Dverbose -Dincludes=com.amazonaws:aws-java-sdk-core

# Tools
## Tools - Eclipse
- [Use Conditional Breakpoint to Execute Arbitrary Code (and automatically)](https://lifelongprogrammer.blogspot.com/2013/10/use-eclipse-conditional-breakpoint-to.html){target="blank"}
- [Use Display View to Execute Arbitrary Code](https://lifelongprogrammer.blogspot.com/2013/10/use-eclipse-display-view-while-debugging.html){target="blank"}
- [Find which jar containing the class and the application is using](https://lifelongprogrammer.blogspot.com/2014/12/find-which-jar-containing-class-definition.html){target="blank"}
  - `MediaType.class.getProtectionDomain().getCodeSource().getLocation()`
- Breakpoint doesn't work
  - Multiple versions of same class or library

## [Practice - Connect to the remote data in local dev](https://lifelongprogrammer.blogspot.com/2016/03/solr-tips-and-tricks.html){target="blank"}
- Create a tunnel to zookeeper and solr nodes
- Add a conditional breakpoint at 
`CloudSolrClient.sendRequest(SolrRequest, String)`
  - before `LBHttpSolrClient.Req req = new LBHttpSolrClient.Req(request, theUrlList);`
```java
theUrlList.clear();
theUrlList.add("http://localhost:18983/solr/searchItems/");
theUrlList.add("http://localhost:28983/solr/searchItems/");
return false;
```

## Tools - Decompiler
- [GUI: Bytecode-Viewer](https://github.com/Konloch/bytecode-viewer){target="blank"}
  - alias decom="java -jar /Users/jyuan/apple/tools/misc/Bytecode-Viewer-2.9.11.jar"
- [CFR](http://www.benf.org/other/cfr/){target="blank"}
  - Best, Support java8

## Tools - Java
- [jcmd: One JDK Command-Line Tool to Rule Them All](http://marxsoftware.blogspot.com/2016/02/jcmd-one-jdk-command-line-tool-to-rule.html){target="blank"}
  - jcmd <pid> Thread.print
  - jcmd <pid> GC.heap_dump <filename>
- Thread dump Analyzer
  - [fastthread](http://fastthread.io/){target="blank"}
- Heap dump Analyzer
  - [Eclipse MAT](https://www.eclipse.org/mat/){target="blank"}
- VisualVM

## [Tools - Splunk](https://lifelongprogrammer.blogspot.com/2019/05/splunk-troubleshooting-skills.html){target="blank"}
- Syntax
- Expand messages to show all fields
  - Click `Format` on the top and select `All lines` for the `Max Lines` setting
- After search and find the problem, use nearby Events +/- x seconds to show context


## [Tools - Misc](https://lifelongprogrammer.blogspot.com/2019/05/linux-command-search.html){target="blank"}
- Search Contents of .jar Files for Specific String
`gfind . -iname '*.jar' -printf "unzip -c %p | grep -q 'string_to_search' && echo %p\n" | s`

- nc -zv, lsof, df, find, grep
- Fiddler


# Problem Solving in Practice
## Example: Redis cache.put Hangs
- Get thread dump, figure out what's happening when read from cache
- Read related code to figure out how Spring implements `@Cacheable(sync=true
 RedisCache$RedisCachePutCallback`
- Check whether there's cacheName~lock in redis
- When use some feature, know how it's implemented.

## [Practice - Iterator vs Iterable](https://lifelongprogrammer.blogspot.com/2017/02/iterator-vs-iterable-dont-use-iterator.html){target="blank"}
- What’s the problem in the following Code?
  ```java
  @Cacheable(key = "#appName")
  public Iterator<Message> findActiveMessages(final String appName) {}
  ```

## [Practice - Iterator vs Iterable](https://lifelongprogrammer.blogspot.com/2017/02/iterator-vs-iterable-dont-use-iterator.html){target="blank"}
- How to find the root cause
- Symptoms: The function only works once in a while: when cache is refreshed

::: incremental

- Difference between Iterator vs Iterable
- Don't use Iterator when need traverse multiple times
- Don't use Iterator as cache value

:::


## [Practice 2 - Spring Cacheable Not Working](https://lifelongprogrammer.blogspot.com/2017/01/spring-cacheable-not-working-and-how-to-solve-it.html){target="blank"}
- The class using cache annotation inited too early
- Add a breakpoint at the default constructor of the bean, then from the stack trace we can figure out why and which bean (or configuration class) causes this bean to be created
- Understand how spring cache works internally, spring proxy
- CacheAspectSupport

# Post Mortem
## Reflection: Lesson Learned
- How we find the root causeWhy it takes so long
- What we have learned
- What's the root cause
- Why we made the mistake
- How we can prevent this happens again
- Share the knowledge in the team via wiki, quip, email etc.
- Take time to solve problem, find the root cause, but only (take time to) solve it once


## Think More
- Think over the code/problem, try to find better solution even the issue's solved
- Everything that stops you from working effectively is a problem
<!-- - No access, slack different teams etc -->
- Fix them

# Bonus
## Building Troubleshooting-Friendly Application
- Return meaningful error code and response
- Return debug info that can check from response when requested
  - Should be safe to use or protected
- Add requested_id in client (automatically when provide client application)
- Mock User Feature
- Preview Feature

## [How to write test efficiently](https://lifelongprogrammer.blogspot.com/2016/03/testing-tips-for-java-developers.html){target="blank"}
- Learn and Use `Hamcrest, Mockito, JUnit, TestNG, REST Assured`
- Add Static Import in Eclipse
  - Preferences > Java > Editor > Content Assist > Favorites, then add:

```java
org.hamcrest
org.hamcrest.Matchers.*
org.hamcrest.CoreMatchers.*
org.junit.*
org.junit.Assert.*
org.junit.Assume.*
org.junit.matchers.JUnitMatchers.*
org.mockito.Mockito
org.mockito.Matchers
org.mockito.ArgumentMatchers
io.restassured.RestAssured
```


---

- [This presentation was built using Reveal.js, Markdown and Github Pages](https://lifelongprogrammer.blogspot.com/2019/03/building-presentations-with-reveal-js-markdown-and-github-pages.html){target="blank"}
<!-- SD: How to Improve Problem Solving Skills: Why, How to Solve a Problem, Tools, Post Mortem. -->

--- 

#### [Related Posts](https://lifelongprogrammer.blogspot.com/search/label/Problem Solving){target="blank"}
<script src="https://lifelongprogrammer.blogspot.com/feeds/posts/default/-/Problem Solving?orderby=updated&amp;alt=json-in-script&amp;callback=weightedRandomRelatedPosts&amp;max-results=20"></script>
