#### Throw Exception
##### Include descriptive contextual messages in the exception
##### Throw specific checked exceptions, don't throw RuntimeException, Exception, or Throwable
- The checked exception is part of the contract of the method, so client knows what exceptions it can catch and handle.
- If one method throws both base exception and one of its sub-class exception, we should declare both (the base and the specific sub-class) exception not just the base exception.

##### Throw exception in the right abstraction
- Wrap low level exception in custom high level exception

##### Using Custom Exceptions

##### Don't lose original exception
- It's common that we re-throw  but when we do this, make sure to include the original exception as the cause otherwise we will lose the original error message and stack trace.
```java
catch (SomeException e) {
   throw new MyServiceException("Some information: " , e);
}
```

##### Throw Exception Misc
- Can't happen? Throw AssertionError.


#### [Throw early catch late](https://softwareengineering.stackexchange.com/questions/231057/exceptions-why-throw-early-why-catch-late)
> You want to throw an exception as soon as possible because that makes it easier to find the cause
>
> exceptions are handled at higher levels is because the lower levels don't know what's the appropriate course of action to handle the error

#### Valid parameter, user input early

#### Logging
##### Don't Log the exception and re-throw
- It will write same exception multiple times.
```java
catch (DaoException e) {
   LOGGER.error("xxx", e);
   throw e;
}
```


#### Catch Exception
- Catch specific exception, not the Exception class
- [Never swallow the exception](https://alibaba.github.io/Alibaba-Java-Coding-Guidelines/#2-exception-and-logs)
  - If you do not want to handle it, then re-throw it. The top layer must handle the exception and translate it into what the user can understand.
- Never catch Error or Throwable

##### Only catch those exceptions that we can handle
- We may catch it to add more information.
- But if we can't handle it, it's better to let the caller decide what to do.

##### [Do not catch Runtime exceptions defined in JDK, such as NullPointerException and IndexOutOfBoundsException. Instead, pre-check is recommended whenever possible.](https://alibaba.github.io/Alibaba-Java-Coding-Guidelines/#2-exception-and-logs)
> Use try-catch only if it is difficult to deal with pre-check, such as NumberFormatException.


#### Finally
##### Never use return within a finally block.
- A return statement in a finally block will cause exceptions or result in a discarded return value in the try-catch block.

##### Don't throw exception in the finally block
- It will override the original exception.

##### Close resources: stream
- `IOUtils.closeQuietly(stream)` from Apache commons-io

##### Using try-with-resources

#### [Be careful of NullPointerException](https://lifelongprogrammer.blogspot.com/2019/06/how-to-avoid-null-pointer-exception-in-java.html){target="blank"}
- Read more about [how to avoid NullPointerException in java](https://lifelongprogrammer.blogspot.com/2019/06/how-to-avoid-null-pointer-exception-in-java.html){target="blank"}

#### Misc
- Never use exceptions for control flow

##### Document all exceptions in public API
- When the exception may throw.
- How client can handle it.

<!-- ##### Do not Repeat Yourself
- If same -->


