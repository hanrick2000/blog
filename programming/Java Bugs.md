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

### Common Bugs
#### Close resource in finally block or using try-with
- It's easier to forget when the create or close resource methods are in separate methods


#### NPE
- check null before for loop
- check whether the map contains the element
```java
// Throws NPE when map doesn't contain the element
partitions.stream().flatMap(partition -> partitionMap.get(partition).stream())
// =>
partitions.stream().filter(partition -> partitionMap.containsKey(partition)).flatMap(partition -> partitionMap.get(partition).stream())
```

#### Collection.remove
1. UnmodifiableCollection or UnmodifiableIterator
- Whether the collection is modifiable or immutable
```java
common = Sets.intersection(cs1.getCollections(), cs2.getCollections());
// This would fail with UnsupportedOperationException: at UnmodifiableIterator.remove
common.remove("elmentA");
```
2. [ConcurrentModificationException](https://www.baeldung.com/java-concurrentmodificationexception)
3. Whether updating this collection will change its underlying data structure
- sublist, keySet() etc

##### Examples
```java
// wrong
folderName.substring(folderName.indexOf('_') + 1).substring(0, folderName.indexOf('_')).toLowerCase();
// fix:
folderName.substring(folderName.indexOf('_') + 1, folderName.lastIndexOf('_'));
```

```java
for (int i = 0; i < queue.size(); i++) // not work as queue.size changes when poll
for (int n = q.size(); n > 0; n--) // use this one
// while (!queue.isEmpty())  use this one
{totalPro += queue.poll().prob;}
```

#### Use BufferedInput(Output)Stream