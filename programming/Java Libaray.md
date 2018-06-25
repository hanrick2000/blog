
#### [Hamcrest](https://github.com/hamcrest/JavaHamcrest/wiki/Related-Projects)


#### [JsonUnit](https://github.com/lukas-krecan/JsonUnit)
- compare and verify json string


```java
assertThat("{\"test\":1}", jsonPartMatches("test", is(valueOf(1))))
assertThat("{\"test\":1}", jsonEquals(resource("test.json")));
```

