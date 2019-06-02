

### Overflow/Underflow
- 0 after nanos to millis
```java
public void awaitNanos(long nanosTimeout) {
  try {
    wait(TimeUnit.NANOSECONDS.toMillis(nanosTimeout));
    long millis = TimeUnit.NANOSECONDS.toMillis(nanosTimeout);
    if (millis > 0) { // it may be 0 after nanos to millis
      wait(millis);
    }
  } catch (InterruptedException e) {
    throw new RuntimeException(e);
  }
}
```

### off-by-one
```java
// http://www.gayle.com/blog/2016/3/coding-interviews-and-the-importance-of-perfection
int countSubstrings(String s, String b) {
        int count = 0;
        for (int i = 0; i < b.length() — s.length(); i++) {
                String bSubstring = b.substring(i, i + s.length());
                if (bSubstring.equals(s)) {
                        count++;
                }
        }
        return count;
}
```

<!-- #### Recursive Symlink -->


