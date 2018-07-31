
### Graph search
### Unicorn
- In-Memory "social graph aware" indexing system
- Rack Aggregator benefits from the fact that bandwidth to servers within a rack is higher.

#### components
- Top aggregator
- Vertical aggregator

#### Search across Verticals
- posting lists: order them by importance

- Weak And allows operands to be missing from some fraction of the results within an index shard
- strong or: Requires certain operands to be present in some fraction of the matches.
- Apply Operator
  - allows client to query a set of ids and then use the resultant ids to construct and execute a new query
  - allow a system to perform expensive operations lower in the hardware stack. However, by allowing clients to show semantic intent, optimizations are possible to preserve search time.
- Extract Operator
  - de-normalizing: store ids of people tagged in a photo in the forward index
#### Privacy
- Lineage is a structured representation of the edges that were traversed in order to yield a result.

### Typeahead - facebook search box to find your friends/pages
<img src='http://cdn.usefulstuff.io/2013/03/typeahead_search.jpg' />

- [First degree relations include user's friends, his/her likes, activities and etc](http://shirleyisnotageek.blogspot.com/2016/11/facebook-typeahead-search.html)
- For the global results, it can always be ranked and cached in advance as those are indifferent to different users

- [Bootstrapping Connections](https://www.facebook.com/notes/facebook-engineering/the-life-of-a-typeahead-query/389105248919/)
- As soon as the user focuses in the text box, we send off a request to retrieve all of the user's friends, pages, groups, applications, and upcoming events. We load these results into the browser's cache, so that the user can find these results immediately without sending another request
- If there are not enough results in the current browser cache, the browser sends an AJAX request containing the current query string and a list of results that are already being displayed due to browser cache. Our load balancer routes the request to an appropriate web machine.

- Aggregator Service
  - delegating queries to multiple lower-level services in parallel and integrating their results
  - The aggregator merges the results and features returned from each leaf service and ranks the results according to our model. The top results are returned to the web tier.

- Leaf Services
  - Each leaf service is designed to retrieve and rank results on only a few specific features

- The global service maintains an index of all the pages and applications on the site
- save latency by storing recent results in a memcached-based query cache

#### Fetching Data and Validating Results
- The results returned by the aggregator are simply a list of ids. The web tier needs to fetch all the data from memcache/MySQL to render the results and display information like the name, profile picture, link, shared networks, mutual friends, etc.
- needs to do privacy checking

#### Displaying the Results
- These results are also added to the browser cache along with the bootstrapped connections so that similar subsequent queries don't need to hit the backend again