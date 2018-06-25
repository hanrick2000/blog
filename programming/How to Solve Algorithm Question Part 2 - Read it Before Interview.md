### How to find right/better approaches
- O(n): (Ordering) Stack, greedy, dp, two pointers
- O(nlogn): binary search(bisection, trial and error), BST(Treemap), interval tree
- To improve current approaches
    - dp, bisection

#### Types
- Simulation
- Data Structure Design
    - DoubleLinkedList + HashMap(TreeMap)

#### What data structures to use:
- Stack
    - Current result depends on previous state
    - Use ArrayDeque as a stack, [use LinkedList as a stack if we need peek last x(>1) elements](https://leetcode.com/problems/baseball-game/description/)
- PriorityQueue
    - Examples: LeetCode 767 - Reorganize String
    ```java
    MultiChar mc1 = pq.poll(), mc2 = pq.poll();
    if (--mc1.count > 0) pq.add(mc1);
    if (--mc2.count > 0) pq.add(mc2);
    ```
- TreeMap, TreeSet
    - Use it when need keep some order
    - Need (binary) search the key
    - Examples: Interval
- Trie
    - When: Word Search
    - Alternatives: 0-1 Trie


- [Union Find](http://lifelongprogrammer.blogspot.com/2008/07/using-union-find-algorithm.html)
    - Used to connect/join/group things
    - Maintain knowledge of the connected components of a graph
    - Use Array: when we know the size
    - Otherwise use HashMap
    - Existing nodes and one or (two new nodes: LeetCode 684 - Redundant Connection)
```
vector<int> parents, ranks;
```

#### Sliding window, Two pointers
- When elements in one range is not related with elements before or after
    - LeetCode 838 - Push Dominoes
 

#### Dat Structure Design
- TreeMap, TreeSet
- Multiple data structure: map with LinkedList

#### DP
- multiple states
    - LeetCode 673 - Number of Longest Increasing Subsequence: int[] lengths, counts
- multiple relations
- bit count: dp[i] = dp[i >> 1] + dp[i & 1]
- Patterns:
  - current state is related with i-1 only, or 0 to i-1
  - optimize: from O(N^2) to O(n)

#### DFS


#### BFS
- Merge them if there're duplicates during traverse, better to use dfs+cache or dp in this case]()
- Optimize: 2nd BFS


#### Interval
- TreeMap, sort by start or end
```java
Map.Entry<Integer, Integer> entry = tm.lowerEntry(end);
treeMap.put(start, end);
```
- Think as interval, and sort by start or end
- Think start and end as different points
    - 
    - Boundary Count: [Meeting Room II](http://massivealgorithms.blogspot.com/2015/08/like-coding-leetcode-253-meeting-rooms.html)
```java
treeMap.put(start, treeMap.getOrDefault(start, 0) + 1);
treeMap.put(end, treeMap.getOrDefault(end, 0) - 1);
```
- List<Interval>: treemap approach is easier to implement
- [Interval Tree](https://leetcode.com/problems/falling-squares/discuss/108765/Java-14ms-beats-99.38-using-interval-tree)
    - Can be made to self balanced
```java
int start, end, maxEnd; //(of the subtree);
```

#### Post Order Traverse
- Capture prev node [LeetCode 530 - Minimum Absolute Difference in BST](http://massivealgorithms.blogspot.com/2017/03/leetcode-530-minimum-absolute.html)

### Binary search Tree
- lower, upper bound
- capture prev node (inorder predecessor)

#### Tricks:
- freqs(count) map
- presort, prefixSum(sum of subarray)

#### Graph
- graph thinking: convert to graph problems
    - [LeetCode 742 - Closest Leaf in a Binary Tree] convert binary tree to graph
    
#### Math
- Combination

```java
int[] last = new int[10];
last[A[i] - '0'] = i;
```