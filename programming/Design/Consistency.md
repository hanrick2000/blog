
### How to handle inconsistency + code for eventual consistency
- [insert, don't update](https://developer.ibm.com/dwblog/2014/coding-eventual-consistency)
- avoid query after insert

### S3
- [the same location is never overwritten](https://medium.com/netflix-techblog/s3mper-consistency-in-the-cloud-b6a1076aa4f8)
- [use DynamoDB(supports consistent operations) to store directory and file info to discover the inconsistency in S3](https://medium.com/netflix-techblog/s3mper-consistency-in-the-cloud-b6a1076aa4f8)