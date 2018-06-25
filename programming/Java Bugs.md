When write code, use examples to help verify the code/function

#### Don't miss
- After while/for, do we need handle remaining elements?
- else?

#### Recursion
- Base condition

#### What kind of bugs may exist in the code
- Common mistakes, suspicious code
- Array/List access: invalid index
    - Need check index valid?
```java
end = array.length - 1;  // not end = array.length;
```

Check null before while loop
```java
if (graph.get(curNode) != null) {
  for (Integer nb : graph.get(curNode)) {}}
```

##### Choose API that is more descriptive, less error-prone
- Use add(remove/Peek)Last/First instead of push or poll (ArrayDeque)


#### Write test to verify common methods like toString, hashCode, equals which may throw stackoverflowError


```java
for (int i = 0; i < queue.size(); i++) // not work as queue.size changes when poll
for (int n = q.size(); n > 0; n--) // use this one
// while (!queue.isEmpty())  use this one
{totalPro += queue.poll().prob;}
```

