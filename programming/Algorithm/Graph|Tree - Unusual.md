
- create graph when 2 elements meets some criteria

### Binary tree to graph
- Annotate Parent
- **Create parent map: Map<TreeNode, TreeNode> map**
- create Map<TreeNode, List<TreeNode>> map
- [LeetCode 863 - All Nodes Distance K in Binary Tree](https://leetcode.com/problems/all-nodes-distance-k-in-binary-tree/discuss/143752/JAVA-Graph-%2B-BFS)
  - [convert to graph then BFS]((https://leetcode.com/problems/all-nodes-distance-k-in-binary-tree/discuss/143752/JAVA-Graph-%2B-BFS))
  - [2. multiple steps](https://leetcode.com/problems/all-nodes-distance-k-in-binary-tree/discuss/143798/1ms-beat-100-simple-Java-dfs-using-hashmap-with-explanation)
  - [DFS](https://www.geeksforgeeks.org/print-nodes-distance-k-given-node-binary-tree/)

- [LeetCode 815 - Bus Routes](https://leetcode.com/problems/bus-routes/discuss/122771/C++JavaPython-BFS-Solution)
  - create graph: from stop to route id then bfs

- [LeetCode 996 - Number of Squareful Arrays](https://leetcode.com/articles/number-of-squareful-arrays/)
```java
int N;
Map<Integer, List<Integer>> graph;
Integer[][] memo;

public int numSquarefulPerms(int[] A) {
  N = A.length;
  graph = new HashMap();
  memo = new Integer[N][1 << N];

  for (int i = 0; i < N; ++i)
    graph.put(i, new ArrayList());

  for (int i = 0; i < N; ++i)
    for (int j = i + 1; j < N; ++j) {
      int r = (int) (Math.sqrt(A[i] + A[j]) + 0.5);
      if (r * r == A[i] + A[j]) {
        graph.get(i).add(j);
        graph.get(j).add(i);
      }
    }

  int[] factorial = new int[20];
  factorial[0] = 1;
  for (int i = 1; i < 20; ++i)
    factorial[i] = i * factorial[i - 1];

  int ans = 0;
  for (int i = 0; i < N; ++i)
    ans += dfs(i, 1 << i);

  Map<Integer, Integer> count = new HashMap();
  for (int x : A)
    count.put(x, count.getOrDefault(x, 0) + 1);
  for (int v : count.values())
    ans /= factorial[v];

  return ans;
}

public int dfs(int node, int visited) {
  if (visited == (1 << N) - 1)
    return 1;
  if (memo[node][visited] != null)
    return memo[node][visited];

  int ans = 0;
  for (int nei : graph.get(node))
    if (((visited >> nei) & 1) == 0)
      ans += dfs(nei, visited | (1 << nei));
  memo[node][visited] = ans;
  return ans;

}
```




