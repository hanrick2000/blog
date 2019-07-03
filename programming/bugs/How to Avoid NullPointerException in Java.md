---
description: How to create a custom "Page Not Found" to promote posts and maintain our own custom redirects in Blogger.
---

#### Check Null
- Check Method Arguments for null early and throw exception (IllegalArgumentException) with meaningful error message
  - `Objects.requireNonNull(arg, "arg must not be null");`{.java}
  - [Lombok \@NonNull](https://projectlombok.org/features/NonNull){target="blank"}
- Read the document or source code and find out whether the method may return null.
  - For example `file.listFiles()`{.java} can return null if it's not a folder or doesn't exist
- If not sure whether the method may return null or nor, be defensive: check null.

##### Detect NPE and other bugs in IDE or Maven/Gradle
<!-- - \@NonNull and \@CheckForNull with SpotBugs -->
- \@NonNull and \@Nullable with Checker Framework


#### Use null safe methods and libraries
- Call methods on known literal rather unknown object
  - `"constant".equals(object);`{.java} instead of `object.equals("constant");`{.java}
- Use `java.util.Objects#equals`{.java}
- Use `String.valueOf(object)`{.java} over `object.toString()`{.java}
- instanceof is null-safe: no need to check null
```java
// StringUtils from apache commons-lang
StringUtils.IsEmpty/IsBlank()
// from commons-collections4
CollectionUtils.is(Not)Empty(col);
```

#### Return empty collection/array, instead returning null
- Effective Java Item 54: Return empty collections or arrays, not nulls
- As client would usually forget the null check.
- `return Collections.EMPTY_LIST`{.java}

#### Throw exceptions instead return a null or an empty string
<!-- exceptions are a much better way to handle errors than returning a null or an empty string -->

#### Unboxing and NullPointerException
When mix wrapper class and primitive type, Java will auto unbox the wrapper class to primitive type(**boolean**, int, long, etc), if the wrapper class is Null, then it would throw NullPointerException.

```java
Map<String, Boolean> map = new HashMap<>();
if (map.get(key)) {}
```

In the above code, when map doesn't contain the key, or its value is null, it would throw NullPointerException. One fix is to use `Objects.equals`{.java}


#### Check whether collection is Null before loop
- `for(variable: collection)`{.java} will throw NullPointerException if the collection is null.

<!-- #### Check whether collection contains the key before -->

#### [Carefully check whether a k/v collection can store null value, refer to the table below:](https://alibaba.github.io/Alibaba-Java-Coding-Guidelines/#collection){target="blank"}

| Collection        | Key                     | Value                   | Note          |
| ----------------- | ----------------------- | ----------------------- | ------------- |
| Hashtable         | Null is not allowed     | Null is not allowed     | Thread-safe   |
| ConcurrentHashMap | **Null is not allowed** | **Null is not allowed** | Segment lock  |
| **TreeMap**       | **Null is not allowed** | Null is allowed         | Thread-unsafe |
| **HashMap**       | Null is allowed         | Null is allowed         | Thread-unsafe |


#### [Rules for using primitive data types and wrapper classes](https://alibaba.github.io/Alibaba-Java-Coding-Guidelines/#oop-rules)
> 1) Members of a POJO class must be wrapper classes.
>
  2) The return value and arguments of a RPC method must be wrapper classes.
>
  3) [Recommended] Local variables should be primitive data types.
>
>>> Note: In order to remind the consumer of explicit assignments, there are no initial values for members in a POJO class. As a consumer, you should check problems such as NullPointerException and warehouse entries for yourself.
>
  Positive example: As the result of a database query may be null, assigning it to a primitive date type will cause a risk of NullPointerException because of autoboxing.
>
  Counter example: Consider the output of a transaction volume’s amplitude, like ±x%. As a primitive data, when it comes to a failure of calling a RPC service, the default return value: 0% will be assigned, which is not correct. A hyphen like - should be assigned instead. Therefore, the null value of a wrapper class can represent additional information, such as a failure of calling a RPC service, an abnormal exit, etc.

>> <cite>[Alibaba Java Coding Guidelines](https://alibaba.github.io/Alibaba-Java-Coding-Guidelines/#oop-rules)</cite>


#### Use Optional Class
<!-- - Define instance variables, parameters of function as Optional -->
- Return Optional<Bar> instead of a nullable Bar
- We can still use nullable references for instance variables or parameters of function.

##### [Check null for a chain of method calls](https://winterbe.com/posts/2015/03/15/avoid-null-checks-in-java/)
Use Optional
```java
Optional.of(new Outer())
    .map(Outer::getNested)
    .map(Nested::getInner)
    .map(Inner::getFoo);
```
Use a supplier function
```java
public static <T> Optional<T> resolve(Supplier<T> resolver) {
  try {
      T result = resolver.get();
      return Optional.ofNullable(result);
  }
  catch (NullPointerException e) {
      return Optional.empty();
  }
}
```
#### [Check Null explicitly, don't catch NullPointerException](https://alibaba.github.io/Alibaba-Java-Coding-Guidelines/#2-exception-and-logs)
> Do not catch Runtime exceptions defined in JDK, such as NullPointerException and IndexOutOfBoundsException. Instead, pre-check is recommended whenever possible.
>
>> <cite>[Alibaba Java Coding Guidelines](https://alibaba.github.io/Alibaba-Java-Coding-Guidelines/#2-exception-and-logs)</cite>

##### Other NullPointerException Cases
- Using synchronized on a null object
- Throwing an exception which is null