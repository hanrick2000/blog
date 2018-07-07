

[CFR](http://www.benf.org/other/cfr/)
- Supports Java 8, including lambda expessions and method references

[Bytecode Viewer](https://github.com/Konloch/bytecode-viewer)



### jq

'.cluster.collections.mozart_prod_08072017.shards'

curl -v  --socks5 localhost:3001  "http://pv31p01if-ztcx06024501.pv.if.apple.com:8983/solr/admin/collections?action=CLUSTERSTATUS&wt=json" | jq '.cluster.collections.mozart_prod_08072017.shards | to_entries[] | .key' > pv.json