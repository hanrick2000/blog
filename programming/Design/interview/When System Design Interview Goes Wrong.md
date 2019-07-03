### [How to Land Your Dream Job Series](https://lifelongprogrammer.blogspot.com/search/label/Google_Series){target="blank"}
<script src="https://lifelongprogrammer.blogspot.com/feeds/posts/default/-/Interview_Series?orderby=updated&amp;alt=json-in-script&amp;callback=series&amp;max-results=20"></script>

---

### The Approach
- It's important to follow some systematic approach and drive/lead this conversation.
  - SNAKE(Scenario, Needs, Application, Kilobyte(Data), Evolve)
  - Requirements, constraints/estimates, high-level design, detailed design
  - Talk about different approaches, pros and cons
- It’s more important to follow the approach when you don’t have (much) clue or the interviewer wants to focus on specific domain or jump to detail too early.

---

System design interview is very important, as it's usually conducted by managers or senior engineers who have more power to decide to hire or not, or the level.

Different from coding interview, how the system design interview goes varies a lot. Some companies(like Facebook) follow some good process, but others are not.

Depended on the interviewer, or what the candidate says, the system design interview may go wrong pretty soon.

<!-- ### Traps in System design -->

<!-- #### Whiteboard
- Use whiteboard and bulletin
- Bullet
```md

### Requirement

``` -->

---

### 1. Algorithm/Coding Question as a part of System Design
- During the middle of the discussion, the interviewer may (unexpectedly) ask algorithm question.

#### Example: Autocomplete Service
- As a system design question, the candidate may talk about: requirement
- for a distributed prefix tree, how to shard data: consistent hash etc.
- The interviewer may also ask and focus on how to Get top x word (ranked by frequency) from a single server trie: the algorithm question.
- The candidate should be aware of the change, and approach it as an algorithm question and quickly give an optimal algorithm/pseudo code quickly.
  <!-- - data structure, -->

---

### 2. The interviewer looking for specific direction/answer
### Focus on detail too soon and too much
<!-- - Some companies or interviewer have some -->
- There are a lot of things the candidate can talk, but sometimes, the interviewer is looking for some specific direction/answer.
- This is not good, as the system design is supposed to let the candidate lead the process, but you have to try your best when you are in this situation.

### Example: One backend key value db server is slow, how to solve it?
The interviewer may jump to how to use cache, before you go that direction, make sure you also(still) talk about the scenario,  outline other approaches first.

You may not have much time to go through those: you have to take and talk a lot about X when the interviewer is saying: `let's go X approach`, but  still outline them in the whiteboard, at least you can resume those later.

- Make sure ask these questions first
  - does the backend provide client library?
  - How many client apps? How easy to update them to new code/library?
  - What's the goal? How much effort? a short term fix to just make it work? or a long term invest
  - What's the team structure? Who is responsible to fix it (what team has the resource)? DB team or client team?
- Potential solutions/discussion:
  - local cache in client side or remote central cache
  - request coalescing in client library
  - distribute the db: shard the database and add a proxy layer which can distribute the request to the right shard
  - Stability: rate limit, etc

---

### What We Can Do?
#### Do Not Repeat Yourself
- When asked the same questions after you already give (some) answer about it. Don’t just repeat your previous answer or try to expand it.
- Usually, this means your answer is not what the interviewer is looking for at all.
- Talk something meaningful and useful, that shows your skills.

#### Know/Guess what's the interview is looking for


#### How vs Why and What
In system design, how to do it in detail is usually not important, instead focus on why and what info we are trying to get.

- `Between approach x and y, how you can determine which approach to take?`
- `With the system is already running, how can you decide you should add local cache or centralized cache?`
  - THIS IS NOT IMPORTANT: ~~how to add the log, what to log and how to analyze log~~
  - WHAT IS IMPORTANT: how to determine the cache performance: hit ratio.

---

### System Design Books
- [Designing Data-Intensive Applications: The Big Ideas Behind Reliable, Scalable, and Maintainable Systems](https://www.amazon.com/Designing-Data-Intensive-Applications-Reliable-Maintainable/dp/1449373321){target="blank"}
- [The Art of Scalability: Scalable Web Architecture, Processes, and Organizations for the Modern Enterprise, Second Edition](https://www.amazon.com/Art-Scalability-Architecture-Organizations-Enterprise/dp/0134032802){target="blank"}
- [Web Scalability for Startup Engineers](https://www.amazon.com/Scalability-Startup-Engineers-Artur-Ejsmont/dp/0071843655){target="blank"}

<script type="text/javascript">
amzn_assoc_placement = "adunit-systemdesign";
amzn_assoc_search_bar = "false";
amzn_assoc_tracking_id = "jeffery06-20";
amzn_assoc_ad_mode = "manual";
amzn_assoc_ad_type = "smart";
amzn_assoc_marketplace = "amazon";
amzn_assoc_region = "US";
amzn_assoc_title = "Best books for System Design interview";
amzn_assoc_linkid = "595ccbf639e3d3215212481e02dc6909";
amzn_assoc_asins = "1449373321,0134032802,0071843655,1680502093,0134494164,B071CM2M1F,1521243972,1787121690";
</script>
<script src="//z-na.amazon-adsystem.com/widgets/onejs?MarketPlace=US"></script>

### System Design Prep Resource
- [Grokking the System Design Interview](https://www.educative.io/collection/5668639101419520/5649050225344512){target="blank"}
- [System Design from hiredintech](https://www.hiredintech.com/system-design){target="blank"}
- [How to Ace a Systems Design Interview from palantir](http://www.palantir.com/2011/10/how-to-rock-a-systems-design-interview/){target="blank"}
- [Success in Tech: YouTube](https://www.youtube.com/channel/UC-vYrOAmtrx9sBzJAf3x_xw){target="blank"}
- [All Time Favorites from highscalability](http://highscalability.com/all-time-favorites/){target="blank"}
- [System Design Primer](https://github.com/donnemartin/system-design-primer){target="blank"}
- [blog.gainlo.co](http://blog.gainlo.co/){target="blank"}
