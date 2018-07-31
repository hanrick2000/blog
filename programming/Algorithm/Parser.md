### Related
- usually related with stack
- linear scan
- divide and conquer

- [LeetCode 385 - Mini Parser](http://www.voidcn.com/article/p-bbkeyzij-bpk.html)
  - [recursion](https://leetcode.com/problems/mini-parser/discuss/86083/Short-Java-recursive-solution)
  - [stack](http://www.voidcn.com/article/p-bbkeyzij-bpk.html)
```java
public NestedInteger deserialize(String s) {
    if (!s.startsWith("[")) {
        return new NestedInteger(Integer.parseInt(s));
    }
    Stack<NestedInteger> stack = new Stack();
    NestedInteger res = new NestedInteger();
    stack.push(res);
    int start = 1;
    for (int i = 1; i < s.length(); i++) {
        char c = s.charAt(i);
        if (c == '[') {
            NestedInteger nest = new NestedInteger();
            stack.peek().add(nest);
            stack.push(nest);
            start = i + 1;
        } else if (c == ']' || c == ',') {
            if (i > start) {
                NestedInteger nest = new NestedInteger(Integer.parseInt(s.substring(start, i)));
                stack.peek().add(nest);
            }
            start = i + 1;
            if ( c == ']') {
                stack.pop();
            }
        }
    }
    return res;
}
```



