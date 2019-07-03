### [Series: How to Succeed in Algorithms Interview](https://lifelongprogrammer.blogspot.com/search/label/Algorithm Series){target="blank"}
<script src="https://lifelongprogrammer.blogspot.com/feeds/posts/default/-/Algorithm Series?orderby=updated&amp;alt=json-in-script&amp;callback=series&amp;max-results=20"></script>

---

#### Graph represent
- AdjacencyMatrix
- AdjacencyList: List<Edge>[]
- EdgeList: Edge[] edges
- Map<Integer, Set<Integer>> map
  - [Map<String, PriorityQueue<String>>](https://www.cnblogs.com/EdwardLiu/p/5184961.html)
- Map<String Integer> indegrees
- Topological Sort O(V+E)
- create graph when 2 elements meets some criteria

#### Approaches
- [BFS](https://lifelongprogrammer.blogspot.com/2017/12/bfs-how-to-succeed-in-algorithms-interview.html)
- [DFS](https://lifelongprogrammer.blogspot.com/2017/12/dfs-how-to-succeed-in-algorithms-interview.html)
- [Union Find](https://lifelongprogrammer.blogspot.com/2018/01/union-find-disjoint-set-how-to-succeed-in-algorithms-interview.html)
- [Topological Sort](https://lifelongprogrammer.blogspot.com/2018/01/topological-sort-how-to-succeed-in-algorithms-interview.html)

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

#### Detect Cycle in Undirected Graph
- [dfs: O(V+E)](https://algorithms.tutorialhorizon.com/graph-detect-cycle-in-undirected-graph-using-dfs/)
  - [During DFS, for any current vertex 'x' if there an adjacent vertex 'y' is present which is already visited and 'y' is not a direct parent of 'x' then there is a cycle in graph.](https://algorithms.tutorialhorizon.com/graph-detect-cycle-in-undirected-graph-using-dfs/)
  -  boolean isCycleUtil(int currVertex, boolean [] visited, int parent)
- [union find: O(ELogV)](https://algorithms.tutorialhorizon.com/graph-find-cycle-in-undirected-graph-using-disjoint-set-union-find/)

#### Detect Cycle in a Directed Graph
- [dfs](https://algorithms.tutorialhorizon.com/graph-detect-cycle-in-a-directed-graph/)
  - Recursion stack[] is used from keep track of visiting vertices during DFS from particular vertex and gets reset once cycle is not found from that vertex and will try DFS from other vertices.
  - isCycleUtil(int vertex, boolean[] visited, boolean[] recursiveArr)
- [dfs + using colors](https://www.geeksforgeeks.org/detect-cycle-direct-graph-using-colors/)
- [Topological sort](https://algorithms.tutorialhorizon.com/graph-detect-cycle-in-a-directed-graph/)

#### [Check if a directed graph is strongly connected](https://www.geeksforgeeks.org/connectivity-in-a-directed-graph/)
1. Do a DFS traversal of graph starting from any arbitrary vertex v. If DFS traversal doesn’t visit all vertices, then return false.
2. Reverse all arcs (or find transpose or reverse of graph) and Do a DFS traversal of reversed graph starting from same vertex ,  If DFS traversal doesn’t visit all vertices, then return false.
- The idea is, if every node can be reached from a vertex v, and every node can reach v, then the graph is strongly connected. In step 1, we check if all vertices are reachable from v. In step 2, we check if all vertices can reach v (In reversed graph, if all vertices are reachable from v, then all vertices can reach v in original graph)

#### Eulerian path
- [Eulerian Path is a path in graph that visits every edge exactly once. Eulerian Circuit is an Eulerian Path which starts and ends on the same vertex](https://www.geeksforgeeks.org/eulerian-path-and-circuit/)


##### Eulerian Cycle
- For an undirected graph has Eulerian cycle
  1. All vertices with non-zero degree are connected.
  2. **All vertices have even degree.**

#### Eulerian Path
- For an undirected graph has Eulerian Path
  1. Same as condition (a) for Eulerian Cycle
  2. If two vertices have odd degree and all other vertices have even degree. Note that only one vertex with odd degree is not possible in an undirected graph (sum of all degrees is always even in an undirected graph)

#### Eulerian Cycle for a directed graph
- A directed graph has an eulerian cycle if following conditions are true
  1. All vertices with nonzero degree belong to a single strongly connected component.
  2. In degree and out degree of every vertex is same.

#### Hamiltonian Cycle

### Connected Components
- A Strongly connected component is a sub-graph where there is a path from every node to every other node.
- A weakly connected component is one in which all components are connected by some path, ignoring direction
- [LeetCode 323 - Number of Connected Components in an Undirected Graph](http://www.cnblogs.com/EdwardLiu/p/5088502.html)
  - bfs, dfs, union find
- [LintCode 432 - Find the Weak Connected Component in the Directed Graph](http://www.cnblogs.com/Dylan-Java-NYC/p/6364620.html)
  - [union find](http://www.cnblogs.com/Dylan-Java-NYC/p/6364620.html)

#### Matrix to Graph

#### Tree to Graph
- [LeetCode 863 - All Nodes Distance K in Binary Tree](https://leetcode.com/problems/all-nodes-distance-k-in-binary-tree/discuss/143752/JAVA-Graph-%2B-BFS)
  - Create graph: Map<TreeNode, List<TreeNode>> map = new HashMap<>();
  - Clone and add Parent Node

#### Color during DFS
- a state = {Initial=0, InProgress=1, Completed=2 }
- [LeetCode 785 - Is Graph Bipartite?](https://leetcode.com/problems/is-graph-bipartite/discuss/115487/Java-Clean-DFS-solution-with-Explanation)
  - -1: Haven't been colored, 0: Blue, 1: Red.

- [LeetCode 886 - Possible Bipartition](https://leetcode.com/problems/possible-bipartition/discuss/158957/Java-DFS-solution)
  - [bfs](https://leetcode.com/problems/possible-bipartition/discuss/159085/java-graph), [dfs](https://leetcode.com/problems/possible-bipartition/discuss/158957/Java-DFS-solution),

#### Create Reverse Graph

#### Degree(in-degree, out-degree)
- [LeetCode 997 - Find the Town Judge](https://leetcode.com/problems/find-the-town-judge/discuss/242938/JavaC%2B%2BPython-Directed-Graph)
```java
public int findJudge(int N, int[][] trust) {
    int[] count = new int[N+1];
    for (int[] t: trust) {
        count[t[0]]--;
        count[t[1]]++;
    }
    for (int i = 1; i <= N; ++i) {
        if (count[i] == N - 1) return i;
    }
    return -1;
}
```
### [Floyd Warshall Algorithm - All Pairs Shortest Path: O(V^3)](https://www.geeksforgeeks.org/floyd-warshall-algorithm-dp-16/)
- one by one pick all vertices and updates all shortest paths which include the picked vertex as an intermediate vertex in the shortest path.
- when we pick vertex number k as an intermediate vertex, we already have considered vertices {0, 1, 2, .. k-1} as intermediate vertices.
```java
void floydWarshall(int graph[][])
{
    int dist[][] = new int[V][V];
    int i, j, k;
    for (i = 0; i < V; i++)
        for (j = 0; j < V; j++)
            dist[i][j] = graph[i][j];
    // Add all vertices one by one to the set of intermediate vertices.
    for (k = 0; k < V; k++)
    {
        // Pick all vertices as source one by one
        for (i = 0; i < V; i++)
        {
            // Pick all vertices as destination for the
            // above picked source
            for (j = 0; j < V; j++)
            {
                // If vertex k is on the shortest path from i to j, then update the value of dist[i][j]
                if (dist[i][k] + dist[k][j] < dist[i][j])
                    dist[i][j] = dist[i][k] + dist[k][j];
            }
        }
    }
}
```

- [LeetCode 399 - Evaluate Division](https://zxi.mytechroad.com/blog/graph/leetcode-399-evaluate-division/)
  - create edge for a to b and b to a
  - [dfs+cache: O(e+q*e)](https://leetcode.com/problems/evaluate-division/discuss/88228/java-ac-solution-with-explanation)
  - [bfs](http://edlinlink.github.io/Leetcode_Evaluate_Division.html)
  - [Floyd–Warshall](https://leetcode.com/problems/evaluate-division/discuss/88207/java-solution-using-floydu2013warshall-algorithm)
  - [best: union-find - store ration in parent node: O(e+q)](https://zxi.mytechroad.com/blog/graph/leetcode-399-evaluate-division/)
```java
public double[] calcEquation(String[][] equations, double[] values, String[][] queries) {
    HashMap<String, HashMap<String, Double>> graph = new HashMap<>();
    Function<String, HashMap<String, Double>> function = s -> new HashMap<>();
    for (int i = 0; i < equations.length; i++) {
        graph.computeIfAbsent(equations[i][0], function).put(equations[i][0], 1.0);
        graph.computeIfAbsent(equations[i][1], function).put(equations[i][1], 1.0);
        graph.get(equations[i][0]).put(equations[i][1], values[i]);
        graph.get(equations[i][1]).put(equations[i][0], 1 / values[i]);
    }
    for (String mid : graph.keySet()) {
        for (String src : graph.get(mid).keySet()) {
            for (String dst : graph.get(mid).keySet()) {
                double val = graph.get(src).get(mid) * graph.get(mid).get(dst);
                graph.get(src).put(dst, val);
            }
        }
    }
    double[] result = new double[queries.length];
    for (int i = 0; i < result.length; i++) {
        if (!graph.containsKey(queries[i][0])) {
            result[i] = -1;
        } else {
            result[i] = graph.get(queries[i][0]).getOrDefault(queries[i][1], -1.0);
        }
    }
    return result;
}
```

#### Examples
- [Given an array of strings, find if the strings can be chained to form a circle](https://www.geeksforgeeks.org/given-array-strings-find-strings-can-chained-form-circle/)
  - isStronglyConnect
- [Leetcode 200 - Find the number of islands](http://likesky3.iteye.com/blog/2240170)
  - [BFS](http://blog.hyoung.me/cn/2017/03/breadth-first-search/) or DFS or [union Find](http://likesky3.iteye.com/blog/2240170)

