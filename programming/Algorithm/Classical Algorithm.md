#### Floyd

#### Single source shortest path
- find the shortest path from a single source vertex to all other vertices in the given graph
##### [Dijkstra single source shortest path](https://algorithms.tutorialhorizon.com/dijkstras-shortest-path-algorithm-spt-adjacency-list-and-priority-queue-java-implementation/): O(ElogV)
- Only works with positive edge
- [proof of correctness]: induction and contraction
```java
PriorityQueue<Vertex> vertexQueue = new PriorityQueue<Vertex>();
vertexQueue.add(source); 
while (!vertexQueue.isEmpty()) {
  Vertex u = vertexQueue.poll();
  // Visit each edge exiting u
  for (Edge e : u.adjacencies)
  {
     Vertex v = e.target;
     double weight = e.weight;
     double distanceThroughU = u.minDistance + weight;
   if (distanceThroughU < v.minDistance) {
       vertexQueue.remove(v);
       v.minDistance = distanceThroughU ;
       v.previous = u;
       vertexQueue.add(v);
   }
  }
}
```

##### Bellman–Ford algorithm: O(VE)
- works with negative edge
- works in distributed systems
```java
for i from 1 to |V| - 1:
    for (u, v) in E:
        relax(u, v)
for (u, v) in E:
    if v.distance > u.distance + weight(u, v):
        print "A negative weight cycle exists"
```


#### [TSP(Travelling Salesman Problem)](https://github.com/cormacpayne/Data-Structures-and-Algorithms/blob/master/dynamic-programming/bitmask-dynamic-programming/bitmask-dynamic-programming.md)
- n! to 
- Bitmask DP
```java
public double solve( int bitmask, int pos )
{
    // If we have solved this subproblem previously, return the result that was recorded
    if ( dp[ bitmask ][ pos ] != -1 )
        return dp[ bitmask ][ pos ];
        
    // If the bitmask is all 1s, we need to return home    
    if ( bitmask == ( 1 << N ) - 1 )
        return dist[ pos ][ 0 ];
       
    // Keep track of the minimum distance we have seen when visiting other cities
    double minDistance = 2000000000.0;
    
    // For each city we haven't visited, we are going to try the subproblem that arises from visiting it
    for ( int k = 0; k < N; k++ )
    {
        int res = bitmask & ( 1 << k );
        
        // If we haven't visited the city before, try and visit it
        if ( res == 0 )
        {
            int newBitmask = bitmask | ( 1 << k );
            
            // Get the distance from solving the subproblems
            double newDist = dist[ pos ][ k ] + solve( newBitmask, k );
            
            // If newDist is smaller than the current minimum distance, we will override it here
            minDistance = Math.min( minDistance, newDist );
        }
    }
    
    // Set the optimal value of the current subproblem
    return dp[ bitmask ][ pos ] = minDistance;
}
```

- Longest Common SubArray

- [LeetCode 53 - Maximum Subarray](https://leetcode.com/problems/maximum-subarray/discuss/20211/accepted-on-solution-in-java)
  - maxSoFar, maxEndingHere; localMax, globalMax

- [LeetCode 300 - Longest Increasing Subsequence](https://leetcode.com/articles/longest-increasing-subsequence/)
- DP: O(n^2)
- 
```java
public int lengthOfLIS(int[] nums) {
    int[] dp = new int[nums.length];
    int len = 0;
    for (int num : nums) {
        int i = Arrays.binarySearch(dp, 0, len, num);
        if (i < 0) {
            i = -(i + 1);
        }
        dp[i] = num;
        if (i == len) {
            len++;
        }
    }
    return len;
}
```

