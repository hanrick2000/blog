
### Basic Functions
- Insert: long url -> return short url
- Query: short url -> return long url if exists

### Estimation
- per second usually, and in peak

### Performance - SLA
### Access Pattern
- read heavy

### Requirements
### short urls:
- do we support expiry? or delete urls?

- guessable, prevent reverse engine
- from the id we can know the url or vice verse
- how many ids stored in our system
- is the short url always valid, do we expire them?
- Undesirable words

- Previewing the long URL
  - show the long url
### Users
- Anonymous or registered, paid user? 

### Business Mode
- stats

### Security

### How to optimize read
- layered cache
- except database cache, remote centralized cache, local cache, cdn

### How to optimize write
- Asynchrony
### How to handle hot URLs?
- the properties: short lived or long lived?
- predictable? push these into CDN, edge nodes


### Fault Tolerance(Robustness)
- separate of concerns
- feature flag:
  - able to disable write or some low priority tasks in the system
- degrade
- separate of read/write
  - master/slave, backup
- retry with back off

### How to Generate ID?
- **Distributed ID Generator**
- dedup or not?
- 
- [Auto Incremental ID + Map it to base 64](http://n00tc0d3r.blogspot.com/2013/09/big-data-tinyurl.html)
  - not scalable, bottleneck: every insert need lock the db

### 301 or 302
- permanent redirect: search engine will show the dest address and not forward the request to the server at all
- temporary redirect


### How to track top N popular URLs?

### Other Functions
#### statistics

### Design Pastebin
- pastebin requires storing the paste contents instead of the original unshortened url

- size limt of text content
