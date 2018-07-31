

- license, streaming
- 


- Open Connect: Customized CDN
### CDN|PoP|Edge Servers
- replicate data close to users
- speed and reliability
- Netflix knows members(size, language), what they like to watch
- new released videos, potential popularity

### Open Connect Appliances
- proactive caching
- put OCAs in ISP's datacenters for free
- Using ISPs and IXPs(internet exchange location) to build a CDN.

### tiered caching system
- copy videos from local/nearby OCAs at off-peak hours
  - midnight, lunchtime
- There's never a cache miss in Open Connect

### Storage
- store videos in S3
  - different resolution, audio quality, formats, HD, SD

### Smart client
- adaptive video/audio quality based on connectivity


- [Delegate responsibility for state management to the persistence tiers, keeping the application tiers stateless](http://techblog.netflix.com/2015/01/netflixs-viewing-data-how-we-know-where.html)
- [Decouple communication between components by using signals sent through an event queue]


- Production houses and studios


