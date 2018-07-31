### Design a web crawler
- what to crawl?
  - internal or the whole internets
  - seed urls
- What to store
  - inverted index for search
  - or raw data, extracted plain text/content

- Consistent hash

#### Recrawling
- how frequently the page may be updated 
- next crawl time

#### Components
- Dispatcher
- Crawler
  - Parser
  - Indexer

#### How Crawler knows what to crawl
- messaging? or db

#### How to avoid getting into infinite loops
- Canonical URL
- extracting a unique identifier from the scanned page for internal website