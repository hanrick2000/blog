```java
list.toArray(new Interval[ans.size()]);
Arrays.asList(-1);

Map<String, Long> collect = 
    wordsList.stream().collect(groupingBy(Function.identity(), counting()));

Map<String, Integer> collect = 
    wordsList.stream().collect(groupingBy(Function.identity(), summingInt(e -> 1)));

map.computeIfAbsent(key, x-> new ArrayList<String>()).add(v1);

int[][] dirs = {{-1, 0}, {0, 1}, {1, 0}, {0, -1}}

if(res.size()<level+1)  res.add(new ArrayList<>());
```

#### Common bugs
- dfs(int index), think the index will change its value during recursion
- use global variables or int[]