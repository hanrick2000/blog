- [ArchUnit](https://www.archunit.org/userguide/html/000_Index.html)

- [CFR](http://www.benf.org/other/cfr/)
  - Supports Java 8, including lambda expessions and method references
- [Bytecode Viewer](https://github.com/Konloch/bytecode-viewer)

### jq
- curl -v  --socks5 localhost:3001  "the_url" | jq '.cluster.collections.collection_name.shards | to_entries[] | .key'