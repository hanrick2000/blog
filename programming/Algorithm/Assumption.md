
### Optimization assumption
- [LeetCode 1003 - Check If Word Is Valid After Substitutions](https://leetcode.com/problems/check-if-word-is-valid-after-substitutions/discuss/248252/java-stack-solution-and-slight-different-ways)
```java
public boolean isValid(String s) {
  Stack<Character> stack = new Stack<>();
  for (char c: s.toCharArray()) {
      if (c == 'c') {
          if (stack.isEmpty() || stack.pop() != 'b') return false;
          if (stack.isEmpty() || stack.pop() != 'a') return false;
      } else {
          stack.push(c);
      }
  }
  return stack.isEmpty();
}
```



