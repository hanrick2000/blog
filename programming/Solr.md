


### Code

bin/solr -e cloud

bin/solr start -cloud -p 8983 -s "example/cloud/node1/solr" && bin/solr start -cloud -p 8984 -s "example/cloud/node3/solr" -z localhost:9983 && bin/solr start -cloud -p 7574 -s "example/cloud/node2/solr" -z localhost:9983


### Logs
```
SolrDispatchFilter.init
```

