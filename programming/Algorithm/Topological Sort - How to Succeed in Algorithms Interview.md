#### [How to Succeed in Algorithms Interview Series](https://lifelongprogrammer.blogspot.com/search/label/Algorithm Series){target="blank"}
<script src="https://lifelongprogrammer.blogspot.com/feeds/posts/default/-/Algorithm Series?orderby=updated&amp;alt=json-in-script&amp;callback=series&amp;max-results=20"></script>

---

#### Topological Sort
- Map<Integer, Integer> indegree
- put indegree=0 into queue
- works only in DAG(Acyclic, no cycle)
- BFS <!-- - [dfs] -->
- Add the node whose in-degree is 0 into queue
- Answer: length of Topological sort may be the result - longest path
- [Add the node whose out-degree is 0 into queue](https://leetcode.com/problems/find-eventual-safe-states/discuss/120633/Java-Solution-(DFS-andand-Topological-Sort))

#### When to use
- order, sort
- boundary: input degree: 0

#### Examples
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

##### [LeetCode 444 - Sequence Reconstruction](https://www.jiuzhang.com/solutions/sequence-reconstruction/)
```text
Check whether the original sequence org can be uniquely reconstructed from the sequences in seqs. The org sequence is a permutation of the integers from 1 to n, with 1 ≤ n ≤ 104. Reconstruction means building a shortest common supersequence of the sequences in seqs (i.e., a shortest sequence so that all sequences in seqs are subsequences of it). Determine whether there is only one sequence that can be reconstructed from seqs and it is the org sequence.
Example 1:
Input:
org: [1,2,3], seqs: [[1,2],[1,3]]

Output:
false

Explanation:
[1,2,3] is not the only one sequence that can be reconstructed, because [1,3,2] is also a valid sequence that can be reconstructed.
```
```java
public boolean sequenceReconstruction(int[] org, int[][] seqs) {
    Map<Integer, Set<Integer>> map = new HashMap<Integer, Set<Integer>>();
    Map<Integer, Integer> indegree = new HashMap<Integer, Integer>();
    for (int num : org) {
        map.put(num, new HashSet<Integer>());
        indegree.put(num, 0);
    }
    int n = org.length;
    int count = 0;
    for (int[] seq : seqs) {
        count += seq.length;
        if (seq.length >= 1 && (seq[0] <= 0 || seq[0] > n))
            return false;
        for (int i = 1; i < seq.length; i++) {
            if (seq[i] <= 0 || seq[i] > n)
                return false;
            if (map.get(seq[i - 1]).add(seq[i]))
                indegree.put(seq[i], indegree.get(seq[i]) + 1);
        }
    }
    // case: [1], []
    if (count < n)
        return false;
    Queue<Integer> q = new ArrayDeque<Integer>();
    for (int key : indegree.keySet())
        if (indegree.get(key) == 0)
            q.add(key);
    int cnt = 0;
    while (q.size() == 1) {
        for (int next : map.get(q.poll())) {
            indegree.put(next, indegree.get(next) - 1);
            if (indegree.get(next) == 0) q.add(next);
        }
        cnt++;
    }
    return cnt == org.length;
}
```
