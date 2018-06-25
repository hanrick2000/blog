#### Splunk
##### Search syntax
- key=value AND OR NOT
- | [sort num(ip) desc](http://docs.splunk.com/Documentation/Splunk/latest/SearchReference/Sort), -str(url) | sort -value
- | reverse
- | top(or rare) limit=5 name
- | head 5
- | highlight fa, fb
- | dedup fa
- | stats count by method
- | chart count by method url
- | timechart span=15m count by url 

earliest="11/5/2017:20:00:00" latest="11/12/2017:20:00:00" 

##### [Show only Certain Fields](https://answers.splunk.com/answers/10017/how-to-show-only-certain-fields-of-the-events-in-the-search-results.html)
| table field

##### [(Not) contains a field](https://answers.splunk.com/answers/59305/how-to-find-records-that-do-not-contain-a-certain-field.html)
NOT fa=*
##### See all values in a field
| top a_number SourceName

##### Interesting Fields
- Explore and know what values for a field

##### Events before or after X seconds 
- Show logs around current event

##### Visualizations Tab

#### Linux
##### [crash or reboot?](https://serverfault.com/questions/789442/how-can-you-distinguish-between-a-crash-and-a-reboot-on-rhel7)
ast -n2 -x shutdown reboot
- If this reports a SYSTEM_SHUTDOWN followed by a SYSTEM_BOOT, all is well; however, if it reports 2 SYSTEM_BOOT lines in a row, then clearly the system did not shutdown gracefully

host $ip

##### Write Troubleshooting Friendly Program
- Name your thread