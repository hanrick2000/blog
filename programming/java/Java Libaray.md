
#### [Hamcrest](https://github.com/hamcrest/JavaHamcrest/wiki/Related-Projects)


#### [JsonUnit](https://github.com/lukas-krecan/JsonUnit)
- compare and verify json string


```java
assertThat("{\"test\":1}", jsonPartMatches("test", is(valueOf(1))))
assertThat("{\"test\":1}", jsonEquals(resource("test.json")));
```

- [Feign makes writing java http clients easier](https://github.com/OpenFeign/feign)
- [GraphQL](https://piotrminkowski.wordpress.com/2018/08/16/graphql-the-future-of-microservices/)
  - [Apollo Client](https://github.com/apollographql/apollo-client)
- Protocol Buffers
  * [Protocol Buffers over Rest](https://piotrminkowski.wordpress.com/2017/06/05/exposing-microservices-over-rest-protocol-buffers/)