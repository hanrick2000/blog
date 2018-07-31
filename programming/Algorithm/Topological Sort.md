#### Topological Sort
- put indegree=0 into queue
- works only in DAG(Acyclic, no cycle)
- BFS
- [dfs]
- Add the node whose in-degree is 0 into queue
- Answer: length of Topological sort may be the result - longest path
- [Add the node whose out-degree is 0 into queue](https://leetcode.com/problems/find-eventual-safe-states/discuss/120633/Java-Solution-(DFS-andand-Topological-Sort))

### When to use
- order, sort
- boundary: input degree: 0

- [LeetCode 329 - Longest Increasing Path in a Matrix](https://leetcode.com/problems/longest-increasing-path-in-a-matrix/discuss/144558/Java-BFS-Topological-Sort)
  - [dfs + cache: O(mn)](https://www.programcreek.com/2014/05/leetcode-longest-increasing-path-in-a-matrix-java/)
  - [Topological Sort: BFS](https://leetcode.com/problems/longest-increasing-path-in-a-matrix/discuss/144558/Java-BFS-Topological-Sort)
    - matrix to graph, only need indegrees[][]; no need to create graph map
```Java
public int longestIncreasingPath(int[][] matrix) {
    int m = matrix.length; n = matrix[0].length;
    int[][] indegree = new int[m][n];
    Queue<int[]> q = new LinkedList();
    for (int row = 0; row < m; row++) {
        for (int col = 0; col < n; col++) {
            for(int i = 0; i < 4; i++) {
                int nextRow = row + dirs[i][0];
                int nextCol = col + dirs[i][1];
                if (nextRow >= 0 && nextRow < m && nextCol >= 0 && nextCol < n && 
                    matrix[row][col] > matrix[nextRow][nextCol]) {
                    indegree[row][col]++;
                }
            }
            if (indegree[row][col] == 0) q.offer(new int[]{row, col});
        }
    }
    int len = 0;
    while (!q.isEmpty()) {
        int size = q.size();
        while (size-- > 0) { // consume all nodes in cur layer and add next layer into queue
            int[] coord = q.poll();
            int row = coord[0], col = coord[1];
            for(int i = 0; i < 4; i++) {
                int nextRow = row + dirs[i][0];
                int nextCol = col + dirs[i][1];
                if (nextRow >= 0 && nextRow < m && nextCol >= 0 && nextCol < n && 
                    matrix[row][col] < matrix[nextRow][nextCol]) {
                    if (--indegree[nextRow][nextCol] == 0)     // remove edge
                        q.offer(new int[]{nextRow, nextCol});  // add as next level node
                }
            }
        }
        len++; // at the end of each layer, increase the length
    }
    return len;
}
```


##### Examples
- [LeetCode 207- Course Schedule](https://leetcode.com/problems/course-schedule/)
- [LeetCode 210 - Course Schedule II](https://www.programcreek.com/2014/06/leetcode-course-schedule-ii-java/)

- [LeetCode 269 -  Alien Dictionary](https://zhuhan0.blogspot.com/2017/06/leetcode-269-alien-dictionary.html)
- [Find Itinerary from a given list of tickets]()
- [Detect Cycle in a Directed Graph](https://tekjutsu.wordpress.com/2010/02/03/3/)
- [LeetCode 802 - Find Eventual Safe States](https://leetcode.com/problems/find-eventual-safe-states/discuss/120633/Java-Solution-(DFS-andand-Topological-Sort))
  - [Topological sort](https://leetcode.com/problems/find-eventual-safe-states/discuss/120633/Java-Solution-(DFS-andand-Topological-Sort))
  - dfs: color[i] = 0 means node i is not visited; color[i] = 1 means node i is visiting; color[i] = 2 means node i has been already visited
    - when color[i] = 1 and it is visited again; then detect cycle
  - [reverse graph](https://leetcode.com/articles/find-eventual-safe-states/)
- [Preference list - Airbnb](https://github.com/allaboutjst/airbnb/blob/master/src/main/java/preference_list/PreferenceList.java)