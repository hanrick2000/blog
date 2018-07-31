
- [The problem is the data for in-process trips may not be in the backup datacenter. Rather than replicate data they use driver phones as a source of trip data](http://highscalability.com/blog/2015/9/14/how-uber-scales-their-real-time-market-platform.html)
- What happens is the Dispatch system periodically sends an encrypted State Digest down to driver phones. Now let's say there’s a datacenter failover. The next time the driver phone sends a location update to the Dispatch system the Dispatch system will detect that it doesn’t know about this trip and ask the for the State Digest. The Dispatch system then updates itself from the State Digest and the trip keeps on going like nothing happened.

- backup requests with cross server cancellation



