### Dynomite
- a sharding and replication layer
- make existing non distributed datastores into a fully distributed & multi-datacenter replicating datastore
- Each Dynomite node has a Dynomite process co-located with the datastore server, which acts as a proxy, traffic router, coordinator and gossiper


- Micro batching
  - split it into shard aware micro-batches under the covers, execute them individually and then stitch the results back
  - retry just the failed micro-batch



