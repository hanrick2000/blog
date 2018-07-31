### PriorityQueue + BFS
- Dijkstra single source shortest path
- time complexity: O(ElogV)

### Dijkstra
- The completed vertices: visited vertices that have already been removed from the queue.
- The frontier: visited vertices on the queue
- The unvisited vertices: everything else
- If new distance is cheaper in cost, add it again to the queue(don't remove the old one)

- [LeetCode 778 - Swim in Rising Water](https://leetcode.com/problems/swim-in-rising-water/discuss/113770/Easy-and-Concise-Solution-using-PriorityQueue-PythonC%2B%2B)
  - find a path whose max is minimum
  - [PQ+BFS: O(N^2logN)](https://leetcode.com/problems/swim-in-rising-water/discuss/115696/Simple-Java-solution-using-priority-queue)
  - [Bisection + use bfs/dfs to validate](https://leetcode.com/problems/swim-in-rising-water/discuss/113758/c-two-solutions-binary-searchdfs-and-dijkstrabfs-on2logn-11ms)
  - [Bisection + use union find to validate](https://leetcode.com/problems/swim-in-rising-water/discuss/118204/Java-DFS-and-Union-Find)

- [LeetCode 407 - Trapping Rain Water II](https://leetcode.com/problems/trapping-rain-water-ii/discuss/89461/java-solution-using-priorityqueue)
  - from the borders, pick the shortest cell visited and check its neighbors:
  - if the neighbor is shorter, collect the water it can trap and update its height as its height plus the water trapped add all its neighbors to the queue.

- [LeetCode 364 - Nested List Weight Sum II](https://segmentfault.com/a/1190000005937820)
  - [take current unweighted to next level weighted += unweighted](https://segmentfault.com/a/1190000005937820)

- [LeetCode 743 - Network Delay Time](https://leetcode.com/articles/network-delay-time/)
  - [Dijkstra: BFS+PQ](https://leetcode.com/articles/network-delay-time/)
  - [DP - Bellman Ford](https://leetcode.com/problems/network-delay-time/discuss/109982/C++-Bellman-Ford)
- [LeetCode 787 - Cheapest Flights Within K Stops](https://leetcode.com/problems/cheapest-flights-within-k-stops/discuss/115541/Easy-and-Concise-Solution-Using-Priority-Queue-JavaPython)
  - [Dijkstra: BFS+PQ](https://leetcode.com/problems/cheapest-flights-within-k-stops/discuss/115541/Easy-and-Concise-Solution-Using-Priority-Queue-JavaPython)
  - [DP-O(KN)](https://leetcode.com/problems/cheapest-flights-within-k-stops/discuss/207128/Two-Java-Solutions-one-is-DP-and-the-other-is-Dijkstra)
```java
public int findCheapestPrice(int n, int[][] flights, int src, int dst, int k) {
  Map<Integer, Map<Integer, Integer>> prices = new HashMap<>();
  for (int[] f : flights) {
    if (!prices.containsKey(f[0]))
      prices.put(f[0], new HashMap<>());
    prices.get(f[0]).put(f[1], f[2]);
  }
  Queue<int[]> pq = new PriorityQueue<>((a, b) -> (Integer.compare(a[0], b[0])));
  pq.add(new int[] { 0, src, k + 1 });
  while (!pq.isEmpty()) {
    int[] top = pq.remove();
    int price = top[0];
    int city = top[1];
    int stops = top[2];
    if (city == dst)
      return price;
    if (stops > 0) {
      Map<Integer, Integer> adj = prices.getOrDefault(city, new HashMap<>());
      for (int a : adj.keySet()) {
        pq.add(new int[] { price + adj.get(a), a, stops - 1 });
      }
    }
  }
  return -1;
}
```

### [Bellman Ford](https://www.geeksforgeeks.org/bellman-ford-algorithm-dp-23/)
- F(V, L) = min [over all neighbors N of V] (F(N, L-1) + edge_cost(N, V))
- [can handle and detect negative weight edges](https://raw.githubusercontent.com/williamfiset/Algorithms/master/com/williamfiset/algorithms/graphtheory/BellmanFordEdgeList.java)
- time complexity: O(VE)
```java
int V, E; 
Edge edge[];
void BellmanFord(Graph graph,int src) 
{ 
    int V = graph.V, E = graph.E; 
    int dist[] = new int[V]; 
    for (int i=0; i<V; ++i) 
        dist[i] = Integer.MAX_VALUE; 
    dist[src] = 0; 
    for (int i=1; i<V; ++i) 
    { 
        for (int j=0; j<E; ++j) 
        { 
            int u = graph.edge[j].src; 
            int v = graph.edge[j].dest; 
            int weight = graph.edge[j].weight; 
            if (dist[u]!=Integer.MAX_VALUE && 
                dist[u]+weight<dist[v]) 
                dist[v]=dist[u]+weight; 
        } 
    } 
    for (int j=0; j<E; ++j) 
    { 
        int u = graph.edge[j].src; 
        int v = graph.edge[j].dest; 
        int weight = graph.edge[j].weight; 
        if (dist[u] != Integer.MAX_VALUE && 
            dist[u]+weight < dist[v]) 
          System.out.println("Graph contains negative weight cycle"); 
    } 
    printArr(dist, V); 
} 
```

