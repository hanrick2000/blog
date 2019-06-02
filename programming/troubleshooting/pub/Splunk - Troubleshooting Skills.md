#### Tips
- [Expand messages to show all fields](https://answers.splunk.com/answers/103005/expand-json-messages-by-default.html)
  - Click `Format` on the top and select `All lines` for the `Max Lines` setting

#### Search syntax
- key=value AND OR NOT
- | [sort num(ip) desc](http://docs.splunk.com/Documentation/Splunk/latest/SearchReference/Sort), -str(url) | sort -value
- | reverse
- | top(or rare) limit=5 name
- | head 5
- | highlight fa, fb
- | dedup fa
- [stats (stats-function(field) [AS field])... [BY field-list]](http://docs.splunk.com/Documentation/Splunk/7.1.2/SearchReference/Stats)
- | chart count by method url
- | timechart span=15m count by url 
- earliest="11/5/2017:20:00:00" latest="11/12/2017:20:00:00" 

#### [rex](http://docs.splunk.com/Documentation/Splunk/7.1.2/SearchReference/Rex)
```config
rex field=_raw "From: <(?<from>.*)> To: <(?<to>.*)>" | dedup from to | table from to
rex field=message "pause of approximately (?<time>.*)" | dedup time | table time
rex field=message "pause of approximately (?<time>.*)" | stats count by time
rex field=message ".* 0 (?<time>\d*)" | timechart max(time)
```

#### [Show only Certain Fields](https://answers.splunk.com/answers/10017/how-to-show-only-certain-fields-of-the-events-in-the-search-results.html)
| table field

#### [(Not) contains a field](https://answers.splunk.com/answers/59305/how-to-find-records-that-do-not-contain-a-certain-field.html)
NOT fa=*
#### See all values in a field
| top a_number SourceName

#### Examples
```text
index=the_app lvl=ERROR | top limit=100 ttl, app | sort count desc
eval cluster=app+"-"+partition | top 100 cluster, ttl
```
#### Interesting Fields
- Explore and know what values for a field

#### Events before or after X seconds 
- Show logs around current event

#### Visualizations Tab

#### Write Splunk Friendly Log
- Separate the main message and key/value pairs
- The main message should be variable-free
- Use util class (or) to help implement this