## BFS
### Application:
- Graph, or problems can be converted to graph
- find shortest path, min value
- bfs on matrix or indexes on 2 strings

### Starting Points
- edges, boundaries
- same level elements
- all nodes

### Implementation Detail
- visited array or set
- queue stores nodes and their status
- current state: {current node, visited nodes}
- bit masks to store visited nodes
- while (!queue.isEmpty())

### Multiple Starting Points
- BFS for each point
- Put all points into queue once

- [BFS](https://discuss.leetcode.com/topic/10812/share-my-short-iterative-java-solution)

### [LeetCode 47 - Permutations II - contains duplicates]
    - <https://zhuhan0.blogspot.com/2017/06/leetcode-47-permutations-ii.html>

### Topological sort(BFS)
- indegree, outdegree, 
- Remove the leaves, update the degrees of inner vertexes

### Enqueue all Points into Queue first
- [LeetCode 317 - Shortest Distance from All Buildings](https://www.geeksforgeeks.org/find-shortest-distance-guard-bank/)
  - build a house on an empty land which reaches all buildings in the shortest amount of distance
- [LeetCode 542 - 01 Matrix](https://leetcode.com/articles/01-matrix/)
  - the initial items in the queue: 0
  - start by adding all the cells with 0s to q.
  - If the new calculated distance for neighbour {i,j} is smaller, we add {i,j} to q and update dist[i][j]

- [LeetCode 286 - Walls and Gates]
  - Fill each empty room with the distance to its nearest gate
```java
public void wallsAndGates(int[][] rooms) {
    LinkedList<int[]> list = new LinkedList<int[]>();
    for(int i = 0; i < rooms.length; i++) {
        for(int j = 0; j < rooms[0].length; j++) {
            if(rooms[i][j] == 0) 
                list.add(new int[]{i,j});
        }
    }
    int[][] diff = new int[][]{{-1,0,1,0},{0,1,0,-1}};
    while(!list.isEmpty()) {
        int[] pop = list.remove();
        for(int i = 0; i < diff[0].length; i++) {
            int newR = pop[0] + diff[0][i];
            int newC = pop[1] + diff[1][i];
            if(newR < 0 || newR >= rooms.length || newC < 0 || newC >= rooms[0].length || 
                rooms[newR][newC] != Integer.MAX_VALUE) 
                continue;
            rooms[newR][newC] = rooms[pop[0]][pop[1]] + 1;
            list.add(new int[]{newR, newC});
        }
    }
}
```
### Tree - Level Order traverse
- [LeetCode 314 - Binary Tree Vertical Order Traversal](https://github.com/mintycc/OnlineJudge-Solutions/blob/master/Leetcode/314_Binary_Tree_Vertical_Order_Traversal.java)
```java
public List<List<Integer>> verticalOrder(TreeNode root) {
    if (root == null) return Collections.emptyList();
    Queue<QueueNode> queue = new LinkedList<>();
    Map<Integer, List<Integer>> map = new HashMap<>();
    queue.add(new QueueNode(root, 0));
    int min = 0, max = 0;
    while (!queue.isEmpty()) {
        TreeNode cur = queue.peek().node;
        int depth = queue.poll().depth;
        if (!map.containsKey(depth)) 
            map.put(depth, new ArrayList<>());
        map.get(depth).add(cur.val);
        min = Math.min(min, depth);
        max = Math.max(max, depth);
        if (cur.left  != null)
            queue.add(new QueueNode(cur.left,  depth - 1));
        if (cur.right != null)
            queue.add(new QueueNode(cur.right, depth + 1));
    }
    List<List<Integer>> ans = new ArrayList<>();
    for (int i = min; i <= max; i ++)
        ans.add(map.get(i));
    return ans;
}
```

### Level Order traverse but without queue
- [LeetCode 116 - Populating Next Right Pointers in Each Node](https://leetcode.com/problems/populating-next-right-pointers-in-each-node/discuss/37603/Java-solution-traversing-by-level-without-extra-space)
  - [level order traverse without queue](https://leetcode.com/problems/populating-next-right-pointers-in-each-node/discuss/37603/Java-solution-traversing-by-level-without-extra-space)
  - [preorder](https://leetcode.com/problems/populating-next-right-pointers-in-each-node/discuss/37473/My-recursive-solution(Java))
```java
public void connect(TreeLinkNode root) {
    if(root==null) return;
    TreeLinkNode cur = root;
    TreeLinkNode nextLeftmost = null;
    while(cur.left!=null){
        nextLeftmost = cur.left; // save the start of next level
        while(cur!=null){
            cur.left.next=cur.right;
            cur.right.next = cur.next==null? null : cur.next.left;
            cur=cur.next;
        }
        cur=nextLeftmost;  // point to next level 
    }
}
```

### Two(multi) ended bfs

### BFS - Unusual
- bfs on matrix or indexes on 2 strings

- [LeetCode 847 - Shortest Path Visiting All Nodes](https://leetcode.com/articles/shortest-path-visiting-all-nodes/)
  - [BFS: visited = new boolean[n][1 << n], queue stores node and all visied nodes](https://github.com/cherryljr/LeetCode/blob/master/Shortest%20Path%20Visiting%20All%20Nodes.java)
  - [BFS: dist = new int[1<<N][N] stores the step](https://leetcode.com/articles/shortest-path-visiting-all-nodes/)
  - [dp](https://leetcode.com/articles/shortest-path-visiting-all-nodes/)
```java
public int shortestPathLength(int[][] graph) {
    int n = graph.length;
    Queue<int[]> queue = new LinkedList<>();
    boolean[][] visited = new boolean[n][1 << n];
    for (int i = 0; i < n; i++) {
        queue.offer(new int[]{i, 1 << i});
        visited[i][1 << i] = true;
    }
    int target = (1 << n) - 1;
    int step = 0;
    while (!queue.isEmpty()) {
        int size = queue.size();
        for (int i = 0; i < size; i++) {
            int[] curr = queue.poll();
            int pos = curr[0], state = curr[1];
            for (int neigh : graph[pos]) {
                int nextState = state | (1 << neigh);
                if (nextState == target) {
                    return step + 1;
                }
                if (visited[neigh][nextState]) {
                    continue;
                }
                visited[neigh][nextState] = true;
                queue.offer(new int[]{neigh, state | (1 << neigh)});
            }
        }
        step++;
    }
    return -1;
}
```
- [LeetCode 97 - Interleaving String: whether s3 is formed by the interleaving of s1 and s2](https://leetcode.com/articles/interleaving-strings/)
  - dp[i][j] = (dp[i - 1][j] && s1.charAt(i - 1) == s3.charAt(i + j - 1)) || (dp[i][j - 1] && s2.charAt(j - 1) == s3.charAt(i + j - 1));
  - [bfs on matrix formed from 2 string](https://leetcode.com/problems/interleaving-string/discuss/31948/8ms-C%2B%2B-solution-using-BFS-with-explanation)
```java
public boolean isInterleave(String s1, String s2, String s3) {
    if (s1.length() + s2.length() != s3.length()) return false;
    boolean[][] visited = new boolean[s1.length() + 1][s2.length() + 1];
    Queue<int[]> queue = new LinkedList<>();
    queue.offer(new int[]{0, 0});
    while (!queue.isEmpty()) {
        int[] p = queue.poll();
        if (visited[p[0]][p[1]]) continue;
        if (p[0] == s1.length() && p[1] == s2.length()) return true;
        
        if (p[0] < s1.length() && s1.charAt(p[0]) == s3.charAt(p[0] + p[1]))
            queue.offer(new int[]{p[0] + 1, p[1]});
        if (p[1] < s2.length() && s2.charAt(p[1]) == s3.charAt(p[0] + p[1]))
            queue.offer(new int[]{p[0], p[1] + 1});
        visited[p[0]][p[1]] = true;
    }
    return false;
}
```
- [LeetCode 287 - Perfect Squares](http://traceformula.blogspot.com/2015/09/perfect-squares-leetcode.html)
  - [Graph: numberA -(+x^2)> nb](https://leetcode.com/problems/perfect-squares/discuss/165688/BFS-and-DP)
  - [dp: dp[n] = Min{ dp[n - i*i] + 1 },  n - i*i >=0 && i >= 1](https://leetcode.com/problems/perfect-squares/discuss/71495/an-easy-understanding-dp-solution-in-java)

#### Put same levels into next level queue
- [LeetCode 364 - Nested List Weight Sum II](http://www.cnblogs.com/grandyang/p/5615583.html)
  - two types: integer or NestedInteger
  - [dfs(List<NestedInteger> nestedList, int intSum)](https://segmentfault.com/a/1190000005937820)
  - [find max depth first](https://blog.csdn.net/jmspan/article/details/51747784)
  - [bfs](http://www.cnblogs.com/grandyang/p/5615583.html)

### PriorityQueue + BFS
- Dijkstra single source shortest path

### BFS + Bit mask
- [LeetCode 864 - Shortest Path to Get All Keys](https://leetcode.com/problems/shortest-path-to-get-all-keys/discuss/147696/Java-23ms-BFS-solution)
  - [Status:{int keyStatus, i,j}; int[][][] dist = new int[1 << 6][rows][cols]](https://leetcode.com/problems/shortest-path-to-get-all-keys/discuss/146878/Java-BFS-Solution)
  - if (key == success) return path;

### BFS + Digit
- [LeetCode 967 - Numbers With Same Consecutive Differences]
  - [BFS](https://leetcode.com/problems/numbers-with-same-consecutive-differences/discuss/211183/JavaC%2B%2BPython-Iterative-Solution)

### Not suitable for BFS
- BFS can't dedup

- [LeetCode 688 - Knight Probability in Chessboard](https://leetcode.com/problems/knight-probability-in-chessboard/discuss/108214/My-easy-understand-dp-solution)
  - Return the probability that the knight remains on the board after it has stopped moving
  - [bfs: slow and mLE](https://github.com/cherryljr/LeetCode/blob/master/Knight%20Probability%20in%20Chessboard.java)
  - [bfs: use map to compress - same as dp](https://leetcode.com/problems/knight-probability-in-chessboard/discuss/245509/Easy-python-BFS-beat-85)
  - dfs+cache or dp

### Jumping Window + Fixed Size
- [LeetCode 683 - K Empty Slots](https://www.cnblogs.com/lightwindy/p/9727403.html)
    - [sliding window: find a match when i reaches end of current window](https://www.cnblogs.com/lightwindy/p/9727403.html)
    - [O(kn) brute force]
    - [TreeSet: lower/higher](https://blog.csdn.net/katrina95/article/details/79070941)
    - [Bucket](https://zxi.mytechroad.com/blog/simulation/leetcode-683-k-empty-slots/)
```java
public int kEmptySlots(int[] flowers, int k) {
    int[] days = new int[flowers.length];
    for (int i = 0; i < flowers.length; i++) days[flowers[i] - 1] = i + 1;
    int left = 0, right = k + 1, result = Integer.MAX_VALUE;
    for (int i = 0; right < days.length; i++) {
        if (days[i] < days[left] || days[i] <= days[right]) {
            if (i == right)
                result = Math.min(result, Math.max(days[left], days[right]));
            left = i;
            right = k + 1 + i;
        }
    }
    return (result == Integer.MAX_VALUE) ? -1 : result;
}
```

