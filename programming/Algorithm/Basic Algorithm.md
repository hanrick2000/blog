#### Starting point/focus
- boundaries
- local boundaries(min, max)

### BUD
#### Reduce duplicates

#### Break into Sub-problems
#### Abstraction, sub-method

#### States/Variables
- parent/prevNode
- what we need track or find out
- freqs, last[],
- int[] sums
  - [LeetCode 473 - Matchsticks to Square](https://leetcode.com/articles/matchsticks-to-square/)
- [LeetCode 845 - Longest Mountain in Array: up, down](https://leetcode.com/problems/longest-mountain-in-array/discuss/135593/C%2B%2BJavaPython-1-pass-and-O(1)-space)
#### Check extra optimization
- exit early


### Graph
#### Coloring, Bipartition
- int[] colors

#### Detect cycle in an undirected graph
- [Union-Find](https://algorithms.tutorialhorizon.com/graph-find-cycle-in-undirected-graph-using-disjoint-set-union-find/)
- [DFS - isCycleUtil(int currVertex, boolean [] visited, int parent)](https://algorithms.tutorialhorizon.com/graph-detect-cycle-in-undirected-graph-using-dfs/)
- [BFS - slower](https://www.geeksforgeeks.org/detect-cycle-in-an-undirected-graph-using-bfs/)
  - int[] parent, mark parent so that parent is not considered for cycle

#### Detect cycle in a directed graph
- [DFS - visited[], recursiveArr[]](https://algorithms.tutorialhorizon.com/graph-detect-cycle-in-a-directed-graph/)
  - Recursion stack[] is used from keep track of visiting vertices during DFS from particular vertex and gets reset once cycle is not found from that vertex and will try DFS from other vertices.
- [Using Colors: White, Gray, Black](https://algorithms.tutorialhorizon.com/graph-detect-cycle-in-a-directed-graph-using-colors/)


### Mistakes
- Base condition
- Reset state in dfs/backtrack
- Variable state change


#### Prefix Sum
- Use Case:
  - subarray sum

#### Two Pointers
#### Slide window

#### [Topological Sort](https://www.geeksforgeeks.org/topological-sorting-indegree-based-solution/)
- objects ordered based on some rules
- Partial ordering
- Implementation
  - Pick all the vertices with in-degree as 0 and add them into a queue
  - Remove a vertex from the queue then Decrease in-degree by 1 for all its neighboring nodes. If in-degree of a neighboring nodes is reduced to zero, then add it to the queue.


#### MinMax
- [LeetCode 464 - Can I Win](https://leetcode.com/problems/can-i-win/discuss/95277/Java-solution-using-HashMap-with-detailed-explanation)
```java
// iterate all next step(opponent), if one lose for opponent, then return win for me
```
- [LeetCode 375 - Guess Number Higher or Lower II](https://leetcode.com/problems/guess-number-higher-or-lower-ii/discuss/84764/Simple-DP-solution-with-explanation~~)
- dp[L][R] = Math.min(dp[L][R], i + Math.max(dp[L][i - 1], dp[i + 1][R]));

#### Graph
- Adjacency List: LinkedList<Integer> list[]; List<List<Integer>> adjList;
- edge, group
- traverse: BFS, DFS
  - with state
    - [LeetCode 864 - Shortest Path to Get All Keys](https://leetcode.com/problems/shortest-path-to-get-all-keys/discuss/147696/Java-23ms-BFS-solution)
      - q.offer(new State(keys, i, j)); visited.add(keys + " " + i + " " + j);
    
##### [Connected Component](https://leetcode.com/problems/most-stones-removed-with-same-row-or-column/solution/)
##### Topological sort(BFS)
- indegree, outdegree, 
- Remove the leaves, update the degrees of inner vertexes

#### BFS
- Application:
  - shortest path
- Two(multi) ended bfs
- PriorityQueue: Dijkstra single source shortest path
- [Symmetric Tree](https://leetcode.com/articles/symmetric-tree/)
```java
q.add(t1.left);
q.add(t2.right);
q.add(t1.right);
q.add(t2.left);
```

#### DFS
#### Flood Fill

### Data Structure
#### Queue
- [Multiple queues](https://blog.csdn.net/happyaaaaaaaaaaa/article/details/51586542)
#### Union Find


#### DP
- i -> i+1

- Solve n-1 first or solve 1 first.

### Binary Tree
- Bottom up, post order traverse, child -> parent

#### Binary Search Tree
- low, hight
- TreeSet, TreeMap
- Create BST tree (with extra info) and calculate at same time
  - [LeetCode 315 - Count of Smaller Numbers After Self](https://kennyzhuang.gitbooks.io/algorithms-collection/content/count_of_smaller_numbers_after_self.html)

#### MinMax
- DP
- Clue: play optimally


##### Matrix
- [LeetCode 766 - Toeplitz Matrix](https://leetcode.com/problems/toeplitz-matrix/solution/)
  - Compare With Top-Left Neighbor

#### Greedy

#### Strategy
- [LeetCode 659 - Split Array into Consecutive Subsequences](https://leetcode.com/problems/split-array-into-consecutive-subsequences/solution/)


#### [Binary Indexed Trees](https://www.topcoder.com/community/competitive-programming/tutorials/binary-indexed-trees/)
- [LeetCode 315 - Count of Smaller Numbers After Self](https://leetcode.com/problems/count-of-smaller-numbers-after-self/discuss/76621/java-5-methods-merge-sort-binary-indexed-tree-binary-search-tree), [LeetCode 493 - Reverse Pairs](https://leetcode.com/problems/reverse-pairs/discuss/97268/General-principles-behind-problems-similar-to-%22Reverse-Pairs%22)
  - use the rank as BIT index
- Application: range sum and update
```java
void update(int idx, int val){
    while (idx <= MaxIdx){
        tree[idx] += val;
        idx += (idx & -idx);
    }
}
int queryRangeSum(int idx){
    while (idx > 0){
        sum += tree[idx];
        idx -= (idx & -idx);
    }
}
```
- [2D BIT](https://kennyzhuang.gitbooks.io/leetcode-lock/content/308_range_sum_query_2d_-_mutable.html)
```java
public void update(int row, int col, int val) {
    int diff = val - matrix[row][col];
    matrix[row][col] = val;
    
    for (int i = row + 1; i <= height; i += (i & -i)) {
        for (int j = col + 1; j <= width; j += (j & -j)) {
            tree[i][j] += diff;
        }
    }
}

public int sumRegion(int row1, int col1, int row2, int col2) {
    return sum(row2, col2) - sum(row1 - 1, col2) - sum(row2, col1 - 1) + sum(row1 - 1, col1 - 1);
}

private int sum(int row, int col) {
    int sum = 0;
    for (int i = row + 1; i > 0; i -= (i & -i)) {
        for (int j = col + 1; j > 0; j -= (j & -j)) {
            sum += tree[i][j];
        }
    }
    return sum;
}
```
https://leetcode.com/articles/a-recursive-approach-to-segment-trees-range-sum-queries-lazy-propagation/


#### [Segment Tree](https://www.geeksforgeeks.org/segment-tree-set-1-sum-of-given-range/)
- query(L,R), update(L,R)
- [Range Min/Max & Sum Queries and Range Update Queries in O(log n) time](https://www.geeksforgeeks.org/segment-tree-set-1-range-minimum-query/)
- [LeetCode 315 - Count of Smaller Numbers After Self](https://leetcode.com/problems/count-of-smaller-numbers-after-self/discuss/76674/3-Ways-(Segment-Tree-Binary-Indexed-Tree-Merge-Sort)-clean-Java-code)
- [LeetCode 699 - Falling Squares]()
#### 离散化
- Coordinate Compression
  - [LeetCode 850 - Rectangle Area II](https://leetcode.com/articles/rectangle-area-ii/)

#### Interval
- TreeMap<Integer, Integer>: start pos -> [end pos, open/close enum]
- Sort by start(or end) point
- [LeetCode 218 - The Skyline Problem - find the critical points that change the max](https://leetcode.com/problems/the-skyline-problem/discuss/61193/Short-Java-solution)
- [LeetCode 715 - Range Module](https://leetcode.com/problems/range-module/discuss/108910/Java-TreeMap)
  - TreeMap<Integer, Integer> map: start -> end
- **[Boundary Count]**(https://leetcode.com/articles/my-calendar-iii/)
  - +1 for start/enter, -1 for end/leave
- Active set
  - [LeetCode 850 - Rectangle Area II](https://leetcode.com/problems/rectangle-area-ii/discuss/188832/Java-Line-Sweep-With-Sub-Class-Interval)

#### Sweep line
- 

#### Bit trick
- x & (-x) gives the last set bit in a number

Fenwick Tree or Binary Indexed Tree

https://www.youtube.com/watch?time_continue=3&v=CWDQJGaN1gY


#### Strategy
- [TopCoder BouncingBalls](https://apps.topcoder.com/forums/?module=Thread&threadID=671150&start=0)
  - 碰撞之後的狀態相當於擦肩而過

#### Prune

#### Trick
- count map, 
- sort when order doesn't matter
- prefix, suffix sum

- 入口点: boundary
- Dummy node for union find, or tree, LinkedList, graph
  - [LeetCode 130 - Surrounded Regions](https://leetcode.com/problems/surrounded-regions/discuss/41617/Solve-it-using-Union-Find)
    - we connect all the 'O' nodes on the boundry to a dummy node, and then connect each 'O' node to its neighbour 'O' nodes

- [cache](https://leetcode.com/problems/construct-binary-tree-from-preorder-and-inorder-traversal/discuss/34541/5ms-Java-Clean-Solution-with-Caching)
#### [Use dummy node](https://leetcode.com/articles/increasing-order-search-tree/)
```java

```
- 2 dimension to 1 dimension: (i,j) -> i*n+j
- visited: [], [][], Set<>

### Simulation

#### Sort
- pre-sort
```java
// sort by abs, difference
Collections.sort(arr, (a,b) -> a == b ? a - b : Math.abs(a-x) - Math.abs(b-x));
```
- 

