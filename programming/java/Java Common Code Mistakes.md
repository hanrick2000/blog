

#### char
- when no method takes char type, java will automatically convert char into int 
```java
char ch = (char) ('a' + intValue);
// the type would be int without (char)

new StringBuilder().append(ch);
// not new StringBuilder(ch); StringBuilder has no explicit StringBuilder(char) constructor
// so ch would be cast into int type
```



