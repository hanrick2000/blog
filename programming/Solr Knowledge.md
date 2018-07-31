


#### [Caches](https://lucene.apache.org/solr/guide/7_4/query-settings-in-solrconfig.html)
##### Filter Cache
- for filters (DocSets) for unordered sets of all documents that match a query.
- Used by fq, facet query when facet.method is set to fc

#### queryResultCache
- hold the results of previous searches: ordered lists of document IDs (DocList) based on a query, a sort, and the range of documents requested.

#### documentCache
- hold Lucene Document objects (the stored fields for each document)

#### Performance
- [Sorting/Faceting/Grouping on non-DocValues fields](https://medium.com/@sarkaramrit2/frequent-out-of-memory-errors-in-apache-solr-36499f84c98a)


#### Lucene
- [Index File Formats](http://people.apache.org/~doronc/site/fileformats.pdf)