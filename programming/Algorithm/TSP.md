### DP - Bit masking
- use bit masks to track state: allMask
- cases: include ith or not
- mask and index may be different thing

### WHen to use
- assign problems, best route including all nodes

### Implementation Detail
- DFS + cache
- unset bit: todo == 0
- set bits: mask == allMask

#### Examples
- [Count ways to assign unique cap to every person](https://www.geeksforgeeks.org/bitmasking-and-dynamic-programming-set-1-count-ways-to-assign-unique-cap-to-every-person/)
  - dp[i][j] tells the number ways we assign j caps to mask i such that none of them wears the same cap
```java
static long countWaysUtil(int mask, int i) 
{ 
    // If all persons are wearing a cap so we 
    // are done and this is one way so return 1 
    if (mask == allmask) return 1; 
    // If not everyone is wearing a cap and also there are no more 
    // caps left to process, so there is no way, thus return 0; 
    if (i > 100) return 0; 
    // If we already have solved this subproblem, return the answer. 
    if (dp[mask][i] != -1) return dp[mask][i]; 
    // Ways, when we don't include this cap in our arrangement 
    // or solution set. 
    long ways = countWaysUtil(mask, i+1); 
    // size is the total number of persons having cap with id i. 
    int size = capList[i].size(); 
    // So, assign one by one ith cap to all the possible persons 
    // and recur for remaining caps. 
    for (int j = 0; j < size; j++) 
    { 
        // if person capList[i][j] is already wearing a cap so continue as 
        // we cannot assign him this cap 
        if ((mask & (1 << capList[i].get(j))) != 0) continue; 
        // Else assign him this cap and recur for remaining caps with 
        // new updated mask vector 
        else ways += countWaysUtil(mask | (1 << capList[i].get(j)), i+1); 
        ways %= MOD; 
    } 
    // Save the result and return it. 
    return dp[mask][i] = (int) ways; 
}
```

### TSP
- [find the shortest possible route that visits every city exactly once and returns to the starting point](https://github.com/williamfiset/Algorithms/blob/master/com/williamfiset/algorithms/graphtheory/TspDynamicProgrammingRecursive.java)
  - [dfs+cache](https://github.com/cormacpayne/Data-Structures-and-Algorithms/blob/master/dynamic-programming/bitmask-dynamic-programming/bitmask-dynamic-programming.md)
  - DP - Bit Masking
  - states: bit masking, current index
```java
public double solve( int bitmask, int pos )
{
    if ( dp[ bitmask ][ pos ] != -1 )
        return dp[ bitmask ][ pos ];
    if ( bitmask == ( 1 << N ) - 1 )
        return dist[ pos ][ 0 ];
    double minDistance = DOuble.MAX_VALUE:
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
    return dp[ bitmask ][ pos ] = minDistance;
}
```

- [LeetCode 943 - Find the Shortest Superstring](https://leetcode.com/articles/find-the-shortest-superstring/)
  - starting point: length after merge 2 words
```java
public String shortestSuperstring(String[] A) {
    int n = A.length;
    int[][] graph = new int[n][n];
    // build the graph
    int[][] dp = new int[1 << n][n];
    int[][] path = new int[1 << n][n];
    int last = -1, min = Integer.MAX_VALUE;

    // start TSP DP
    for (int i = 1; i < (1 << n); i++) {
        Arrays.fill(dp[i], Integer.MAX_VALUE);
        for (int j = 0; j < n; j++) {
            if ((i & (1 << j)) > 0) {
                int prev = i - (1 << j);
                if (prev == 0) {
                    dp[i][j] = A[j].length();
                } else {
                    for (int k = 0; k < n; k++) {
                        if (dp[prev][k] < Integer.MAX_VALUE && dp[prev][k] + graph[k][j] < dp[i][j]) {
                            dp[i][j] = dp[prev][k] + graph[k][j];
                            path[i][j] = k;
                        }
                    }
                }
            }
            if (i == (1 << n) - 1 && dp[i][j] < min) {
                min = dp[i][j];
                last = j;
            }
        }
    }

    // build the path
    StringBuilder sb = new StringBuilder();
    int cur = (1 << n) - 1;
    Stack<Integer> stack = new Stack<>();
    while (cur > 0) {
        stack.push(last);
        int temp = cur;
        cur -= (1 << last);
        last = path[temp][last];
    }

    // build the result
    int i = stack.pop();
    sb.append(A[i]);
    while (!stack.isEmpty()) {
        int j = stack.pop();
        sb.append(A[j].substring(A[j].length() - graph[i][j]));
        i = j;
    }
    return sb.toString();
}
private int calc(String a, String b) {
    for (int i = 1; i < a.length(); i++) {
        if (b.startsWith(a.substring(i))) {
            return b.length() - a.length() + i;
        }
    }
    return b.length();
}
```

- [LeetCode 996 - Number of Squareful Arrays](https://leetcode.com/articles/number-of-squareful-arrays/)
  - create edge when ai+aj is a square
  - [dp[s][i] := # of ways to reach state s (binary mask of nodes visited) that ends with node i](https://leetcode.com/problems/number-of-squareful-arrays/discuss/238871/Java-DP-7ms)
    - dp[s | (1 << j)][j] += dp[s][i] if g[i][j]
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
// https://leetcode.com/problems/number-of-squareful-arrays/discuss/238871/Java-DP-7ms
public int numSquarefulPerms(int[] a) {
  int n = a.length;
  Arrays.sort(a);
  boolean[][] s = new boolean[n][n];
  for (int i = 0; i < n; i++) {
    for (int j = 0; j < n; j++) {
      int sum = a[i] + a[j];
      int sqrt = (int) (Math.sqrt(sum) + 0.1);
      s[i][j] = sqrt * sqrt == sum;
    }
  }
  int ans = 0;
  int[][] dp = new int[1 << n][n];
  for (int i = 0; i < n;) {
    dp[1 << i][i] = 1;
    while (i + 1 < n && a[i + 1] == a[i])
      i++;
    i++;
  }
  for (int i = 0; i < (1 << n); i++) {
    for (int j = 0; j < n; j++) {
      if (dp[i][j] > 0) {
        for (int k = 0; k < n; k++) {
          if ((i & (1 << k)) == 0 && s[j][k]) {
            if (k == 0 || a[k] != a[k - 1] || (i & (1 << (k - 1))) > 0) {
              dp[i | (1 << k)][k] += dp[i][j];
            }
          }
        }
      }
    }
  }
  for (int i = 0; i < n; i++)
    ans += dp[(1 << n) - 1][i];
  return ans;
}
```

- [LeetCode 980 - Unique Paths III](https://leetcode.com/articles/unique-paths-iii/)
```java
int ans;
int[][] grid;
int R, C;
int tr, tc, target;
int[] dr = new int[] { 0, -1, 0, 1 };
int[] dc = new int[] { 1, 0, -1, 0 };
Integer[][][] memo;
public int uniquePathsIII(int[][] grid) {
  this.grid = grid;
  R = grid.length;
  C = grid[0].length;
  target = 0;
  int sr = 0, sc = 0;
  for (int r = 0; r < R; ++r)
    for (int c = 0; c < C; ++c) {
      if (grid[r][c] % 2 == 0)
        target |= code(r, c);
      if (grid[r][c] == 1) {
        sr = r;
        sc = c;
      } else if (grid[r][c] == 2) {
        tr = r;
        tc = c;
      }
    }
  memo = new Integer[R][C][1 << R * C];
  return dp(sr, sc, target);
}
public int code(int r, int c) {
  return 1 << (r * C + c);
}
public Integer dp(int r, int c, int todo) {
  if (memo[r][c][todo] != null)
    return memo[r][c][todo];
  if (r == tr && c == tc) {
    return todo == 0 ? 1 : 0;
  }
  int ans = 0;
  for (int k = 0; k < 4; ++k) {
    int nr = r + dr[k];
    int nc = c + dc[k];
    if (0 <= nr && nr < R && 0 <= nc && nc < C) {
      if ((todo & code(nr, nc)) != 0)
        ans += dp(nr, nc, todo ^ code(nr, nc));
    }
  }
  memo[r][c][todo] = ans;
  return ans;
}
```

- [@HARD LeetCode 847 - Shortest Path Visiting All Nodes](https://leetcode.com/articles/shortest-path-visiting-all-nodes/)
  - [BFS: visited = new boolean[n][1 << n], queue stores node and all visied nodes](https://github.com/cherryljr/LeetCode/blob/master/Shortest%20Path%20Visiting%20All%20Nodes.java)
  - [BFS: dist = new int[1<<N][N] stores the step](https://leetcode.com/articles/shortest-path-visiting-all-nodes/)
  - [dp + bit masks](https://leetcode.com/articles/shortest-path-visiting-all-nodes/)
    - answer(cover, head) is min(1 + answer(cover | (1<<child), child) for child in graph[head])
```java
public int shortestPathLength(int[][] graph) {
    int N = graph.length;
    int dist[][] = new int[1 << N][N];
    for (int[] row: dist) Arrays.fill(row, N*N);
    for (int x = 0; x < N; ++x) dist[1<<x][x] = 0;
    for (int cover = 0; cover < 1 << N; ++cover) {
        boolean repeat = true;
        while (repeat) {
            repeat = false;
            for (int head = 0; head < N; ++head) {
                int d = dist[cover][head];
                for (int next: graph[head]) {
                    int cover2 = cover | (1 << next);
                    if (d + 1 < dist[cover2][next]) {
                        dist[cover2][next] = d+1;
                        if (cover == cover2) repeat = true;
                    }
                }
            }
        }
    }
    int ans = N*N;
    for (int cand: dist[(1<<N) - 1])
        ans = Math.min(cand, ans);
    return ans;
}
```
